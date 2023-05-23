class Institution < ApplicationRecord
  # association(see also the schema https://kitt.lewagon.com/db/101668)
  has_many :institutionspractices
  has_many :practices, through: :institutionspractices
  has_many :cards

  # validation
  validates_presence_of :name, :address, :phone
end
