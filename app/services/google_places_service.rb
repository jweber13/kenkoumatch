require 'google_places'

class GooglePlacesService
  def self.search_medical_institutions(address, practice)
    client = GooglePlaces::Client.new(ENV['GOOGLE_API_SERVER_KEY'])
    options = { types: 'hospital', keyword: practice }
    places = @client.spots_by_query(address, options)

    places.map do |place|
      {
        name: place.name,
        address: place.formatted_address,
        latitude: place.lat,
        longitude: place.lng
      }
    end
  end

end
