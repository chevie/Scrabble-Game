require 'rails_helper'

RSpec.describe WordScoresController, type: :controller do
  
  # Define variable to be used in multiple specs
  let(:word_score){WordScore.create(word: "foo", score: 45)}

  describe "GET #index" do
    it "assigns all word_scores as @word_scores" do
      word_score2 = WordScore.create(word: "bar", score: 35)
      get :index
      expect(assigns(:word_scores)).to include(word_score, word_score2)
    end
  end

  describe "GET #show" do
    it "assigns the requested word_score as @word_score" do
      get :show, {:id => word_score.to_param}
      expect(assigns(:word_score)).to eq(word_score)
    end
  end

  describe "GET #new" do
    it "assigns a new word_score as @word_score" do
      get :new
      expect(assigns(:word_score)).to be_a_new(WordScore)
    end
  end

  describe "POST #create" do
    context "with a valid word" do
      it "creates a new WordScore" do
        expect {
          post :create, {word_score: {word: "foo"}}
        }.to change(WordScore, :count).by(1)
      end
      
      it 'calculates the score of the word' do
        post :create, {:word_score => {word: "foo"}}
        expect( WordScore.find_by(word: "foo").score).to eq 6
      end
      
      it 'converts the word to lowercase' do
        post :create, {:word_score => {word: "FoO"}}
        expect( WordScore.last.word).to eq "foo"
      end

      it "assigns a newly created word_score as @word_score" do
        post :create, {:word_score => {word: "foo"}}
        expect(assigns(:word_score)).to be_a(WordScore)
        expect(assigns(:word_score)).to be_persisted
      end

      it "redirects to the created word_score" do
        post :create, {:word_score => {word: "foo"}}
        expect(response).to redirect_to(WordScore.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved word_score as @word_score" do
        post :create, {:word_score => {word: "f00"}}
        expect(assigns(:word_score)).to be_a_new(WordScore)
      end
      
       it "does not create a new WordScore" do
        expect {
          post :create, {word_score: {word: "f00"}}
        }.to change(WordScore, :count).by(0)
      end

      it "re-renders the 'new' template" do
        post :create, {:word_score => {word: "f00"}}
        expect(response).to render_template("new")
      end
    end
  end
end
