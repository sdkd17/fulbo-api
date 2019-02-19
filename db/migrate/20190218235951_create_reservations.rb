class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :player, foreign_key: true
      t.references :court, foreign_key: true
      t.datetime :date

      t.timestamps
    end

    add_index :reservations, :date
    add_index :reservations, [:court_id, :date], unique: true
    add_index :reservations, [:player_id, :court_id, :date], unique: true
  end
end
