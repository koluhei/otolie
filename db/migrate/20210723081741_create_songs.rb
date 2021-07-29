class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.string :audio, null: false
      t.text :description, null: false
      t.integer :genre_id, null: false
      t.integer :price, null: false
      t.string :image
      t.references :creator, foreign_key: true
      t.timestamps
    end
  end
end
