require 'rails_helper'

RSpec.describe Content, type: :model do
  it "has a valid factory" do
    @content = FactoryGirl.create(:content)
    expect(@content).to be_valid
  end

  it { should validate_presence_of :title }
  
  it { should validate_presence_of :type }
  
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.0) }
  
  it { should validate_inclusion_of(:quality).in_array(["SD", "HD"]) }

  it "has a default price of 2.99" do
    @content = Content.new
    expect(@content.price).to eq(2.99)
  end
end
