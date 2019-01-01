class MainController < ApplicationController
	def welcome

	end

	def schedule
		
	end

	def stream
		@rooms = Room.all
		@local_data = {}
		if params[:pi_id]
			@local_data = {
			  "url"  => @stream_room.link,
			  "size"  => "25,25,1470,837"
			}.to_json.html_safe
			@pi = Pi.find(params[:pi_id])
			@stream_room = Room.find(@pi.room_id)
		else
			@stream_room = Room.where(name: params["room"])
			unless @stream_room
				@stream_room = Room.where(name: params[:room]).first || Room.where(name: "Panels 1").first
			end
		end
		@panel = @stream_room.get_next(Time.now)
	end

	def combined
		@rooms = Room.all
		@local_data = {}
		if params[:pi_id]
			@local_data = {
			  "url"  => @stream_room.link,
			  "size"  => "25,25,1470,837"
			}.to_json.html_safe
			@pi = Pi.find(params[:pi_id])
			@stream_room = Room.find(@pi.room_id)
		else
			@stream_room = Room.where(name: params[:room]).first || Room.where(name: "Panels 1").first
		end
		@panel = @stream_room.get_next(Time.now)

		@events = {
			"panels" => [],
			"mages"  => [],
			"music"  => []
		}
		@rooms.each do |r|
			panel = r.get_next(Time.now)
			if panel
				obj = {
					"name" => panel.name,
					"start" => Time.at(panel.start_unix) - 5.hours,
					"end"    => Time.at(panel.end_unix) - 5.hours,
					"room"   => r.name,
					"unique" => "#{r.id}#{panel.id}"
				}
				@events["panels"] << obj if ['Panels 1', 'Panels 2', 'Panels 3', 'Panels 4'].include?(r.name)
				@events["mages"]  << obj if ['MAGES 1', 'MAGES 2', 'Forge', 'Forum'].include?(r.name)
				@events["music"]  << obj if ['Concerts', 'Chipspace', 'Jam Clinic'].include?(r.name)
			end
		end

	end
end
