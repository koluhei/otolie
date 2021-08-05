class OrderRequest
  include ActiveModel::Model
  attr_accessor :purpose, :demand, :order_id, :user_id, :plan_id, :token

  with_options presence: true do
    validates :purpose
    validates :demand
    validates :user_id
    validates :plan_id
  end

  def save
    order = Order.create(plan_id: plan_id, user_id: user_id)
    Request.create(purpose: purpose, demand: demand, order_id: order.id)
  end
end