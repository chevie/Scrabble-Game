require 'rails_helper'

RSpec.describe "word_scores/index", type: :view do
  before(:each) do
    assign(:word_scores, [
      WordScore.create!(
        :word => "Word",
        :score => 1
      ),
      WordScore.create!(
        :word => "Word",
        :score => 1
      )
    ])
  end

  it "renders a list of word_scores" do
    render
    assert_select "tr>td", :text => "Word".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
