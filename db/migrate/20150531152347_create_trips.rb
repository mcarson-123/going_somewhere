class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :location_name
      t.point :latlong
      t.integer :duration_days
      t.string :name
      t.timestamps null: false
    end
  end
end
