class TicketsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    @tickets = Ticket.all

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

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to(@ticket, :notice => 'Ticket criado com sucesso.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to(@ticket, :notice => 'Ticket atualizado com sucesso.') }
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
end
