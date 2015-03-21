describe "Movies API" do
  it 'sends a list of movies order by creation' do
    FactoryGirl.create_list(:movie, 10)

    get '/movies'

    expect(response).to be_success

    expect(json['data'].length).to eq(10)

    expect(json['data']).to eq json['data'].sort{ |a, b| a["created-at"] <=> b["created-at"] }
  end

  it 'retrieves a specific movie' do
    movie = FactoryGirl.create(:movie)
    
    get "/movies/#{movie.id}"

    expect(response).to be_success

    expect(json['data']['title']).to eq(movie.title)
  end
end