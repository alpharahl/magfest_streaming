module RoomsHelper
  def self.get_current_panels
    current_time = ENV['STUB_TIME'].empty? ? Time.now : Time.parse(ENV['STUB_TIME'])
    panels_list = DataPopulater.get_json_of_panels
    panels_list.delete_if{|panel|
      panel["start_unix"] > (current_time + 5.hours + 15.minutes).to_i or
      panel["end_unix"] < (current_time + 5.hours).to_i
    }
    # Force order by start time
    panels_list.sort!{|a, b|
      a["start_unix"] <=> b["start_unix"]
    }
     return panels_list
  end
end
