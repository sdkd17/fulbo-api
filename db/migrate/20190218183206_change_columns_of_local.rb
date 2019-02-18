class ChangeColumnsOfLocal < ActiveRecord::Migration[5.1]
  def change
  	change_column_null :locals, :name, false
  	change_column_null :locals, :address, false
  	change_column_null :locals, :email, false
  	change_column_null :locals, :opens, false
  	change_column_null :locals, :closes, false
  end
end
