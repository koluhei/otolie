class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :creator
  has_many :messages
end
