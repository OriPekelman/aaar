require 'spec_helper'

describe "activity_scores/index" do
  before(:each) do
    assign(:activity_scores, [
      stub_model(ActivityScore,
        :repo_id => "Repo",
        :year => 1,
        :week => 2,
        :pulls => 3,
        :issues_close => 4,
        :issues_comments => 5,
        :commits => 6,
        :commits_change => 7
      ),
      stub_model(ActivityScore,
        :repo_id => "Repo",
        :year => 1,
        :week => 2,
        :pulls => 3,
        :issues_close => 4,
        :issues_comments => 5,
        :commits => 6,
        :commits_change => 7
      )
    ])
  end

  it "renders a list of activity_scores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Repo".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
  end
end
