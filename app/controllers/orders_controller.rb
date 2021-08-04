class OrdersController < ApplicationController
  def index
    @plan = Plan.find(params[:plan_id])
    @order_request = OrderRequest.new
  end
end
