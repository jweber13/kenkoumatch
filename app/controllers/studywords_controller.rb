class StudywordsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @studywords = policy_scope(Studyword)
  end

  def create
    @word = Studyword.new
    authorize(@word)
    puts "creat is being hit "
    words = params[:_json]
    saved = []
    words.each do |word|
      if Studyword.find_by(english: word[2]).nil?
        newrd = Studyword.new(kanji: word[1], english: word[2], kana: word[0])
        newrd.user = current_user
        if newrd.save
          saved << word[2]
        end
      end
    end
    render json: { message: saved.to_json, status: :created }
  end
end
