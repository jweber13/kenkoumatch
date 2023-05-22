class PracticesController < ApplicationController
  def index
    @practices = policy_scope(Practice)
  end

  def show
    @practice = Practice.find(params[:id])
  end
end
