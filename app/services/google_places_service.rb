require 'google_places'

class GooglePlacesService
  def initialize
    @client = GooglePlaces::Client.new(ENV['GOOGLE_API_KEY'])
  end

  def search_places(location, radius, keyword)
    spots = @client.spots(location[:latitude], location[:longitude], keyword: keyword, radius: radius)
  end

end
