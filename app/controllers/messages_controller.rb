class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  def show
    id = params[:id]
    @message = Message.find(id)
  end
end
