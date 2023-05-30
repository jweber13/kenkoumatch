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
    google_places_id = params[:google_places_id]
    @practice = Practice.find(params[:practice_id])
    @institution = Institution.new
    authorize @institution
    raise
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
