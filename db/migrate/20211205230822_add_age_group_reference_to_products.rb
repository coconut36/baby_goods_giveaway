class AddAgeGroupReferenceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :products, :user_ages, column: :age_id
    add_index :products, :age_id
    change_column_null :products, :age_id, false
  end
end
