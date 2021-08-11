class MessagesController < ApplicationController
  before_action :others_move_to_index

  def index
    @chat = Chat.find(params[:chat_id])
    @messages = @chat.messages
    @message = Message.new
  end

  def create
    message = Message.create(message_params)
    redirect_to chat_messages_path(params[:chat_id])
  end

  private
  def others_move_to_index
    @chat = Chat.find(params[:chat_id])
    if user_signed_in? && current_user.id != @chat.user_id
      redirect_to root_path
    elsif creator_signed_in? && current_creator.id != @chat.creator_id
      redirect_to root_path
    end
  end
  
  def message_params
    if user_signed_in?
      params.require(:message).permit(:text).merge(chat_id: params[:chat_id], user_id: current_user.id)
    elsif creator_signed_in?
      params.require(:message).permit(:text).merge(chat_id: params[:chat_id], creator_id: current_creator.id)
    end
  end
end
