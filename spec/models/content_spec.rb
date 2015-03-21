require 'rails_helper'

RSpec.describe Content, type: :model do
  it "has a valid factory" do
    @content = FactoryGirl.build(:content)
    expect(@content).to be_valid
  end

  it { should validate_presence_of :title }
  
  it { should validate_presence_of :type }

  it { should have_many(:purchase_options) }
end
