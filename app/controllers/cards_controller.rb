class CardsController < ApplicationController
  def index
    @cards = policy_scope(Card)
  end

  def show
    @card = Card.find(params[:id])
    authorize(@card)
  end

  def new
    @card = Card.new
    authorize @card
  end

  def create
    @practice = Practice.find(params[:practice_id])
    @card = Card.new(card_params)
    @card.user = current_user
    @card.practice = @practice

    if @card.save
      redirect_to card_path(@card)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @card = Card.find(params[:id])
    authorize(@card)
    @card.destroy
    redirect_to cards_path
  end

  private
  # strong params

  def card_params
    params.require(:card).permit(:originalcontent, :translatedcontent, :cardkeywords)
  end
end
