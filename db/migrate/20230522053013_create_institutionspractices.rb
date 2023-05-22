class CreateInstitutionspractices < ActiveRecord::Migration[7.0]
  def change
    create_table :institutionspractices do |t|
      t.references :institution, null: false, foreign_key: true
      t.references :practice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
