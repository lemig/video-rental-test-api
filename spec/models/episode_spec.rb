require 'rails_helper'

RSpec.describe Episode, type: :model do
  it "has a valid factory" do
    @episode = FactoryGirl.build(:episode)
    expect(@episode).to be_a_new(Episode)
    expect(@episode).to be_valid
  end

  it { should validate_numericality_of(:number).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_presence_of(:season_id) }
  it { should validate_uniqueness_of(:number).scoped_to(:season_id) }

  it { should belong_to(:season) }
end
