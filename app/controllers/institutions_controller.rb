class InstitutionsController < ApplicationController
  def index
    # all institutionsfiltered by pundit policy(see app/policies)
    # address = params[:address]
    @practice = Practice.find_by(id: params[:practice_id])
    # raise
    # @clinics = GooglePlacesService.search_medical_institutions(current_location, practice)
    @institutions = policy_scope(Institution) # .where.not(latitude: nil, longitude: nil)# .where(id: @institutions.pluck(:id))

    # @markers = @institutions.map do |institution|
    #   {
    #     lat: institution.latitude,
    #     lng: institution.longitude
    #   }
    # end
  end

  def show
    detail = GooglePlacesService.details(params[:google_places_id])
    # google_places_id = params[:google_places_id]
    @practice = Practice.find(params[:practice_id])
    @institution = Institution.new
    authorize @institution

    @institution.name = detail.name
    @institution.address = detail.formatted_address
    @institution.website = detail.website
    @institution.info = detail.opening_hours['weekday_text']
    @institution.rating = detail.rating
    @institution.phone = detail.formatted_phone_number
    # @institution.latitude = detail.lat
    # @institution.longitude = detail.lan
    # @institution.photo_url = detail
    @institution.google_places_id = detail.place_id

    @institution.save

    # raise
    # @institution = Institution.find_by(google_places_id: google_places_id)
    # Handle the case when the institution is not found
    # if @institution.nil?
    #   flash[:error] = 'Institution not found'
    #   redirect_to root_path
    # end
  end

  private

  def current_location
    # Implement the logic to retrieve the current location
    # You can use geolocation APIs or IP-based location detection
    # For example, you can use the `request.location` object provided by the `geocoder` gem
    request.location&.address || 'Your Default Location'
  end
end
