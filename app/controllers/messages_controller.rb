class MessagesController < ApplicationController
  before_action :parse_message_params, only: :receive_message
  
  def index
    @messages = Message.all
  end
  
  def send_message
    
  end
  
  def receive_message
    @message = Message.create(from: params[:from], body: params[:body])
  end
  
  private
  
  def parse_message_params
    binding.pry
  end
end