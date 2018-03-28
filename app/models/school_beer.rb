class SchoolBeer < ApplicationRecord
  has_many :beers, dependent: :destroy
  has_many :beer_styles, dependent: :destroy
end
