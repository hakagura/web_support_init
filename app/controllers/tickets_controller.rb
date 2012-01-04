# encoding: utf-8
class TicketsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @tickets = Ticket.order("status = 'Open' DESC, status = 'Ongoing' DESC ").paginate(:page => params[:page], :per_page => 5)
    @tickets_id = @tickets.map(&:id).join(',')
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @ticket = Ticket.new
    @ticket.documents.build
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.user = current_user
    @ticket.status = "Open"

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to(@ticket, :notice => 'Ticket criado com sucesso!') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to(@ticket, :notice => 'Ticket atualizado com sucesso!') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to(tickets_url) }
    end
  end

  def encerrar
    Ticket.find(params[:id]).toggle_lock
    redirect_to tickets_url
  end
end
