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

  it "stores the price of the purchase option" do
    @purchase = FactoryGirl.build(:purchase)
    expect(@purchase.price).to be_nil
    @purchase.save!
    expect(@purchase.price).to eq(@purchase.purchase_option.price)
  end

  describe "#active? and validity_in_seconds" do
    before do
      @purchase = FactoryGirl.create(:purchase)
    end

    it "should be true before 2 days" do
      expect(@purchase).to be_active
      expect(@purchase.validity_in_seconds).to eq(2.days.value)
      
      Timecop.freeze(Time.now + 1.day) do
        expect(@purchase).to be_active, "in 1 day"
        expect(@purchase.validity_in_seconds).to eq(1.days.value)
      end
    end

    it "should be false after 2 days" do
      Timecop.freeze(Time.now + 3.days) do
        expect(@purchase).not_to be_active, "in 3 days"
        expect(@purchase.validity_in_seconds).to eq(-1.days.value)
      end
    end
  end

  it "prevent purchasing active content" do
    @purchase = FactoryGirl.build(:purchase)
    @purchase.user.stub(:active_purchase_options).and_return([])
    expect{ @purchase.save! }.not_to raise_error

    @purchase = FactoryGirl.build(:purchase)
    @purchase.user.stub(:active_purchase_options).and_return([@purchase.purchase_option])
    expect{ @purchase.save! }.to raise_error
  end
end
