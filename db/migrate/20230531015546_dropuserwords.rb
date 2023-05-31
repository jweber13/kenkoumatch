class Dropuserwords < ActiveRecord::Migration[7.0]
  def change
    drop_table :userwords
  end
end
