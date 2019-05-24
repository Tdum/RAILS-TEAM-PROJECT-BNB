class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.text :address
      t.string :party_type
      t.string :name
      t.text :description
      t.string :photo
      t.integer :guest_capacity
      t.integer :price

      t.timestamps
    end
  end
end
