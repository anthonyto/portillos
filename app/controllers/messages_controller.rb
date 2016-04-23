class MessagesController < ApplicationController
  
  def index
    @messages = Message.all
  end
  
  def new
    @message = Message.new
  end
  
  def outbound
    Message.outbound(message_params[:to])
    flash[:notice] = "Sent"
    redirect_to messages_path
  end
  
  def inbound
    @message = Message.create(from: params[:from], to: '+18582390241', body: params[:body])
  end
  
  private
  
  def message_params
    params.require(:message).permit(:to)
  end
end