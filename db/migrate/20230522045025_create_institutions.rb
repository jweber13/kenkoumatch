class CreateInstitutions < ActiveRecord::Migration[7.0]
  def change
    create_table :institutions do |t|
      t.string :name
      t.references :practice, null: false, foreign_key: true
      t.string :address
      t.string :website
      t.text :info
      t.integer :rating
      t.string :phone

      t.timestamps
    end
  end
end
