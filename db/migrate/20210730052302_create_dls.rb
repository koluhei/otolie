class CreateDls < ActiveRecord::Migration[6.0]
  def change
    create_table :dls do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.timestamps
    end
    add_index :dls, [:user_id, :song_id], unique: :true
  end
end
