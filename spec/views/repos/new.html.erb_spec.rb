require 'spec_helper'

describe "repos/new" do
  before(:each) do
    assign(:repo, stub_model(Repo,
      :name => "MyString",
      :user_id => "MyString",
      :forks => 1
    ).as_new_record)
  end

  it "renders new repo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", repos_path, "post" do
      assert_select "input#repo_name[name=?]", "repo[name]"
      assert_select "input#repo_user_id[name=?]", "repo[user_id]"
      assert_select "input#repo_forks[name=?]", "repo[forks]"
    end
  end
end
