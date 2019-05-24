class RemovePhotoToPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :photo
  end
end
