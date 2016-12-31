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

            if params[:pi_id]
                  pi = Pi.where(id: params[:pi_id]).first
                  @disp_room = Room.where(id: pi.room_id).first
            else
                  @disp_room = Room.where(name: "Panels 1").first
            end
	end

      def channels
            @pis = Pi.all
            @rooms = []
            Room.where.not(link: nil).each do |room|
                  @rooms << room
            end
      end

      def change_channel
            pi_num = params[:id][0..params[:id].index('-')-1].to_i
            p = Pi.find(pi_num)
            room = params[:id][params[:id].index('-')+1 .. -1]
            r = Room.find_by_name(room)
            p.room_id = r.id
            p.save!
            redirect_to "/channels"
      end
end
