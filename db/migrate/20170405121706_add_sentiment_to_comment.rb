class AddSentimentToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :sentiment, :string
    add_column :comments, :score, :decimal, precision: 3, scale: 2
  end
end
