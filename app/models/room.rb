class Room < ActiveRecord::Base
	def get_current(time)
	    Panel.where(room_id: self.id).each do |p|
	        if p.start_unix < time.to_i and p.end_unix > time.to_i
	        	return p
	        end
	    end
	    return nil # If no panel was found, then return nil
	end

	def get_next(time)
		Panel.where(room_id: self.id).order(start_unix: :asc).each do |p|
			if p.start_unix < time.to_i
				return p
			end
		end
		return nil
	end


	def display_current(time)
	    panel = get_current(time)
	    if panel
	        return "#{panel.name} <br>   #{panel.start[0..panel.start.index(" ")]} - #{panel.end[0..panel.end.index(" ")]}".html_safe	
	    else
	    	next_panel = get_next(time)
	    	if next_panel == nil
	    		return "Finished"
	    	else
	    		return "Break, Resuming at #{next_panel.start[0..next_panel.start.index(" ")]} <br> #{next_panel.name}".html_safe
	    	end
	    end
	end
end
