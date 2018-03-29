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
    user = create(:user)
    login_as(user, scope: :user)

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
    user = create(:user)
    login_as(user, scope: :user)

    visit bar_path(bar)
    page.click_link('', href: bar_checkins_path(bar, beer_id: beer.id))

    checkin = Checkin.last
    expect(current_path).to eq(edit_bar_checkin_path(bar_id:
      bar.id, id: checkin))
    expect(page).to have_css('h3', text: 'Fazer Checkin')
    expect(page).to have_css('li', text: checkin.full_description)
    expect(page).to have_css('label', text: 'Comentário')
    expect(page).to have_button('Check-in')
  end

  scenario 'checkin one beer' do
    beer = create(:beer)
    bar = create(:bar)
    BarBeer.create(bar: bar, beer: beer)
    user = create(:user)
    login_as(user, scope: :user)

    visit bar_path(bar)
    page.click_link('', href: bar_checkins_path(bar, beer_id: beer.id))
    click_on 'Check-in'

    expect(current_path).to eq(bar_path(bar))
    expect(page).to have_selector('li.checkin', text: beer.name)
    expect(page).to have_selector(".check_#{Checkin.first.created_at.to_i}")
  end

  scenario 'checkin a beer2' do
    beer = create(:beer)
    bar = create(:bar)
    BarBeer.create(bar: bar, beer: beer)
    user = create(:user)
    user.profile.update(name: 'Xulambis')
    login_as(user, scope: :user)

    visit bar_path(bar)
    page.click_link('', href: bar_checkins_path(bar, beer_id: beer.id))

    checkin = Checkin.last
    expect(current_path).to eq(
      edit_bar_checkin_path(bar_id: bar.id, id: checkin)
    )
    expect(page).to have_css('h3', text: 'Fazer Checkin')
    expect(page).to have_css('li', text: checkin.full_description)
    expect(page).to have_css('label', text: 'Comentário')
    expect(page).to have_button('Check-in')
  end

  scenario 'checkin one beer twice' do
    beer = create(:beer)
    bar = create(:bar)
    BarBeer.create(bar: bar, beer: beer)
    user = create(:user)
    login_as(user, scope: :user)

    visit bar_path(bar)
    page.click_link('', href: bar_checkins_path(bar, beer_id: beer.id))
    click_on 'Check-in'
    page.click_link('', href: bar_checkins_path(bar, beer_id: beer.id))
    click_on 'Check-in'

    expect(current_path).to eq(bar_path(bar))
    expect(page).to have_selector('li.checkin', text: beer.name)
    expect(page).to have_selector(".check_#{Checkin.first.created_at.to_i}")
    expect(page).to have_selector(".check_#{Checkin.last.created_at.to_i}")
  end
end
