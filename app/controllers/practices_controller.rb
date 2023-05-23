class PracticesController < ApplicationController
  def index
    # all practicies filtered by pundit policy(see app/policies)
    @practices = policy_scope(Practice)
    if params[:query].present?
      # @practices = @practices.global_search(params[:query])
      @practices = @practices.global_search(params[:query])
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.json { render json: @practices }
      format.text { render partial: "practices/list", locals: { practices: @practices }, formats: [:html] }
    end
  end

  def show
    @practice = Practice.find(params[:id])
    authorize @practice
  end
end

private

def practice_params
  params.require(:practice).permit(:name, :info, :photo)
end
