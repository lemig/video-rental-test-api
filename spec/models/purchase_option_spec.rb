require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do
  it "has a valid factory" do
    @purchase_option = FactoryGirl.build(:purchase_option)
    expect(@purchase_option).to be_valid
  end

  it { should validate_inclusion_of(:quality).in_array(["SD", "HD"]) }
  it { should validate_presence_of(:content_id) }

  it do
    should validate_numericality_of(:price)
    .is_greater_than_or_equal_to(0.0)
  end

  it { should belong_to(:content) }
  it { should have_many(:purchases) }

  describe "#purchasable?" do
    before do
      @purchase_option = FactoryGirl.create(:purchase_option)
    end

    it "should be true when no active purchase" do
      user = double("user", :id => 1)
      expect(user).to receive(:active_purchase_options).and_return([])
      expect(@purchase_option).to be_purchasable(user)
    end

    it "should be false when active purchase" do
      user = double("user", :id => 1)
      expect(user).to receive(:active_purchase_options).and_return([@purchase_option])
      expect(@purchase_option).not_to be_purchasable(user)
    end
  end
end
