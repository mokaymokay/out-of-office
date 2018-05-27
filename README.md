![out of office logo](https://user-images.githubusercontent.com/18123962/40588325-d88df4b4-61a9-11e8-974a-951c62ff7957.png)

### *out of office* is an app for finding your ideal working spot away from the office based on weather and location. It is made for digital nomads, freelancers, travelers, and dreamers.

## Built with:
* Ruby on Rails
* PostgreSQL
* [Google Maps API](https://cloud.google.com/maps-platform/)
* [Foursquare API](https://developer.foursquare.com/places-api)
* [OpenWeatherMap API](https://www.openweathermap.org/current)

## Description
The app uses the Google Maps Javascript API's Geolocation feature to locate the user and the OpenWeatherMap API to retrieve weather conditions of the user's current location. Our database is seeded using Foursquare's Places API with pre-built lists curated by the *out of office* team. Finally, we use the Google Maps Javascript API again to display each venue's location on their own pages.

## Usage Instructions
When a user opens the app for the first time, s/he needs to allow the use of geolocation, so the app can display the weather, as well as an inspirational quote, clothing recommendation, and venue recommendations, all based on weather conditions.

## Future
While the app currently covers all five boroughs of New York City, we want to expand to more cities and countries in the future. In addition, we believe that the 'full package' should contain a display of clothing suggestions with images and/or retail info so that our users will have the option of shopping according to the weather.

## Deployment
Live on Heroku: [out of office](https://out-of-office-nyc.herokuapp.com/)

## Authors
* **Kay Mok** - [mokaymokay](https://github.com/mokaymokay)
* **Danyale C. Walker** - [DanyaleCW](https://github.com/DanyaleCW)
* **Ronen Goren** - [ronengoren](https://github.com/ronengoren)


## Screenshots

Geolocation:
![Geolocation](https://user-images.githubusercontent.com/30246503/40590940-11e33cca-61d6-11e8-86ac-5273e2229233.png)

Venue Recommendations:
![Venue recommendations ](https://user-images.githubusercontent.com/18123962/40588450-5d6de8a0-61ab-11e8-8363-a92940746f69.png)

## Acknowledgement

### Credits:
* [Animated Weather Icons](https://codepen.io/joshbader/pen/EjXgqr)
* [Half Fuller Buttons](https://codepen.io/half-fuller/pen/GJwVLP)
* [Parallax Flipping Cards](https://codepen.io/tyrellrummage/full/wqGgLO/)
