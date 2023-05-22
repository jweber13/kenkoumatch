class CreatePracticekeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :practicekeywords do |t|
      t.references :practice, null: false, foreign_key: true
      t.references :medicalkeyword, null: false, foreign_key: true

      t.timestamps
    end
  end
end
