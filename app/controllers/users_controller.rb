class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    id = params[:id]
    @user = User.find(id)

    # Fetch the sent and received chats for the user
    @sent_chats = @user.sent_chats
    @received_chats = @user.received_chats
    @messages = @user.messages
    # @user.chats # All chats the user is part of
    # @user.messages # All messages sent by the user
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "Updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
