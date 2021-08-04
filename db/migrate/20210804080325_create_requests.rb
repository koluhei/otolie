class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :purpose, null: false
      t.text :demand, null: false
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
