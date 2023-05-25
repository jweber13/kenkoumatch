class AddJapaneseNameToPractices < ActiveRecord::Migration[7.0]
  def change
    add_column :practices, :japanese_name, :string
  end
end
