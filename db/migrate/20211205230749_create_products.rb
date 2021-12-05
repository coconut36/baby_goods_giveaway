class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :giver_id
      t.string :name
      t.text :description
      t.integer :age_id
      t.integer :category_id
      t.integer :gender
      t.string :image
      t.string :location

      t.timestamps
    end
  end
end
