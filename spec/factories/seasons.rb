# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :season, parent: :content, class: 'Season' do
    title "Shameless"
  end
end
