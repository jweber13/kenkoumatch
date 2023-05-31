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
    words.each do |word|
      nwrd = Studyword.new(kanji: word[1], english: word[2], kana: word[0])
      nwrd.user = current_user
      nwrd.save
    end
    render json: "hi".to_json, status: :created
  end
end
