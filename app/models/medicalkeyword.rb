class Medicalkeyword < ApplicationRecord
  # association(see also the schema https://kitt.lewagon.com/db/101668)
  has_many :practicekeywords, dependent: :destroy
  has_many :practices, through: :practicekeywords

  validates_presence_of :term

  # include PgSearch::Model
  # multisearchable against: [:term]
end
