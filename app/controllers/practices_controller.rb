class PracticesController < ApplicationController
  def index
    # all practicies filtered by pundit policy(see app/policies)
    @practices = policy_scope(Practice)
    if params[:query].present?
      # @practices = @practices.global_search(params[:query])
      @practices = @practices.global_search(params[:query])
    end
  end

  def show
    @practice = Practice.find(params[:id])
  end
end

private

def practice_params
  params.require(:practice).permit(:name, :info, :photo)
end
