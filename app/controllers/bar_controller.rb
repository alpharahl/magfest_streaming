
require 'json'

class BarController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    d = Datum.first
    Rails.logger.info(params[:blob])
    d.blob = params[:blob].to_json
    d.save!
    head :no_content
  end
end