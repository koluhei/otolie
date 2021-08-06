class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.references :creator, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
