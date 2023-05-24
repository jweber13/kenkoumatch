class CardsController < ApplicationController
  # include ".././services/openai_service"
  # require OpenaiService

  def index
    # @cards: all cards created by current user(scope ie defined in app/policies)
    @cards = policy_scope(Card) # pundit(authorization)
  end

  def show
    @card = Card.find(params[:id])
    authorize @card # pundit(authorization)
    @parse_service = CardsParseService.new(@card.cardkeywords)
    keysarray = @parse_service.parse_content
    @keywords = keysarray[0]
    @keyphrases = keysarray[1]
  end

  def new
    @card = Card.new
    @card.user = current_user
    @practice = Practice.find(params[:practice_id])
    authorize @card # pundit(authorization)
  end

  def create
    @practice = Practice.find(params[:practice_id])
    @card = Card.new(card_params)
    @card.user = current_user
    @card.practice = @practice
    authorize @card

    @card.translatedcontent = (DeepL.translate @card.originalcontent, nil, "JA").text

    # content = set_ai_prompt(@practice.name, params[:card][:originalcontent])
    content = set_ai_prompt(@practice.name, @card.translatedcontent)
    @openai_service = OpenaiService.new(content)

    # results = @openai_service.call
    @card.cardkeywords = @openai_service.call
    # @card.cardkeywords = "these cardkeywords should be replaced by what joe is doing"

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
    params.require(:card).permit(:originalcontent)
  end

  # prompt
  def set_ai_prompt(practice, input)
    content = "
    You are a Japanese medical interpreter. I would like you to analyze this text input describing a patient's symptoms in Japanese. Provide me with a Ruby hash in JSON-readable format, with the following contents:
1.  'keywords' => An array that contains 3-5 keyword hashes from the translated sentence (including the romaji phonetic spelling, and english translations of those keywords). The format should look like this: { 'english word' => '言葉, ひらがな, romaji'}
2. 'phrases' => An array 3 useful phrases (strings) that could help a 1st time visitor with no Japanese skill who is going to a #{practice} clinic explain their symptoms in Japanese, along with their English translations.
Your return input should look like this:
{ 'keywords' => [{'word 1 in english'=>'言葉1, ひらがな, romaji'}, {'word 2 in english'=>'言葉2, ひらがな, romaji'}, {'word 3 in english'=>'言葉3, ひらがな, romaji'}], 'phrases' => ['文章: english sentence', '文章: english sentence'] }
Here is the input: '#{input}'"
    return content
  end
end
