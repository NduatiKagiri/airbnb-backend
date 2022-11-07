class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :date_in
      t.string :date_out

      t.timestamps
    end
  end
end
