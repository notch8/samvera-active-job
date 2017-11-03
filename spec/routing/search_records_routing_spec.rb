require "rails_helper"

RSpec.describe SearchRecordsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/search_records").to route_to("search_records#index")
    end

    it "routes to #new" do
      expect(:get => "/search_records/new").to route_to("search_records#new")
    end

    it "routes to #show" do
      expect(:get => "/search_records/1").to route_to("search_records#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/search_records/1/edit").to route_to("search_records#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/search_records").to route_to("search_records#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/search_records/1").to route_to("search_records#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/search_records/1").to route_to("search_records#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/search_records/1").to route_to("search_records#destroy", :id => "1")
    end

  end
end
