describe "Libray API" do
  it 'fails without credentials' do
    get '/libraries'

    expect(response).not_to be_success

    expect(status).to eq(401)
    
    expect(body).to eq("Bad credentials")
  end

  it 'passes with proper credentials'  do
    user = FactoryGirl.create(:user)

    get '/libraries', { format: "json" }, { "HTTP_AUTHORIZATION" => "Token token=\"#{user.auth_token}\"" }

    expect(response).to be_success

    expect(status).to eq(200)
  end

  it 'returns active content order by time to watch'  do
    user = FactoryGirl.create(:user)
    
    FactoryGirl.create(:purchase, user_id: user.id)

    Timecop.freeze(Time.now + 12.hours) do
      FactoryGirl.create(:purchase, user_id: user.id)
    end
    
    Timecop.freeze(Time.now + 24.hours) do
      FactoryGirl.create(:purchase, user_id: user.id)
    end
    
    Timecop.freeze(Time.now + 36.hours) do
      FactoryGirl.create(:purchase, user_id: user.id)
    end

    Timecop.freeze(Time.now + 50.hours) do
      get '/libraries', { format: "json" }, { "HTTP_AUTHORIZATION" => "Token token=\"#{user.auth_token}\"" }
      
      expect(json['data'].length).to eq(3)

      expect(json['data']).to eq json['data'].sort{ |a, b| a["validity-in-seconds"].to_i <=> b["validity-in-seconds"].to_i }
    end
  end
end