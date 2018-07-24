class Place < ApplicationRecord
  include HTTParty
  validates :foursquare_id, uniqueness: true
  belongs_to :neighborhood
end
