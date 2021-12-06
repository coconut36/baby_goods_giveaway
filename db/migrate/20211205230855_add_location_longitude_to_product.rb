class AddLocationLongitudeToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :location_longitude, :float
  end
end
