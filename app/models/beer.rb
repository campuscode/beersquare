class Beer < ApplicationRecord
  has_many :bar_beers, dependent: :destroy
  has_many :bars, through: :bar_beers
end
