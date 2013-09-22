# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :repo do
    name "MyString"
    user_id "MyString"
    forks 1
  end
end
