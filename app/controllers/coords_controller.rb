require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather
    @latitude = 42.0538387
    @longitude = -87.67721
    your_api_key = "1157e966738c925c876d619c9fc2af02"

    url = "https://api.forecast.io/forecast/1157e966738c925c876d619c9fc2af02/#{@latitude},#{@longitude}"

    raw_data = open(url).read

    parsed_data = JSON.parse(raw_data)

    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]




    # Your code goes here.
    # url = ?
    # raw_data = ?
    # parsed_data = ?
    # @temperature = ?
    # @minutely_summary = ?
    # @hourly_summary = ?
    # @daily_summary = ?
  end
end
