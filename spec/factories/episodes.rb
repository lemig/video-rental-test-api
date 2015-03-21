# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :episode, parent: :content, class: 'Episode' do
    sequence(:number)
    season
  end
end
