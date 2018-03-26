class Bar < ApplicationRecord
  has_many :bar_beers, dependent: :destroy
  has_many :beers, through: :bar_beers
  has_many :checkins, dependent: :destroy
end
