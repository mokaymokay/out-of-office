class PlacesController < ApplicationController

  def index
  end

  def create
    @zip_code = params[:user][:zip_code]
    puts @zip_code
    weather_object = Weather.new(@zip_code)
    @weather = weather_object.get_weather()
    puts @weather["weather"][0]["id"]
    @places = Neighborhood.find_by("'#{@zip_code}' = ANY (neighborhoods.zip_code)").places
    @neighborhood = params[:user][:neighborhood]
    current_temp = @weather["main"]["temp"]
    if current_temp >= 80
      temp_feels = "outdoor"
    elsif current_temp < 80 && current_temp >= 70
      temp_feels = "warm"
    elsif current_temp < 60
      temp_feels = "cold"
    else
      temp_feels = "meh"
    end
    non_clothing_advices = Advice.where({category: "non-clothing", weather_category: temp_feels})
    @non_clothing_advice = non_clothing_advices[rand(non_clothing_advices.length)]
    clothing_advices = Advice.where({category: "clothing", weather_category: temp_feels})
    @clothing_advice = clothing_advices[rand(clothing_advices.length)]
  end

  def show
    @place = Place.find(params[:id])
  end

  def seed_lists
    # get JSON
    outdoor_access = JSON.parse(HTTParty.get("https://api.foursquare.com/v2/lists/5afeea15ea1e447791b625ce?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&v=20180323").body)
    indoors = JSON.parse(HTTParty.get("https://api.foursquare.com/v2/lists/5afeef2e3e6741556db872ee?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&v=20180323").body)
    outdoors_only = JSON.parse(HTTParty.get("https://api.foursquare.com/v2/lists/5b01b4f817556277cb13cb40?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&v=20180323").body)

    # save data to DB
    seed_by_list(outdoor_access, "outdoor access")
    seed_by_list(indoors, "indoors")
    seed_by_list(outdoors_only, "outdoors only")
  end

  # add neighborhood ID as foreign key
  def add_neighborhood_id
    places = Place.all
    places.each do |p|
      p.update(neighborhood_id: Neighborhood.where("'#{p.zip_code[0...5]}' = ANY (neighborhoods.zip_code)")[0].id)
    end
  end

  private

  def seed_by_list(list_name, weather_category)
    list_name['response']['list']['listItems']['items'].each do |data|
      Place.create(
        name: data['venue']['name'],
        street_address: data['venue']['location']['address'],
        cross_street: data['venue']['location']['crossStreet'],
        city: data['venue']['location']['city'],
        state: data['venue']['location']['state'],
        zip_code: data['venue']['location']['postalCode'],
        lat: data['venue']['location']['lat'],
        lng: data['venue']['location']['lng'],
        formatted_address: data['venue']['location']['formattedAddress'],
        image_url: data['photo']['prefix'] + data['photo']['width'].to_s + "x" + data['photo']['height'].to_s + data['photo']['suffix'],
        foursquare_id: data['venue']['id'],
        category: data['venue']['categories'][0]['name'],
        weather_category: weather_category
      )
    end
  end

end
