class ChangeColumnsOfUsers < ActiveRecord::Migration[5.1]
  def change
  	change_column_null :users, :nickname, false
  	change_column_null :users, :email, false
  	change_column_null :users, :name, false
  	change_column_null :users, :type, false

  	add_index :users, :nickname, unique: true
  	add_index :users, :email, unique: true

  end
end
