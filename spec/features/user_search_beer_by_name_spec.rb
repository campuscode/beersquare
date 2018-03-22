require 'rails_helper'

feature 'User search beer by name' do
  scenario 'successfully' do
    beer1 = create(:beer, name: 'KBS 2016', style: 'Imperial Russial Stout')
    beer2 = create(:beer, name: 'KBS 2018', style: 'Imperial Russial Stout')

    visit root_path
    fill_in 'Search',, with: 'KBS'
    click_on 'Buscar'

    expected(page).to have_css('li', text: 'KBS 2016, Estilo: Imperial Russial Stout, ABV: 11.9%, IBU: 70')
    expected(page).to have_css('li', text: 'KBS 2018, Estilo: Imperial Russial Stout, ABV: 11.9%, IBU: 70')
  end

  # scenario 'fail' do
  #
  # end
end
