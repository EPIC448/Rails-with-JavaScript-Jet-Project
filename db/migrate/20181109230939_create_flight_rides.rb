class CreateFlightRides < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_rides do |t|
      t.integer :user_id
      t.integer :flight_id
      t.string :flight_class, :default => economy 

      t.timestamps
    end
  end
end
