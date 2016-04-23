class MessagesController < ApplicationController
  before_action :parse_message_params, only: :receive
  
  def index
    @messages = Message.all
  end
  
  def new
  end
  
  def outbound
  end
  
  def inbound
    @message = Message.create(from: params[:from], body: params[:body])
  end
  
  private
  
  def parse_message_params
    binding.pry
  end
end