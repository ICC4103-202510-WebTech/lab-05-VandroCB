# app/controllers/chats_controller.rb
class ChatsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @chats = Chat.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end

  def show
    @chat = Chat.find(params[:id])
    authorize! :read, @chat
    @messages = @chat.messages.includes(:user).order(:created_at)
    @message = Message.new
  end

  def new
    @chat = Chat.new
    @users = User.where.not(id: current_user.id)
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.sender = current_user
    if @chat.save
      redirect_to @chat, notice: "Chat created successfully."
    else
      @users = User.where.not(id: current_user.id)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:receiver_id)
  end
end
