class AddGiverReferenceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :products, :users, column: :giver_id
    add_index :products, :giver_id
    change_column_null :products, :giver_id, false
  end
end
