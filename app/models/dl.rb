class Dl < ApplicationRecord
  
  attr_accessor :token

  with_options presence: true do
    validates :user_id
    validates :song_id
    validates :token
  end
  
  belongs_to :user
  belongs_to :song
end
