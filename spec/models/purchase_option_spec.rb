require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do
  it "has a valid factory" do
    @content = FactoryGirl.build(:content)
    expect(@content).to be_valid
  end

  it { should validate_inclusion_of(:quality).in_array(["SD", "HD"]) }
  it { should validate_presence_of(:content_id) }

  it do
    should validate_numericality_of(:price)
    .is_greater_than_or_equal_to(0.0)
  end

  it { should belong_to(:content) }
  it { should have_many(:purchases) }
end
