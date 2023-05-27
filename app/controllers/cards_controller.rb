class CardsController < ApplicationController
  def index
    # @cards: all cards created by current user(scope ie defined in app/policies)
    @cards = policy_scope(Card) # pundit(authorization)
  end

  def show
    @card = Card.find(params[:id])
    authorize @card
    cards_parse_service = CardsParseService.new
    @keywords = cards_parse_service.parse_content_show(@card.cardkeywords)
    @phrases = cards_parse_service.parse_content_show(@card.cardphrases)
    # pundit(authorization)
    # @parse_service = CardsParseService.new(@card.cardkeywords)
    # keysarray = @parse_service.parse_content
    # @keywords = keysarray[0]
    # if keysarray[1].is_a? Hash
    #   @keywords = keysarray[1].to_a
    # else
    #   @keyphrases = keysarray[1]
    # end
  end

  def new
    @card = Card.new
    @card.user = current_user
    @practice = Practice.find(params[:practice_id])
    authorize @card # pundit(authorization)
  end

  def create
    # create a new practice here, using params because we come from the params page
    @practice = Practice.find(params[:practice_id])
    # create a new card, with card_params which is  ONLY originalontent / the query made by the user
    @card = Card.new(card_params)

    # card needs a user and a practice
    @card.user = current_user
    @card.practice = @practice
    authorize @card

    # deepl
    @card.translatedcontent = (DeepL.translate @card.originalcontent, nil, "JA").text
    prompt = keywords_prompt(@card.translatedcontent)
    @openai_service = OpenaiService.new(prompt)

    # keys
    keywords = @openai_service.call
    @cardparse_service = CardsParseService.new(keywords)
    parsed_keywords = @cardparse_service.parse_content
    eng_keys = @cardparse_service.keys_english(parsed_keywords)

    # phrases
    @openai_service.update(phrases_prompt(eng_keys, @practice.name))
    phrases = @openai_service.call
    @cardparse_service.update(phrases)
    parsed_phrases = @cardparse_service.parse_content

    # save to card
    @card.cardkeywords = parsed_keywords
    @card.cardphrases = parsed_phrases

    # check if valid
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

  #gpt prompts

  def keywords_prompt(input)
    "Analyze this text input describing a patient's symptoms in Japanese. Give me a numbered list of 3-7 relevant keywords from the input. Each list item should include the word in kanji, its english translation, and its pronounciation in kana. input: #{input}"
  end

  def phrases_prompt(input, practice)
    "Give me a numbered list of 2 useful sentences in Japanese for a first-time patient at a #{practice} office, to help explain their symptoms. use 3-4 of the following keywords when creating the sentences. In addition to the Japanese, provide the kana pronouncation in this format, and the english translation: '日本語 - かな - english'. input: #{input}"
  end
end
