class AddLocationLatitudeToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :location_latitude, :float
  end
end
