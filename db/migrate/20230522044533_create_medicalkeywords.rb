class CreateMedicalkeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :medicalkeywords do |t|
      t.string :term

      t.timestamps
    end
  end
end
