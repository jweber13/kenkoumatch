class AddUserReferenceToStudywords < ActiveRecord::Migration[7.0]
  def change
    add_reference :studywords, :user, foreign_key: true
  end
end
