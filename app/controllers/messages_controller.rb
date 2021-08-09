class MessagesController < ApplicationController
  def index
    @chat = Chat.find(params[:chat_id])
    @message = Message.new
  end
end
