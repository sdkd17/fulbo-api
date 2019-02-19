class CreateLocals < ActiveRecord::Migration[5.1]
  def change
    create_table :locals do |t|
      t.string :name
      t.string :address
      t.string :phones
      t.string :email
      t.time :opens
      t.time :closes
      t.references :owner, foreign_key: true

      t.timestamps
    end
    add_index :locals, :name, unique: true
  end
end
