class ChangePlacePriceFloatToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :places, :price, :float
  end
end
