class Studyword < ApplicationRecord
  belongs_to :user

  validates_presence_of :english, :kanji
end
