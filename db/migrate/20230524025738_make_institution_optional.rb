class MakeInstitutionOptional < ActiveRecord::Migration[7.0]
  def change
    change_column_null :cards, :institution_id, true
  end
end
