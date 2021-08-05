class OrdersController < ApplicationController
  def index
    @plan = Plan.find(params[:plan_id])
    @order_request = OrderRequest.new
  end

  def create
    @plan = Plan.find(params[:plan_id])
    @order_request = OrderRequest.new(order_params)
    if @order_request.valid?
      pay_plan
      @order_request.save
      redirect_to root_path
    else
      render :index
    end
  end



  private
  def order_params
    params.require(:order_request).permit(:purpose, :demand).merge(token: params[:token], user_id: current_user.id, plan_id: params[:plan_id])
  end

  def pay_plan
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @plan.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
