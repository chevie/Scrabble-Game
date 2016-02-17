require 'rails_helper'

RSpec.describe "word_scores/new", type: :view do
  before(:each) do
    assign(:word_score, WordScore.new(
      :word => "MyString",
      :score => 1
    ))
  end

  it "renders new word_score form" do
    render

    assert_select "form[action=?][method=?]", word_scores_path, "post" do

      assert_select "input#word_score_word[name=?]", "word_score[word]"

      assert_select "input#word_score_score[name=?]", "word_score[score]"
    end
  end
end
