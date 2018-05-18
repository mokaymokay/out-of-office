class PlacesController < ApplicationController

  def seed
    # get JSON
    # result = Net::HTTP.get(URI.parse(`https://api.foursquare.com/v2/lists/5afeea15ea1e447791b625ce?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&v=20180323`))
    result = HTTParty.get('https://api.foursquare.com/v2/lists/5afeea15ea1e447791b625ce?client_id=' + ENV['FOURSQUARE_CLIENT_ID'] + '&client_secret=' + ENV['FOURSQUARE_CLIENT_SECRET'] + '&v=20180323')
    @parsed_result = JSON.parse(result.body)

    # save data to DB
    # json['results']['collection1'][1..-1].each do |data| # [1..-1] ignores first dummy element
    #   Stock.create(
    #     company: data['property1']['text'],
    #     url: data['url'],
    #     pe: data['property2'].gsub(',', ''), # .gsub removes thousands separator
    #     quote: data['property3'].gsub(',', '')
    #   )
    # end
  end
end
