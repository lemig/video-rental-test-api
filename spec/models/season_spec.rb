require 'rails_helper'

RSpec.describe Season, type: :model do
  it "has a valid factory" do
    @season = FactoryGirl.create(:season)
    expect(@season).to be_valid
  end
end
