require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it "has a valid factory" do
    @purchase = FactoryGirl.build(:purchase)
    expect(@purchase).to be_a_new(Purchase)
    expect(@purchase).to be_valid
  end

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:purchase_option_id) }

  it { should belong_to(:user) }
  it { should belong_to(:purchase_option) }

  it "stores the price of th purchase option" do
    @purchase = FactoryGirl.build(:purchase)
    expect(@purchase.price).to be_nil
    @purchase.save!
    expect(@purchase.price).to eq(@purchase.purchase_option.price)
  end
end
