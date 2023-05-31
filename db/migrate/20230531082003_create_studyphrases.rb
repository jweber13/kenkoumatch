class CreateStudyphrases < ActiveRecord::Migration[7.0]
  def change
    create_table :studyphrases do |t|
      t.string :kanji
      t.string :english
      t.string :kana
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
