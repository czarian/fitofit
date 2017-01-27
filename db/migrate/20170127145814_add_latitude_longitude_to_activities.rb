class AddLatitudeLongitudeToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :start_lat, :float, precision: 15, default: 0
    add_column :activities, :start_lon, :float, precision: 15, default: 0
    add_column :activities, :dest_lat, :float, precision: 15, default: 0
    add_column :activities, :dest_lon, :float, precision: 15, default: 0
  end
end
