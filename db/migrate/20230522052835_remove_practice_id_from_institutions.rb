class RemovePracticeIdFromInstitutions < ActiveRecord::Migration[7.0]
  def change
    remove_column :institutions, :practice_id, :integer
  end
end
