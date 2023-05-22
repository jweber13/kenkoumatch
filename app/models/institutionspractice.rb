# join table between institution and practice

class Institutionspractice < ApplicationRecord
  # association(see also the schema https://kitt.lewagon.com/db/101668)
  belongs_to :institution
  belongs_to :practice
end
