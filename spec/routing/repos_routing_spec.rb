require "spec_helper"

describe ReposController do
  describe "routing" do

    it "routes to #index" do
      get("/repos").should route_to("repos#index")
    end

    it "routes to #new" do
      get("/repos/new").should route_to("repos#new")
    end

    it "routes to #show" do
      get("/repos/1").should route_to("repos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/repos/1/edit").should route_to("repos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/repos").should route_to("repos#create")
    end

    it "routes to #update" do
      put("/repos/1").should route_to("repos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/repos/1").should route_to("repos#destroy", :id => "1")
    end

  end
end
