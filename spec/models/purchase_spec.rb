require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it "has a valid factory" do
    @purchase = FactoryGirl.build(:purchase)
    expect(@purchase).to be_a_new(Purchase)
    expect(@purchase).to be_valid
  end

  it do
    should validate_numericality_of(:price)
    .is_greater_than_or_equal_to(0.0)
  end

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:content_id) }

  it { should belong_to(:user) }
  it { should belong_to(:content) }
end
