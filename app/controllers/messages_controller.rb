# encoding: utf-8
class MessagesController < ApplicationController
  load_and_authorize_resource
  
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @message = @ticket.messages.create!(params[:message])
    redirect_to @ticket
  end

end
