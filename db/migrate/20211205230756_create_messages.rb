class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.text :text
      t.integer :product_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
