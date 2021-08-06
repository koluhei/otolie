class Message < ApplicationRecord
  validates :text, presence: true
  
  belongs_to :creator, optional: true
  belongs_to :user, optional: true
  belongs_to :chat
end
