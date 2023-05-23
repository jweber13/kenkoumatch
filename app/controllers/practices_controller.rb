class PracticesController < ApplicationController
  def index
    # all practicies filtered by pundit policy(see app/policies)
    @practices = policy_scope(Practice)
  end

  def show
    @practice = Practice.find(params[:id])
  end
end
