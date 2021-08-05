class Order < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_one :request
end
