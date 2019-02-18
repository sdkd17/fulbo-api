class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :name
      t.string :phones
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
