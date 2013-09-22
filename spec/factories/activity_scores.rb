# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity_score do
    repo_id "MyString"
    year 1
    week 1
    pulls 1
    issues_close 1
    issues_comments 1
    commits 1
    commits_change 1
  end
end
