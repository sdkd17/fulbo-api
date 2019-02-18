class CreateCourts < ActiveRecord::Migration[5.1]
  def change
    create_table :courts do |t|
      t.integer :number
      t.string :size
      t.boolean :indoor
      t.references :local, foreign_key: true
      t.string :type

      t.timestamps
    end

    add_index :courts, :number
    add_index :courts, [:number, :local], unique: true
  end
end
