module MainHelper
  def self.panel_tag(room_name)
    if room_name.include? "Tabletop" or ["Console", "Arcade", "Escape Room"].include? room_name or room_name.include? "LAN"
      return "gaming"
    elsif ["Concerts", "Chipspace", "Jam Clinic"].include? room_name
      return "music"
    else
      return "panel"
    end
  end
end


# "Autographs Red",
# "Autographs Blue",
# "Console",
# "Arcade"
# ],
# "panels" => []
# }
# floors[1] = {
# "rooms" => [],
# "panels" => []
# }
# floors[2] = {
# "rooms" => [
# "Panels 1",
# "Panels 2",
# "Panels 3",
# "Panels 4",
# "Forge",
# "Escape Room",
# "LAN 1",
# "LAN 2",
# "The Soapbox",
# "Mages 1",
# "Mages 2",
# "Forum",
# "Chipspace",
# "Concerts",
# "LAN Theater",
# "Jam Clinic",
# "Arena",
# "Games on Film",
# "Mega Man-athon 6"
# ],
# "panels" => []
# }
# floors[3] = {
# "rooms" => [
