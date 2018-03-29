class Checkin < ApplicationRecord
  belongs_to :bar
  belongs_to :beer
  belongs_to :user

  def full_description
    "#{name_email} degustou a #{beers} no #{bars} em #{date_formatter}"
  end

  private

  def bars
    bar.name
  end

  def beers
    beer.name
  end

  def name_email
    user.profile.name.nil? ? user.email : user.profile.name
  end

  def date_formatter
    created_at.strftime('%d/%m/%Y às %H:%M')
  end
end
