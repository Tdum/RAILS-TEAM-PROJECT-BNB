class ChangePlacePhotosJsonToString < ActiveRecord::Migration[5.2]
  def change
    change_column :places, :photos, :string
    rename_column :places, :photos, :photo
  end
end
