# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie, parent: :content, class: 'Movie' do
  end
end
