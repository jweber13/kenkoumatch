class Practice < ApplicationRecord
  # association(see also the schema https://kitt.lewagon.com/db/101668)
  has_many :institutionspractices, dependent: :destroy
  has_many :institions, through: :institutionspractices

  has_many :practicekeywords, dependent: :destroy
  has_many :medicalkeywords, through: :practicekeywords

  has_many :cards, dependent: :destroy

  validates_presence_of :name, :info

  include PgSearch::Model
  # multisearchable against: [:name, :info]

  pg_search_scope :global_search,
  against: [ :name, :info ],
  associated_against: {
    medicalkeywords: [ :term ]
  },
  using: {
    tsearch: { prefix: true }
  }

end
