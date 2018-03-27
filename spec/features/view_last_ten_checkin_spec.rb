require 'rails_helper'

feature 'user visit home' do
  scenario 'and view last 10 check in' do
    beer = create(:beer)
    beer1 = create(:beer, name: 'Paulaner')
    bar = create(:bar, name: 'bar0')
    bar1 = create(:bar, name: 'bar1')
    bar2 = create(:bar, name: 'bar2')
    bar3 = create(:bar, name: 'bar3')
    bar4 = create(:bar, name: 'bar4')
    bar5 = create(:bar, name: 'bar5')
    bar6 = create(:bar, name: 'bar6')
    bar7 = create(:bar, name: 'bar7')
    bar8 = create(:bar, name: 'bar8')
    bar9 = create(:bar, name: 'bar9')

    check = Checkin.create(bar: bar, beer: beer)

    visit beer_path(beer)

    expect(page).to have_content('Últimos checkins:')
    expect(page).to have_css('li', text: 'bar0' )
  end
end
