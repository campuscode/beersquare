class Beer < ApplicationRecord
  has_many :bar_beers
  has_many :bars, through: :bar_beers
end
