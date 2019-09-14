require "rails_helper"

RSpec.describe PartiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/parties").to route_to("parties#index")
    end

    it "routes to #new" do
      expect(:get => "/parties/new").to route_to("parties#new")
    end

    it "routes to #show" do
      expect(:get => "/parties/1").to route_to("parties#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/parties/1/edit").to route_to("parties#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/parties").to route_to("parties#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/parties/1").to route_to("parties#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/parties/1").to route_to("parties#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/parties/1").to route_to("parties#destroy", :id => "1")
    end
  end
end
