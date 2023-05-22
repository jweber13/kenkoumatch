class InstitutionsController < ApplicationController
  def index
    @institution = policy_scope(Institution)
  end

  def show
    @practice = Practice.find(params[:practice_id])
    @institution = Institution.find(params[:id])
  end
end
