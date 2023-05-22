class Practice < ApplicationRecord
  has_many :institutionspractices, dependent: :destroy
  has_many :institions, through: :institutionspractices

  has_many :practicekeywords, dependent: :destroy
  has_many :medicalkeywords, through: :practicekeywords

  has_many :cards, dependent: :destroy

  validates_presence_of :name, :info
end
