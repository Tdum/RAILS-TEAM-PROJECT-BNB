class AddPhotosToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :photos, :json
  end
end
