class AddCategoryReferenceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :products, :categories
    add_index :products, :category_id
    change_column_null :products, :category_id, false
  end
end
