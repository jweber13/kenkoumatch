class StudyphrasesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @studyphrases = policy_scope(Studyphrase)
  end

  def create
    @phrase = Studyphrase.new
    authorize(@phrase)
    puts "Create Phrase is being hit"
    phrases = params[:_json]
    # binding.pry
    saved = []
    phrases.each do |phrase|
      if Studyphrase.find_by(english: phrase[0]).nil?
        newphrase = Studyphrase.new(kanji: phrase[2], kana: phrase[1], english: phrase[0])
        newphrase.user = current_user
        if newphrase.save
          saved << phrase[0]
        end
      end
    end
    render json: { message: saved.to_json, status: :created }
  end
end
