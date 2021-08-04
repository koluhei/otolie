class Order < ApplicationRecord
  belongs_to :user
  belongs_to :song
  has_one :request
end
