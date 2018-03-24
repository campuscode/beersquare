class Beer < ApplicationRecord
  belongs_to :school_beer
  has_many :bar_beers, dependent: :destroy
  has_many :bars, through: :bar_beers
end
