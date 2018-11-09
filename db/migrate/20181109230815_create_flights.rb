class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.boolean :inspection, :default => false  # make sure to include in form of the creation of flight if inspection is true
      t.integer :fuel_cost
      t.string :destination
      t.integer :flight_departure
      t.integer :flight_sit

      t.timestamps
    end
  end
end
