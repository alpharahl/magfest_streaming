class MainController < ApplicationController
	def welcome
		@rooms = {
            :panels_1  => Room.find_by_name("Panels 1"),
            :panels_2  => Room.find_by_name("Panels 2"),
            :panels_3  => Room.find_by_name("Panels 3"),
            :panels_4  => Room.find_by_name("Panels 4"),
            :concerts  => Room.find_by_name("Concerts"),
            :chipspace => Room.find_by_name("Chipspace"),
            :megaman   => Room.find_by_name("Mega Man-athon 5"),
            :mages_1   => Room.find_by_name("MAGES 1"),
            :mages_2   => Room.find_by_name("MAGES 2"),
            :forum     => Room.find_by_name("Forum"),
            :arena     => Room.find_by_name("Arena"),
            :soapbox   => Room.find_by_name("The Soapbox"),
            :lan_1     => Room.find_by_name("LAN 1"),
            :lan_2     => Room.find_by_name("LAN 2"),
            :gof       => Room.find_by_name("Games on Film")
		}

    pi = Pi.where(id: params[:pi_id]).first


    if pi
			@disp_room = Room.where(id: pi.room_id).first
		else
			@disp_room = @rooms.first
		end
	end

	def schedule
		floors = []
		floors[0] = {
			"rooms" => [
				"Autographs Red",
				"Autographs Blue",
				"Console",
				"Arcade"
			],
			"panels" => []
		}
		floors[1] = {
			"rooms" => [],
			"panels" => []
		}
		floors[2] = {
			"rooms" => [
				"Panels 1",
				"Panels 2",
				"Panels 3",
				"Panels 4",
				"Forge",
				"Escape Room",
				"LAN 1",
				"LAN 2",
				"The Soapbox",
				"Mages 1",
				"Mages 2",
				"Forum",
				"Chipspace",
				"Concerts",
				"LAN Theater",
				"Jam Clinic",
				"Arena",
				"Games on Film",
				"Mega Man-athon 6"
			],
			"panels" => []
		}
		floors[3] = {
			"rooms" => [
				"Tabletop Discussions",
				"Tabletop CCG",
				"Tabletop Indie Showcase",
				"Tabletop"
			],
			"panels" => []
		}
		panels = []
		Room.all.each{|r| panels << r.get_next(Time.now)}
		floors.each do |floor|
			panels.each do |panel|
				if panel and floor["rooms"].include? panel.room.name
					floor["panels"] << panel
				end
			end
		end
		@floors = floors
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
