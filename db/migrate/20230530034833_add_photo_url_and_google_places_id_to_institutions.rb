class AddPhotoUrlAndGooglePlacesIdToInstitutions < ActiveRecord::Migration[7.0]
  def change
    add_column :institutions, :photo_url, :string
    add_column :institutions, :google_places_id, :string
  end
end
