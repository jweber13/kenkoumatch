# join table connecting practice and medicalkeyword

class Practicekeyword < ApplicationRecord
  # association(see also the schema https://kitt.lewagon.com/db/101668)
  belongs_to :practice
  belongs_to :medicalkeyword
end
