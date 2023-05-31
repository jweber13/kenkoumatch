class DropCardWord < ActiveRecord::Migration[7.0]
  def change
    drop_table :cardwords
  end
end
