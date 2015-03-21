require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "has a valid factory" do
    @movie = FactoryGirl.build(:movie)
    expect(@movie).to be_a_new(Movie)
    expect(@movie).to be_valid
  end

  describe 'default scope' do
    let!(:movie_one) { FactoryGirl.create(:movie, title: "Zombies") }
    let!(:movie_two) { FactoryGirl.create(:movie, title: "Asterix") }

    it 'orders by cretaion' do
      expect(Movie.all).to eq([movie_one, movie_two])
    end
  end
end
