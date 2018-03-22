class Bar < ApplicationRecord
  has_many :bar_beers
  has_many :beers, through: :bar_beers
end
