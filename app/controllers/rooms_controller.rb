require 'open-uri'

class RoomsController < ApplicationController
  def index
    @panels = RoomsHelper.get_current_panels
    @starts = []
    @ends   = []
    @panels.each do |panel|
      @starts << Time.now
    end
  end

  def populate
    DataPopulater.populate_panels
    head :no_content
  end

  def streaming

  end
end
