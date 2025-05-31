class MessagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :chat
  load_and_authorize_resource :message, through: :chat

  # Ensure that the user is authorized to perform actions on messages
  # This can be customized based on your authorization logic
  before_action :authorize_user!, only: [ :new, :create, :edit, :update ]

  # Define a method to check if the user is authorized
  def authorize_user!
    # Logic to check if the user is authorized to perform the action
    # For example, you might check if the user is part of the chat
    # or has permission to send messages.
  end
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
    @message.user = current_user

    if @message.save
      redirect_to chat_path(@chat)
    else
      @messages = @chat.messages.includes(:user).order(:created_at)
      render "chats/show", status: :unprocessable_entity
    end
  end

  def edit
    @message = Message.find(params[:id])
    @chats = Chat.includes(:sender, :receiver)
    @users = User.all
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to @message.chat, notice: "Message updated successfully."
    else
      @chats = Chat.includes(:sender, :receiver)
      @users = User.all
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:chat_id, :user_id, :body)
  end
end
