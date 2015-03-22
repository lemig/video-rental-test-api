require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    @user = FactoryGirl.build(:user)
    expect(@user).to be_valid
  end

  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }

  it { should have_many(:purchases).order(created_at: :desc) }
  it { should have_many(:purchase_options).through(:purchases) }

  it "should get an random authorization token" do
    users = FactoryGirl.create_list(:user, 2)
    auth_tokens = users.map(&:auth_token)

    expect(auth_tokens.all?(&:present?)).to be true   # present

    expect(auth_tokens.uniq!).to be_nil               # no duplicates
  end
end
