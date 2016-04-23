class MessagesController < ApplicationController
  # TODO read more about this
  skip_before_action :verify_authenticity_token, only: [:inbound]
  
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
    Message.create(
      from: inbound_message_params[:From],
      to: '+18582390241',
      body: inbound_message_params[:Body]
    )
    render nothing: true
  end
  
  private
  
  def message_params
    params.require(:message).permit(:to)
  end
  
  def inbound_message_params
    params.permit(:From, :Body)
  end
end