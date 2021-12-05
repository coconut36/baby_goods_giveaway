class AddLocationFormattedAddressToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :location_formatted_address, :string
  end
end
