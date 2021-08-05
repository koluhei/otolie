class OrdersController < ApplicationController

  before_action :only_user_can_order

  def index
    @creator = Creator.find(params[:creator_id])
    @plan = Plan.find(params[:plan_id])
    @order_request = OrderRequest.new
  end

  def create
    @creator = Creator.find(params[:creator_id])
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
  def pay_plan
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @plan.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_params
    params.require(:order_request).permit(:purpose, :demand).merge(token: params[:token], user_id: current_user.id, plan_id: params[:plan_id])
  end

  def only_user_can_order
    if creator_signed_in?
      redirect_to root_path
    elsif user_signed_in?
    else
      authenticate_user!
    end
  end
    
end
