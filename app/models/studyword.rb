class Studyword < ApplicationRecord
  has_many :cardwords
  has_many :cards, through: :cardwords

  validates_presence_of :english, :kanji
end
