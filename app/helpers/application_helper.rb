module ApplicationHelper

	def transl(status)
		case status
			when "Open"
				"Em aberto"
			when "Closed"
				"Fechado"
			when "Ongoing"
				"Em andamento"
			when "Outsourced"
				"Outsourced"
		end
	end
end
