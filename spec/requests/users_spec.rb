describe "Users API" do
  it 'fails without credentials' do
    get '/users'

    expect(response).not_to be_success

    expect(status).to eq(401)
    
    expect(body).to eq("Bad credentials")
  end

  it 'passes with proper credentials'  do
    user = FactoryGirl.create(:user)

    get '/users', { format: "json" }, { "HTTP_AUTHORIZATION" => "Token token=\"#{user.auth_token}\"" }

    expect(response).to be_success

    expect(status).to eq(200)
  end
end