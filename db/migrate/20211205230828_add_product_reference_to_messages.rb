class AddProductReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :products
    add_index :messages, :product_id
    change_column_null :messages, :product_id, false
  end
end
