require 'spec_helper'

describe "activity_scores/edit" do
  before(:each) do
    @activity_score = assign(:activity_score, stub_model(ActivityScore,
      :repo_id => "MyString",
      :year => 1,
      :week => 1,
      :pulls => 1,
      :issues_close => 1,
      :issues_comments => 1,
      :commits => 1,
      :commits_change => 1
    ))
  end

  it "renders the edit activity_score form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", activity_score_path(@activity_score), "post" do
      assert_select "input#activity_score_repo_id[name=?]", "activity_score[repo_id]"
      assert_select "input#activity_score_year[name=?]", "activity_score[year]"
      assert_select "input#activity_score_week[name=?]", "activity_score[week]"
      assert_select "input#activity_score_pulls[name=?]", "activity_score[pulls]"
      assert_select "input#activity_score_issues_close[name=?]", "activity_score[issues_close]"
      assert_select "input#activity_score_issues_comments[name=?]", "activity_score[issues_comments]"
      assert_select "input#activity_score_commits[name=?]", "activity_score[commits]"
      assert_select "input#activity_score_commits_change[name=?]", "activity_score[commits_change]"
    end
  end
end
