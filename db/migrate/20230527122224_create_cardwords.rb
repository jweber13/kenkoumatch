class CreateCardwords < ActiveRecord::Migration[7.0]
  def change
    create_table :cardwords do |t|
      t.references :studywords, null: false, foreign_key: true
      t.references :cards, null: false, foreign_key: true

      t.timestamps
    end
  end
end
