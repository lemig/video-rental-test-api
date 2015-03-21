require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    @user = FactoryGirl.build(:user)
    expect(@user).to be_valid
  end

  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
end
