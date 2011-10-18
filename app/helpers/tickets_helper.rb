module TicketsHelper
	def time_formater(secs)
		day = secs/86400;
	    hor = (secs-(day*86400))/3600
	    min = (secs-((day*86400)+(hor*3600)))/60
	    seg = secs-((day*86400)+(hor*3600)+(min*60))
	    return pad(day, 2)+"d "+pad(hor, 2)+"h "+pad(min, 2)+"m "+pad(seg, 2)+"s"
	end

	def pad(number, length)
		str = number.to_s
		while str.length < length do
		  str = '0' + str
		end
		return str
	end
end