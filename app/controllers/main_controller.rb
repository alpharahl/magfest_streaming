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
	end
end
