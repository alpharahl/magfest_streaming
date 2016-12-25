module MainHelper
	require 'open-uri'
	require 'json'

	def get_json_of_panels
		JSON.parse(open("https://super2017.uber.magfest.org/uber/schedule/panels_json").read)
	end

end
