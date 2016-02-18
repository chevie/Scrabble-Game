require 'rails_helper'

RSpec.describe "word_scores/new", type: :view do
  before(:each) do
    assign(:word_score, WordScore.new(
      :word => "MyString"
    ))
  end

  it "renders new word_score form" do
    render

    assert_select "form[action=?][method=?]", word_scores_path, "post" do

      assert_select "input#word_score_word[name=?]", "word_score[word]"
      
    end
  end
end
