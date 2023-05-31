class Studyphrase < ApplicationRecord
  belongs_to :user

  validates_presence_of :english, :kanji
end
