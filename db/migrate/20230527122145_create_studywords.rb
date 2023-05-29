class CreateStudywords < ActiveRecord::Migration[7.0]
  def change
    create_table :studywords do |t|
      t.string :english
      t.string :kanji
      t.string :romaji
      t.string :kana

      t.timestamps
    end
  end
end
