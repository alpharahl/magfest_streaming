class Room < ActiveRecord::Base
	def get_current(time)
	    Panel.where(room_id: self.id).each do |p|
	        if p.start_unix < (time).to_i and p.end_unix > (time).to_i
	        	return p
	        end
	    end
	    return nil # If no panel was found, then return nil
	end

	def get_next(time)
		Panel.where(room_id: self.id).order(start_unix: :desc).each do |p|
			return p if p.start_unix < (time).to_i
		end
		# Need to do a special case check for first panel
                Panel.where(room_id: self.id).order(start_unix: :asc).each do |p|
                  return p if p.start_unix >= (time).to_i
                end
		return nil
	end


	def display_current(time)
	    panel = get_current(time)
	    if panel
                start_time = DateTime.strptime((panel.start_unix - 5.hours.to_i).to_s, "%s")
                end_time   = DateTime.strptime((panel.end_unix - 5.hours.to_i).to_s, "%s")
	        return "#{panel.name} <br>  #{start_time.strftime("%a %I:%M %p")} - #{end_time.strftime("%I:%M %p")}".html_safe	
	    else
	    	next_panel = get_next(time)
                start_time = DateTime.strptime((next_panel.start_unix - 5.hours.to_i).to_s, "%s")
                end_time   = DateTime.strptime((next_panel.end_unix - 5.hours.to_i).to_s, "%s")
	    	if next_panel == nil
	    		return "Finished"
	    	else
	    		return "#{next_panel.name} <br> #{start_time.strftime("%a %I:%M %p")} - #{end_time.strftime("%I:%M %p")}".html_safe
	    	end
	    end
	end

	def display_name(url)
		#return self.name unless self.link.size > 0
		#return "<a href=\"#{url}/?room=Panels_1&autoplay=true\">#{self.name}</a>".html_safe
	end
end
