class DevicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def setup

  end

  def index
    render json: Device.where("location is not null").to_json
  end

  def setup_list
    render json: Device.all.to_json
  end

  def destroy
    Device.find(params[:id]).destroy
  end

  def update
    Device.find(params[:id])
      .update(params.permit(Device.attribute_names))
  end

  def channels
  end
end
