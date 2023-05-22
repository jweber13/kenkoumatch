class Card < ApplicationRecord
  belongs_to :user
  belongs_to :practice
  belongs_to :institution

  validates_presence_of :practice, :originalcontent, :translatedcontent, :cardkeywords
end
