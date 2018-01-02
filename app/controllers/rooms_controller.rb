class RoomsController < ApplicationController
  def index
    @panels = RoomsHelper.get_current_panels
    @starts = []
    @ends   = []
    @panels.each do |panel|
      @starts << Time.now
    end
  end
end
