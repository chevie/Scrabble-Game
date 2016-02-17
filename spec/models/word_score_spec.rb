require 'rails_helper'

RSpec.describe WordScore, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
  
  it {should respond_to(:word)}
  it {should respond_to(:score)}

  it "is invalid without a word" do
    scrabble_score = WordScore.new(score: 45)
    expect( scrabble_score ).to be_invalid
  end

  it 'is invalid without a score' do
    scrabble_score = WordScore.new(word: "hello")
    expect( scrabble_score ).to be_invalid
  end

  context 'word' do
    it 'is invalid if blank' do
      scrabble_score = WordScore.new(word: "", score: 45)
      expect( scrabble_score ).to be_invalid 
    end

    it 'is invalid if numerical' do
      scrabble_score = WordScore.new(word: "h3ll0", score: 45)
      expect( scrabble_score ).to be_invalid 
    end

    it 'is invalid with symbols' do
      scrabble_score = WordScore.new(word: "h$ll&", score: 45)
      expect( scrabble_score ).to be_invalid 
    end
  end

  context 'score' do
    it 'is invalid if nil' do
      scrabble_score = WordScore.new(word: "hello", score: nil)
      expect( scrabble_score ).to be_invalid 
    end

    it 'is invalid if alphabetical' do
      scrabble_score = WordScore.new(word: "hello", score: "5o")
      expect( scrabble_score ).to be_invalid 
    end

    it 'is invalid with symbols' do
      scrabble_score = WordScore.new(word: "hello", score: "5@")
      expect( scrabble_score ).to be_invalid 
    end
  end
end

