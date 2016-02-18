require 'rails_helper'

RSpec.describe WordScore, type: :model do

  # Check that the database accepts the required data
  it {should respond_to(:word)}
  it {should respond_to(:score)}

  # Test presence of a 'word'
  it "is invalid without a word" do
    scrabble_score = WordScore.new(score: 45)
    expect( scrabble_score ).to be_invalid
  end

  # Test presence of a 'score'
  it 'is invalid without a score' do
    scrabble_score = WordScore.new(word: "hello")
    expect( scrabble_score ).to be_invalid
  end

  # Test for rubbish input of a 'word'
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
    
    it 'is invalid with two words' do
      scrabble_score = WordScore.new(word: "foo bar", score: 45)
      expect( scrabble_score ).to be_invalid 
    end

    
    it 'returns an error message when invalid' do
      scrabble_score = WordScore.create(word: "h3ll0", score: 45)
      expect( scrabble_score.errors[:word] ).to eq ["can only have letters"]
    end
  end

  # Test for rubbish input of a 'score'
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
    
    it 'is invalid with a space' do
      scrabble_score = WordScore.new(word: "hello", score: "5 5")
      expect( scrabble_score ).to be_invalid 
    end
    
    it 'returns an error message when invalid' do
      scrabble_score = WordScore.create(word: "hello", score: "5@")
      expect( scrabble_score.errors[:score] ).to eq ["is not a number"]
    end
  end
end

