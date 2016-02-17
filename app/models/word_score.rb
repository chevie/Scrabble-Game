class WordScore < ActiveRecord::Base
    
  validates :word, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "A word can only have letters" }
  validates :score, presence: true, numericality: true
    
end
