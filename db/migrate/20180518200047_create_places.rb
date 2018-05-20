class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.text :street_address
      t.text :cross_street
      t.string :city
      t.string :state
      t.integer :zipcode
      t.text :formatted_address
      t.text :image_url
      t.string :foursquare_id
      t.string :category
      t.string :weather_category

      t.timestamps
    end
  end
end
