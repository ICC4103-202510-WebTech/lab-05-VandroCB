class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat
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
    @messages = Message.accessible_by(current_ability)
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
    @message = @chat.messages.build(message_params)
    @message.user = current_user

    if @message.save
      redirect_to @chat, notice: "Message sent!"
    else
      redirect_to @chat, alert: "Failed to send message."
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

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
