class Medicalkeyword < ApplicationRecord
  has_many :practicekeywords, dependent: :destroy
  has_many :practices, through: :practicekeywords

  validates_presence_of :term
end
