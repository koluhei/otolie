class ChatsController < ApplicationController

  before_action :move_to_index

  def create
    if user_signed_in?
      user_chatroom_already_exist?
    elsif creator_signed_in?
      creators_chatroom_already_exist?
    end
    redirect_to chat_messages_path(@chat.id)
  end


  private

  def user_chatroom_already_exist?
    if Chat.where(user_id: current_user.id, creator_id: params[:creator_id]).present?
      @chat = Chat.find_by(user_id: current_user.id, creator_id: params[:creator_id])
    else
      @chat = Chat.create(user_id: current_user.id, creator_id: params[:creator_id])
    end
  end

  def creators_chatroom_already_exist?
    if Chat.where(user_id: current_user.id, creator_id: params[:creator_id]).present?
      @chat = Chat.find_by(user_id: current_user.id, creator_id: params[:creator_id])
    else
      @chat = Chat.create(user_id: current_user.id, creator_id: params[:creator_id])
    end
  end

  def move_to_index
    if user_signed_in? || creator_signed_in?
    else
      redirect_to root_path
    end
  end
end
