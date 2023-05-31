require 'google_places'

class GooglePlacesService
  def self.details(place_id)
    @client = GooglePlaces::Client.new(ENV['GOOGLE_API_SERVER_KEY'])
    # options = { types: 'hospital', keyword: practice }
    @client.spot(place_id) # , fields: 'name,formatted_address,website,rating,formatted_phone_number,opening_hours,opening_hours,place_id')

    # places.map do |place|
    #     name: place.name,
    #     address: place.formatted_address,
    #     latitude: place.lat,
    #     longitude: place.lng
    #   }
    # end
  end
end
