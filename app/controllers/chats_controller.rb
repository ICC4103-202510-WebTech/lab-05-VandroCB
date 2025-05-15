class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end
  def show
    id = params[:id]
    @chat = Chat.find(id)
  end
  def new
    @chat = Chat.new
    @users = User.all
  end
  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to @chat, notice: "Chat created successfully."
    else
      @users = User.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end
end
