require 'spec_helper'

describe "repos/edit" do
  before(:each) do
    @repo = assign(:repo, stub_model(Repo,
      :name => "MyString",
      :user_id => "MyString",
      :forks => 1
    ))
  end

  it "renders the edit repo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", repo_path(@repo), "post" do
      assert_select "input#repo_name[name=?]", "repo[name]"
      assert_select "input#repo_user_id[name=?]", "repo[user_id]"
      assert_select "input#repo_forks[name=?]", "repo[forks]"
    end
  end
end
