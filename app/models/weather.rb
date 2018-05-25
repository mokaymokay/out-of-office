class Weather

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def get_weather
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?zip=" + @zip_code + ",us&units=imperial&APPID=#{ENV['OPEN_WEATHER_APP_ID']}")
  end
end
