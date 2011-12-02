class TicketObserver < ActiveRecord::Observer
	def after_create(ticket)
		Notification.ticket_criado(ticket).deliver
	end
end
