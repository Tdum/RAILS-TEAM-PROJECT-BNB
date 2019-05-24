class AddUserKeyToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_reference :places, :user, foreign_key: true
  end
end
