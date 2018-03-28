require 'rails_helper'

feature 'User' do
  scenario 'view no checkin' do
    beer = create(:beer)
    bar = create(:bar)
    BarBeer.create(bar: bar, beer: beer)

    visit bar_path(bar)

    expect(page).to have_css('h5', text: 'Últimos Checkins')
    expect(page).to have_content('Este bar ainda não recebeu nenhum checkin =(')
  end

  scenario 'existing beer' do
    beer = create(:beer)
    bar = create(:bar)
    BarBeer.create(bar: bar, beer: beer)

    visit bar_path(bar)

    expect(current_path).to eq(bar_path(bar))
    expect(page).to have_link(beer.name, href: beer_path(beer))
    expect(page).to have_link(
      '', href: bar_checkins_path(bar, beer_id: beer.id)
    )
  end

  scenario 'checkin a beer' do
    beer = create(:beer)
    bar = create(:bar)
    BarBeer.create(bar: bar, beer: beer)

    visit bar_path(bar)
    page.click_link('', href: bar_checkins_path(bar, beer_id: beer.id))

    expect(current_path).to eq(bar_path(bar))
    expect(page).to have_link(beer.name, href: beer_path(beer))
    expect(page).to have_link(
      '', href: bar_checkins_path(bar, beer_id: beer.id)
    )
    expect(page).to have_css('h5', text: 'Últimos Checkins')
    expect(page).to have_selector('.checkin', text: beer.name)
  end

  scenario 'checkin one beer twice' do
    beer = create(:beer)
    bar = create(:bar)
    BarBeer.create(bar: bar, beer: beer)

    visit bar_path(bar)
    page.click_link('', href: bar_checkins_path(bar, beer_id: beer.id))
    page.click_link('', href: bar_checkins_path(bar, beer_id: beer.id))

    expect(current_path).to eq(bar_path(bar))
    expect(page).to have_selector('li.checkin', text: beer.name)
    expect(page).to have_selector(".check_#{Checkin.first.created_at.to_i}")
    expect(page).to have_selector(".check_#{Checkin.last.created_at.to_i}")
  end
end
