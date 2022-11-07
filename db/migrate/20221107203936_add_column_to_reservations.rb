class AddColumnToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :date_in, :date
    add_column :reservations, :date_out, :string
  end
end
