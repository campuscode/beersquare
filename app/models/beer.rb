class Beer < ApplicationRecord
  has_many :bar_beers, dependent: :destroy
  has_many :bars, through: :bar_beers
  has_many :checkins, dependent: :destroy
end
