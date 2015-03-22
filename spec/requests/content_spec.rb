describe "Content API" do
  before do
    FactoryGirl.create_list(:movie, 3)

    FactoryGirl.create_list(:season, 2) do |season|
      2.times do
        season.episodes.create!(FactoryGirl.attributes_for(:episode))
      end
    end
  end

  it 'sends a list of contents order by creation' do
    get '/contents'#, filter: {content_type: "movies,seasons"}

    expect(response).to be_success

    expect(json['data'].length).to eq(9)

    expect(json['data']).to eq json['data'].sort{ |a, b| a["created-at"] <=> b["created-at"] }
  end

  it 'can filter by content_type' do
    get '/contents', filter: {content_type: "movies,seasons"}

    expect(response).to be_success

    expect(json['data'].length).to eq(5)
  end
end