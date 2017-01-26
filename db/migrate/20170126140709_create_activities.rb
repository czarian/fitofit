class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :start
      t.string :destination
      t.string :distance

      t.timestamps
    end
  end
end
