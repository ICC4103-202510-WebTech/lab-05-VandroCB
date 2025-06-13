class ChatsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    # Show only chats where current user is involved
    @chats = Chat.for_user(current_user)
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.messages.order(created_at: :asc)
    @new_message = Message.new(chat: @chat, user: current_user)
  end

  def new
    @chat = Chat.new
    @users = User.where.not(id: current_user.id) # Only show other users
  end

  def create
    # Check for existing chat first
    existing_chat = Chat.find_between(current_user, User.find(chat_params[:receiver_id]))

    if existing_chat
      redirect_to existing_chat, notice: "Redirected to existing chat."
      return
    end

    @chat = Chat.new(chat_params)
    @chat.sender = current_user

    if @chat.save
      redirect_to @chat, notice: "Chat started successfully."
    else
      @users = User.where.not(id: current_user.id)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @chat = Chat.find(params[:id])
    @users = User.all
  end

  def update
    @chat = Chat.find(params[:id])
    if @chat.update(chat_params)
      redirect_to @chat, notice: "Chat was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:receiver_id)
  end
end
