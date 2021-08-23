class OrdersController < ApplicationController

  before_action :only_user_can_order
  before_action :set_creator_and_plan

  def index
    @order_request = OrderRequest.new
  end

  def create
    @order_request = OrderRequest.new(order_params)
    sleep 2
    if @order_request.valid?
      pay_plan
      @order_request.save
      send_order_message_to_creator
      redirect_to chat_messages_path(@chat.id)
    else
      render :index
    end
  end



  private

  def set_creator_and_plan
    @creator = Creator.find(params[:creator_id])
    @plan = Plan.find(params[:plan_id])
  end

  def only_user_can_order
    if creator_signed_in?
      redirect_to root_path
    elsif user_signed_in?
    else
      authenticate_user!
    end
  end

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
  
  def send_order_message_to_creator
    if Chat.where(user_id: current_user.id, creator_id: params[:creator_id]).present?
      @chat = Chat.find_by(user_id: current_user.id, creator_id: params[:creator_id])
    else
      @chat = Chat.create(user_id: current_user.id, creator_id: params[:creator_id])
    end
    Message.create(text: "#{current_user.name}さんが『#{@plan.course}』で作曲依頼をしました。", user_id: current_user.id, chat_id: @chat.id)
    Message.create(text: "使用用途：\n#{@order_request.purpose}\n\n要望：\n#{@order_request.demand}", user_id: current_user.id, chat_id: @chat.id)
  end
end
