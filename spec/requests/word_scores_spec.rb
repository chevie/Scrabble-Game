require 'rails_helper'

RSpec.describe "WordScores", type: :request do
  describe "GET /word_scores" do
    it "works! (now write some real specs)" do
      get word_scores_path
      expect(response).to have_http_status(200)
    end
  end
end
