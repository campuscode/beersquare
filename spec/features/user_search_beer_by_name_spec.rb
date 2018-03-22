require 'rails_helper'

feature 'User search beer by name' do
  scenario 'successfully' do
    beer1 = Beer.create(name: 'KBS 2016', style: 'Imperial Russial Stout', abv:11.9, ibu:70)
    beer2 = Beer.create(name: 'KBS 2018', style: 'Imperial Russial Stout', abv:11.9, ibu:70)

    visit root_path
    fill_in 'Search', with: 'KBS 2016'
    click_on 'Buscar'

    expect(page).to have_css('li', text: 'KBS 2016, Estilo: Imperial Russial Stout, ABV: 11.9%, IBU: 70')
  end
end
