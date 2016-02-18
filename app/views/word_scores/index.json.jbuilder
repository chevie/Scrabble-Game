json.array!(@word_scores) do |word_score|
  json.extract! word_score, :word, :score
end
