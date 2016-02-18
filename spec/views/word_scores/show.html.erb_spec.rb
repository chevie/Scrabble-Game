require 'rails_helper'

RSpec.describe "word_scores/show", type: :view do
  before(:each) do
    @word_score = assign(:word_score, WordScore.create!(
      :word => "Word",
      :score => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Word/)
    expect(rendered).to match(/1/)
  end
end
