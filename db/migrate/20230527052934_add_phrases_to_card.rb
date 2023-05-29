class AddPhrasesToCard < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :cardphrases, :text
  end
end
