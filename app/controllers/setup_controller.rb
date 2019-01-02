class SetupController < ApplicationController
  def index
    device = Device.where(id: params[:id]).first
    if device && !device.location.nil?

      redirect_to action: :schedule, controller: :main, id: params[:id], pi: params[:pi]
    elsif device

    else
      Device.create!(ip: request.remote_ip, id: params[:id], internal_ip: params[:internal_ip])
    end
  end
end
