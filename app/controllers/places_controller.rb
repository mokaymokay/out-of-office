class PlacesController < ApplicationController

  def index
    @places = Place.where(zip_code: "10038")
  end

  def show
    @place = Place.find(params[:id])
  end

  def seed_lists
    # get JSON
    # NOTE: uncomment below only when seeding
    # outdoor_access = JSON.parse(HTTParty.get("https://api.foursquare.com/v2/lists/5afeea15ea1e447791b625ce?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&v=20180323").body)
    # indoors = JSON.parse(HTTParty.get("https://api.foursquare.com/v2/lists/5afeef2e3e6741556db872ee?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&v=20180323").body)
    # outdoors_only = JSON.parse(HTTParty.get("https://api.foursquare.com/v2/lists/5b01b4f817556277cb13cb40?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&v=20180323").body)

    # save data to DB
    # NOTE: uncomment below only when seeding
    # seed_by_list(outdoor_access, "outdoor access")
    # seed_by_list(indoors, "indoors")
    # seed_by_list(outdoors_only, "outdoors only")
  end

  # add neighborhood ID as foreign key
  def add_neighborhood_id
    # NOTE: uncomment below after seeding
    # places = Place.all
    # places.each do |p|
    #   p.update(neighborhood_id: Neighborhood.where("'#{p.zip_code[0...5]}' = ANY (neighborhoods.zip_code)")[0].id)
    # end
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
        formatted_address: data['venue']['location']['formattedAddress'],
        image_url: data['photo']['prefix'] + data['photo']['width'].to_s + "x" + data['photo']['height'].to_s + data['photo']['suffix'],
        foursquare_id: data['venue']['id'],
        category: data['venue']['categories'][0]['name'],
        weather_category: weather_category
      )
    end

  end

end
