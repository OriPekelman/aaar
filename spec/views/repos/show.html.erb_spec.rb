require 'spec_helper'

describe "repos/show" do
  before(:each) do
    @repo = assign(:repo, stub_model(Repo,
      :name => "Name",
      :user_id => "User",
      :forks => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/User/)
    rendered.should match(/1/)
  end
end
