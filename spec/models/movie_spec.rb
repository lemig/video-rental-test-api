require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "has a valid factory" do
    @movie = FactoryGirl.build(:movie)
    expect(@movie).to be_a_new(Movie)
    expect(@movie).to be_valid
  end
end
