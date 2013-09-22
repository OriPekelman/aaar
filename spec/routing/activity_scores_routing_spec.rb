require "spec_helper"

describe ActivityScoresController do
  describe "routing" do

    it "routes to #index" do
      get("/activity_scores").should route_to("activity_scores#index")
    end

    it "routes to #new" do
      get("/activity_scores/new").should route_to("activity_scores#new")
    end

    it "routes to #show" do
      get("/activity_scores/1").should route_to("activity_scores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/activity_scores/1/edit").should route_to("activity_scores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/activity_scores").should route_to("activity_scores#create")
    end

    it "routes to #update" do
      put("/activity_scores/1").should route_to("activity_scores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/activity_scores/1").should route_to("activity_scores#destroy", :id => "1")
    end

  end
end
