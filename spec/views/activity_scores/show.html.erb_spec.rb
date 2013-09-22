require 'spec_helper'

describe "activity_scores/show" do
  before(:each) do
    @activity_score = assign(:activity_score, stub_model(ActivityScore,
      :repo_id => "Repo",
      :year => 1,
      :week => 2,
      :pulls => 3,
      :issues_close => 4,
      :issues_comments => 5,
      :commits => 6,
      :commits_change => 7
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Repo/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
  end
end
