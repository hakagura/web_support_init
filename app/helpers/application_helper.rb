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
				"Aguardando"
		end
	end


 	def tab_to(name, all_options = nil)
	    url = all_options.is_a?(Array) ? all_options[0].merge({:only_path => false}) : all_options

	    current_url = url_for(:action => @current_action, :only_path => false)
	    html_options = {}

	    if all_options.is_a?(Array)
	      all_options.each do |o|
	        if url_for(o.merge({:only_path => false})) == current_url
	          html_options = {:class => "active"}
	          break
	        end
	      end
	    end

	    link_to(name, url, html_options)
	end

end
