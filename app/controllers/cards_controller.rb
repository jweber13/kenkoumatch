class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:redo, :redophrase]
  def index
    # @cards: all cards created by current user(scope ie defined in app/policies)
    @cards = policy_scope(Card) # pundit(authorization)
  end

  def show
    @card = Card.find(params[:id])
    @studywords = Studyword.where(user_id: current_user.id)
    @studyphrases = Studyphrase.where(user_id: current_user.id)
    authorize @card
    cards_parse_service = CardsParseService.new
    @keywords = cards_parse_service.parse_content_keys(@card.cardkeywords)
    @phrases = cards_parse_service.parse_content_phrases(@card.cardphrases)
  end

  def new
    @card = Card.new
    @institution = Institution.find(params[:institution_id]) unless params[:institution_id].nil?
    @card.user = current_user
    @practice = Practice.find(params[:practice_id])
    authorize @card # pundit(authorization)
  end

  def create
    @practice = Practice.find(params[:practice_id])
    @card = Card.new(card_params)

    # card needs a user and a practice
    @card.user = current_user
    @card.practice = @practice
    @card.institution = Institution.find(params[:card][:institution_id]) unless params[:card][:institution_id].nil?

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

  def redo
    @card = Card.find(params[:id])
    @studywords = Studyword.where(user_id: current_user.id)
    authorize @card

    jp_words = JSON.parse(@card.cardkeywords).map { |el| el[0] }
    # raise
    prompt = keywords_prompt2(jp_words, @card.practice.name)
    @openai_service = OpenaiService.new(prompt)

    # keys
    keywords = @openai_service.call1
    @cardparse_service = CardsParseService.new(keywords)
    parsed_keywords = @cardparse_service.parse_content

    @card.cardkeywords = parsed_keywords.to_json
    @card.save

    @keywords = parsed_keywords
    respond_to do |format|
      format.html
      format.text { render partial: "jkeyword", locals: { keywords: @keywords, studywords: @studywords }, formats: [:html] }
    end
  end

  def redophrase
    @card = Card.find(params[:id])
    authorize @card
    @studyphrases = Studyphrase.where(user_id: current_user.id)
    @cardparse_service = CardsParseService.new
    jp_words = JSON.parse(@card.cardkeywords).map { |el| el[0] }
    @openai_service = OpenaiService.new(phrases_prompt2(jp_words, @card.practice.name))

    phrases = @openai_service.call1
    @cardparse_service.update(phrases)
    parsed_phrases = @cardparse_service.parse_content
    @card.cardphrases = parsed_phrases.to_json
    @card.save

    @phrases = @cardparse_service.parse_content_phrases(parsed_phrases.to_json)
    respond_to do |format|
      format.html
      format.text { render partial: "jphrase", locals: { phrases: @phrases, studyphrases: @studyphrases }, formats: [:html] }
    end
  end

  def update
    raise
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

  # gpt prompts

  def keywords_prompt(input)
    "Analyze this text input describing a patient's symptoms in Japanese. Give me a numbered list of 2-7 relevant keywords from the input. Each list item should include the word in kanji, its english translation, and its pronounciation in kana. Use this format: '日本語 - かな - english'. input: #{input}"
  end

  def keywords_prompt2(words, practice)
    "Give me a numbered list of 4-6 new japanese keywords related to these words, that a patient can use in a #{practice} clinic: #{words}. Each list item should include the word in kanji, its english translation, and its pronounciation in kana. Use this format: '日本語 - かな - english'."
  end

  def phrases_prompt(input, practice)
    "Give me a numbered list of 3 useful and varied sentences in Japanese for a first-time patient to use at a #{practice} office, so they can help explain their symptoms. use some of the following keywords when creating the sentences:#{input}. In addition to the Japanese, provide the kana pronouncation in this format, and the english translation: '日本語 - かな - english'."
  end

  def phrases_prompt2(input, practice)
    "Give me a numbered list of 3-4 useful and varied sentences in Japanese for a first-time patient to use at a #{practice} office, so they can help explain their symptoms. use some of the following keywords when creating the sentences:#{input}. In addition to the Japanese, provide the kana pronouncation in this format, and the english translation: '日本語 - かな - english'."
  end
end
