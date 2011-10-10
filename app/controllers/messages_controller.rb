class MessagesController < ApplicationController
  load_and_authorize_resource
  
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @message = @ticket.messages.create!(params[:message])
    #@message = Message.create!(params[:message])
    #@message = Message.create!(params[:message])
  end

end
