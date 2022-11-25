class AddColumnToHouses < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :name, :string
    add_column :houses, :photo, :string
    add_column :houses, :price, :float
    add_column :houses, :location, :string
  end
end
