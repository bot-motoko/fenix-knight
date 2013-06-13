require "spec_helper"

describe BunchesController do
  describe "routing" do

    it "routes to #index" do
      get("/bunches").should route_to("bunches#index")
    end

    it "routes to #new" do
      get("/bunches/new").should route_to("bunches#new")
    end

    it "routes to #show" do
      get("/bunches/1").should route_to("bunches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bunches/1/edit").should route_to("bunches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bunches").should route_to("bunches#create")
    end

    it "routes to #update" do
      put("/bunches/1").should route_to("bunches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bunches/1").should route_to("bunches#destroy", :id => "1")
    end

  end
end
