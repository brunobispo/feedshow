class AddInstagramIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :instagram_id, :integer
    add_index :users, :instagram_id
  end
end
