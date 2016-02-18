require "rails_helper"

RSpec.describe WordScoresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/word_scores").to route_to("word_scores#index")
    end

    it "routes to #new" do
      expect(:get => "/word_scores/new").to route_to("word_scores#new")
    end

    it "routes to #show" do
      expect(:get => "/word_scores/1").to route_to("word_scores#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/word_scores").to route_to("word_scores#create")
    end
  end
end
