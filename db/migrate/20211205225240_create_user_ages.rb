class CreateUserAges < ActiveRecord::Migration[6.0]
  def change
    create_table :user_ages do |t|
      t.string :age_range

      t.timestamps
    end
  end
end
