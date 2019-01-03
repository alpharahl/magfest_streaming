require 'json'

class FooController < ApplicationController
  def index
    if Datum.first

      render json: Datum.first.blob
    else

      cells = []
      96.times do |y|
        row = []
        80.times do |x|
          row << Cell.create(x: x, y: y, walkable: false)
        end
        cells << row
      end
      d = Datum.create(blob: cells.to_json)
      render json: Datum.first.blob
    end
  end
end