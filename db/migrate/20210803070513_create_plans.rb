class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :course, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :delivery, null: false
      t.references :creator, foreign_key: true
      t.timestamps
    end
  end
end
