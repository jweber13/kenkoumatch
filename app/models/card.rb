class Card < ApplicationRecord
  # association(see also the schema https://kitt.lewagon.com/db/101668)
  belongs_to :user
  belongs_to :practice
  belongs_to :institution

  # validation
  validates_presence_of :practice, :originalcontent, :translatedcontent, :cardkeywords
end
