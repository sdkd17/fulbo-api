class ChangeColumnsOfCourts < ActiveRecord::Migration[5.1]
  def change
  	change_column_null :courts, :number, false
  	change_column_null :courts, :size, false
  	change_column_null :courts, :indoor, false
  	change_column_null :courts, :type, false
  end
end
