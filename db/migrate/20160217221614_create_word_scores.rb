class CreateWordScores < ActiveRecord::Migration
  def change
    create_table :word_scores do |t|
      t.string :word
      t.integer :score

      t.timestamps null: false
    end
  end
end
