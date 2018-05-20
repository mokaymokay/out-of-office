class PlacesController < ApplicationController

  def seed
    # get JSON
    outdoor_access = JSON.parse(HTTParty.get("https://api.foursquare.com/v2/lists/5afeea15ea1e447791b625ce?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&v=20180323").body)
    indoors = JSON.parse(HTTParty.get("https://api.foursquare.com/v2/lists/5afeea15ea1e447791b625ce?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&v=20180323").body)
    outdoors_only = JSON.parse(HTTParty.get("https://api.foursquare.com/v2/lists/5b01b4f817556277cb13cb40?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&v=20180323").body)

    # save data to DB
    outdoor_access['response']['list']['listItems']['items'].each do |data|
      Place.create(
        name: data['venue']['name'],
        street_address: data['venue']['location']['address'],
        cross_street: data['venue']['location']['crossStreet'],
        city: data['venue']['location']['city'],
        state: data['venue']['location']['state'],
        zipcode: data['venue']['location']['postalCode'],
        formatted_address: data['venue']['location']['formattedAddress'],
        image_url: data['photo']['prefix'] + data['photo']['width'].to_s + "x" + data['photo']['height'].to_s + data['photo']['suffix'],
        foursquare_id: data['venue']['id'],
        category: data['venue']['categories'][0]['name'],
        weather_category: "outdoor access"
      )
    end

    indoors['response']['list']['listItems']['items'].each do |data|
      Place.create(
        name: data['venue']['name'],
        street_address: data['venue']['location']['address'],
        cross_street: data['venue']['location']['crossStreet'],
        city: data['venue']['location']['city'],
        state: data['venue']['location']['state'],
        zipcode: data['venue']['location']['postalCode'],
        formatted_address: data['venue']['location']['formattedAddress'],
        image_url: data['photo']['prefix'] + data['photo']['width'].to_s + "x" + data['photo']['height'].to_s + data['photo']['suffix'],
        foursquare_id: data['venue']['id'],
        category: data['venue']['categories'][0]['name'],
        weather_category: "indoors"
      )
    end

    outdoors_only['response']['list']['listItems']['items'].each do |data|
      Place.create(
        name: data['venue']['name'],
        street_address: data['venue']['location']['address'],
        cross_street: data['venue']['location']['crossStreet'],
        city: data['venue']['location']['city'],
        state: data['venue']['location']['state'],
        zipcode: data['venue']['location']['postalCode'],
        formatted_address: data['venue']['location']['formattedAddress'],
        image_url: data['photo']['prefix'] + data['photo']['width'].to_s + "x" + data['photo']['height'].to_s + data['photo']['suffix'],
        foursquare_id: data['venue']['id'],
        category: data['venue']['categories'][0]['name'],
        weather_category: "outdoors only"
      )
    end

  end
end
