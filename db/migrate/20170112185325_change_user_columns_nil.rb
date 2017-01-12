class ChangeUserColumnsNil < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :email, from: false, to: true
    change_column_null :users, :encrypted_password, from: false, to: true
  end
end
