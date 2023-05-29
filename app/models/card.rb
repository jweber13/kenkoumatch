class Card < ApplicationRecord
  # association(see also the schema https://kitt.lewagon.com/db/101668)
  belongs_to :user
  belongs_to :practice
  belongs_to :institution, optional: true

  has_many :cardwords
  has_many :studywords, through: :cardwords

  # validation
  validates_presence_of :practice, :originalcontent, :translatedcontent, :cardkeywords
end
