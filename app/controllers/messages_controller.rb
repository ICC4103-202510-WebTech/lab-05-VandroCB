class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  def show
    id = params[:id]
    @message = Message.find(id)
  end

  def new
    @message = Message.new
    @chats = Chat.includes(:sender, :receiver)
    @users = User.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to @message.chat, notice: "Message sent!"
    else
      @chats = Chat.includes(:sender, :receiver)
      @users = User.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:chat_id, :user_id, :body)
  end
end
