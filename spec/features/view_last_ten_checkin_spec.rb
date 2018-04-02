require 'rails_helper'

feature 'user visit home' do
  scenario 'and view last 10 check in' do
    beer = create(:beer)
    bar0 = create(:bar, name: 'Meu Bar 0')
    user = create(:user)
    BarBeer.create(bar: bar0, beer: beer)
    Checkin.create(bar: bar0, beer: beer, user: user)

    visit beer_path(beer)

    expect(page).to have_content('Últimos Checkins')
    expect(page).to have_selector('li.checkin', text: bar0.name)
    expect(page).to have_selector(".check_#{Checkin.first.created_at.to_i}")
  end

  scenario 'hasn`t checkins' do
    beer = create(:beer)
    bar = create(:bar, name: 'Meu Bar')
    BarBeer.create(bar: bar, beer: beer)

    visit beer_path(beer)

    expect(page).to have_content('Seja o primeiro a fazer esse checkin')
  end
end
