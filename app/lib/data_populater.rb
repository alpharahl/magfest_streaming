class DataPopulater
    require 'open-uri'
    require 'json'
    class << self
	  def populate_panels
          Panel.delete_all
	      @panels_data = get_json_of_panels
		  @rooms = {}
		  names = []

		  # First pass we need to build the name array
		  @panels_data.each do |panel|
			end_of_room = panel["location"].size - 1
			end_of_room = panel["location"].index("(")-1 if panel["location"].include?('(')
			panel["location"] = panel["location"][0..end_of_room].strip
            names << panel["location"] unless names.include?(panel["location"])
            names.each do |rname|
            	unless @rooms[rname].present?
            		@rooms[rname] = []
            	end
            end
		end

        Room.transaction do 
		  @rooms.keys.each do |room|
		  	next if Room.where(name: room).first.present?
          	temp = Room.new
            temp.name = room
            temp.save
          end          
        end

        @panels_data.each do |panel|
        	room = Room.where(name: panel["location"]).first
        	p_obj = Panel.where(name: panel["name"]).first
        	p_obj = Panel.create(panel) unless p_obj
        	p_obj.room_id = room.id
        	p_obj.save!
        	Rails.logger.info p_obj.inspect
        	#p_obj.save
        end
        populate_panels
	  end
      handle_asynchronously :populate_panels, :run_at => Proc.new { 30.minutes.from_now }
    end


    def self.get_json_of_panels
        JSON.parse(open("https://super2017.uber.magfest.org/uber/schedule/panels_json").read)
    end
end