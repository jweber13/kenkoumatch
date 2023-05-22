class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :practice, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true
      t.text :originalcontent
      t.text :translatedcontent
      t.date :appointmentdate
      t.text :cardkeywords

      t.timestamps
    end
  end
end
