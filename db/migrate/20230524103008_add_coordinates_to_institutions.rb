class AddCoordinatesToInstitutions < ActiveRecord::Migration[7.0]
  def change
    add_column :institutions, :latitude, :float
    add_column :institutions, :longitude, :float
  end
end
