class Checkin < ApplicationRecord
  belongs_to :bar
  belongs_to :beer
  belongs_to :user

  def full_description
    username = user.profile.name.nil? ? user.email : user.profile.name
    "#{username} degustou a #{beer.name} no #{bar.name} em #{created_at}"
  end
end
