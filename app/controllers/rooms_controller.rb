require 'open-uri'

class RoomsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render json: Room.all.to_json
  end

  def current
    render json: RoomsHelper.get_current_panels.to_json
  end

  def populate
    DataPopulater.populate_panels
    head :no_content
  end

  def update_room
    r = Room.find(params[:id])
    r.update_attributes!(params.permit(:link, :streaming))
    head :no_content
  end

  def streaming
  end

  def streamable
    render json: Room.where(streaming: true).select(:id, :name).to_json
  end

  def channel
    render json: Room.find(params[:id]).select(:channel).to_json
  end
end
