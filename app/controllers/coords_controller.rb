require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather

    @address = params[:address]
    @url_safe_address = URI.encode(@address)

    url_coord = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=false"

    raw_data_coord = open(url_coord).read

    parsed_data_coord = JSON.parse(raw_data_coord)
   
    @latitude = parsed_data_coord["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data_coord["results"][0]["geometry"]["location"]["lng"]

    your_api_key = "1157e966738c925c876d619c9fc2af02"

    url = "https://api.forecast.io/forecast/1157e966738c925c876d619c9fc2af02/#{@latitude},#{@longitude}"

    raw_data = open(url).read

    parsed_data = JSON.parse(raw_data)

    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]



  end
end
