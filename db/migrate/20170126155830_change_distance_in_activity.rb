class ChangeDistanceInActivity < ActiveRecord::Migration[5.0]
  def change
    change_column :activities, :distance, :decimal, precision: 10, default: 0
  end
end
