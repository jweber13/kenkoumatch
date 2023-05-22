class Institution < ApplicationRecord
  has_many :institutionspractices
  has_many :practices, through: :institutionspractices
  has_many :cards

  validates_presence_of :name, :address, :phone
end
