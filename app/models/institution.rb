class Institution < ApplicationRecord
  # association(see also the schema https://kitt.lewagon.com/db/101668)
  has_many :institutionspractices
  has_many :practices, through: :institutionspractices
  has_many :cards

  # has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # validation
  validates_presence_of :name, :google_places_id
end
