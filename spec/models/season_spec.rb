require 'rails_helper'

RSpec.describe Season, type: :model do
  it "has a valid factory" do
    @season = FactoryGirl.build(:season)
    expect(@season).to be_a_new(Season)
    expect(@season).to be_valid
  end

  it { should have_many(:episodes).order('number') }
end
