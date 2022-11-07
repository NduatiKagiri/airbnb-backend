class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :photo
      t.float :price
      t.string :location

      t.timestamps
    end
  end
end
