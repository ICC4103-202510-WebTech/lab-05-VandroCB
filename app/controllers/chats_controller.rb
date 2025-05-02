class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end
  def show
    id = params[:id]
    @chat = Chat.find(id)
  end
  def new
  end
  def create
  end
end
