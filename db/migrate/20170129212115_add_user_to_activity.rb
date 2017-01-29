class AddUserToActivity < ActiveRecord::Migration[5.0]
  def change
    add_reference :activities, :user, index: true, foreign_key: true
  end
end
