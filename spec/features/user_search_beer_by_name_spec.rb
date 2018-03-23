require 'rails_helper'

feature 'User search beer by name' do
  scenario 'successfully' do
    beer1 = create(:beer)

    visit root_path
    fill_in 'Search', with: 'KBS 2016'
    click_on 'Buscar'

    expect(page).to have_css('li', text: 'KBS 2016')
    expect(page).to have_css('li', text: 'Estilo: Imperial Russial Stout')
    expect(page).to have_css('li', text: 'ABV: 11.9%')
    expect(page).to have_css('li', text: 'IBU: 70')
  end

  scenario 'and find more than one beers' do
    beer1 = create(:beer)
    beer2 = create(:beer, name: 'KBS 2018')

    visit root_path
    fill_in 'Search', with: 'KBS'
    click_on 'Buscar'

    expect(page).to have_css('li', text: 'KBS 2016')
    expect(page).to have_css('li', text: 'Estilo: Imperial Russial Stout')
    expect(page).to have_css('li', text: 'ABV: 11.9%')
    expect(page).to have_css('li', text: 'IBU: 70')
    expect(page).to have_css('li', text: 'KBS 2018')
  end

  scenario 'and not found' do
    beer1 = create(:beer)

    visit root_path
    fill_in 'Search', with: 'Bla'
    click_on 'Buscar'

    expect(page).to have_content('Cerveja não encontrada')
  end
end
