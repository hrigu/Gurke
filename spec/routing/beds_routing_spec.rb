require "spec_helper"


describe BedsController do
  describe "routing" do

    it "routes to #index" do
      get("/gardens/1/beds").should route_to(route_signatur(:action => "index"))
    end

    it "routes to #new" do
      get("/gardens/1/beds/new").should route_to(route_signatur(:action => "new"))
    end

    it "routes to #show" do
      get("/gardens/1/beds/1").should route_to route_signatur(:action => "show", :id => "1")
    end

    it "routes to #edit" do
      get("/gardens/1/beds/1/edit").should route_to route_signatur(:action => "edit", :id => "1")
    end

    it "routes to #create" do
      post("/gardens/1/beds").should route_to route_signatur(:action => "create")
    end

    it "routes to #update" do
      put("/gardens/1/beds/1").should route_to route_signatur(:action => "update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gardens/1/beds/1").should route_to route_signatur(:action => "destroy", :id => "1")
    end

    it "routes to  #update_add_plants" do
      put("/gardens/1/beds/1/update_add_plants").should route_to route_signatur(action: "update_add_plants", id: "1")
    end

  end
end

:private
def route_signatur(other_values = nil)
  signatur = {:controller => "beds", :garden_id => "1"}
  if other_values
    signatur.merge! other_values
  end
  signatur
end
