class ChangeDistanceToFloatInActivity < ActiveRecord::Migration[5.0]
  def change
    change_column :activities, :distance, :float, precision: 10, default: 0
  end
end
