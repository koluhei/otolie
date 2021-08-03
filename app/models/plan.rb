class Plan < ApplicationRecord
  with_options presence: true do
    validates :course
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 999999 }
    validates :delivery
    validates :creator_id
  end

  belongs_to :creator
end
