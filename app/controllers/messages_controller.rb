class MessagesController < ApplicationController
  # TODO read more about this
  skip_before_action :verify_authenticity_token, only: [:inbound]
  
  def index
    @messages = Message.from_other_numbers
  end
  
  def new
    @message = Message.new
  end
  
  def outbound
    begin
      Message.outbound(message_params[:to_number])
      flash[:notice] = "Sent"
    rescue Exception => e
      flash[:notice] = "#{e}"
    end
    redirect_to messages_path
  end
  
  def inbound
    Message.create(
      from_number: inbound_message_params[:From],
      to_number: '+18582390241',
      body: inbound_message_params[:Body]
    )
    render nothing: true
  end
  
  private
  
  def message_params
    params.require(:message).permit(:to_number)
  end
  
  def inbound_message_params
    params.permit(:From, :Body)
  end
end