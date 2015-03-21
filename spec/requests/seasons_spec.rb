describe "Season API" do
  it 'sends a list of seasons order by creation' do
    FactoryGirl.create_list(:season, 10)

    get '/seasons'

    expect(response).to be_success

    expect(json['data'].length).to eq(10)

    expect(json['data']).to eq json['data'].sort{ |a, b| a["created-at"] <=> b["created-at"] }
  end

  it 'sends a list of seasons with episodes ordered by number' do
    FactoryGirl.create_list(:season, 2) do |season|
      3.times do
        season.episodes.create(FactoryGirl.attributes_for(:episode))
      end
    end

    get '/seasons?include=episodes'

    seasons = json['data']

    episodes = json['linked']

    season_finder = Proc.new do |episode| 
      seasons.find{ |season| season['links']['episodes']['ids'].include? episode['id'] }
    end

    episodes_ordered_by_season_creation_and_episode_number = episodes.sort do |episode_a, episode_b|
      season_a = season_finder.call(episode_a)
      season_b = season_finder.call(episode_b)
      [season_a["created-at"], episode_a["number"]] <=> [season_b["created-at"], episode_b["number"]]
    end

    expect(response).to be_success

    expect(seasons.length).to eq(2)

    expect(episodes.length).to eq(6)

    expect(episodes).to eq episodes_ordered_by_season_creation_and_episode_number
  end
end