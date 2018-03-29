class Beer < ApplicationRecord
  belongs_to :beer_style
  has_many :bar_beers, dependent: :destroy
  has_many :bars, through: :bar_beers
  has_many :checkins, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged
end
