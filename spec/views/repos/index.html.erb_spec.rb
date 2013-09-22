require 'spec_helper'

describe "repos/index" do
  before(:each) do
    assign(:repos, [
      stub_model(Repo,
        :name => "Name",
        :user_id => "User",
        :forks => 1
      ),
      stub_model(Repo,
        :name => "Name",
        :user_id => "User",
        :forks => 1
      )
    ])
  end

  it "renders a list of repos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
