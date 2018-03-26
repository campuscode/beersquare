require 'rails_helper'

feature 'User search beer by name' do
  scenario 'successfully' do
    create(:beer)

    visit root_path
    fill_in 'q', with: 'KBS 2016'
    click_on 'Buscar'

    expect(page).to have_css('div.card-header', text: 'KBS 2016')
    expect(page).to have_css('li', text: 'Estilo: Imperial Russial Stout')
    expect(page).to have_css('li', text: 'ABV: 11.9%')
    expect(page).to have_css('li', text: 'IBU: 70')
  end

  scenario 'and find more than one beers' do
    beer1 = create(:beer, name: 'KBS 2016')
    beer2 = create(:beer, name: 'KBS 2018')

    visit root_path
    fill_in 'q', with: 'KBS'
    click_on 'Buscar'

    expect(page).to have_css('div.card-header', text: beer1.name)
    expect(page).to have_css('li', text: 'Estilo: Imperial Russial Stout')
    expect(page).to have_css('li', text: 'ABV: 11.9%')
    expect(page).to have_css('li', text: 'IBU: 70')
    expect(page).to have_css('div.card-header', text: beer2.name)
  end

  scenario 'and not found' do
    create(:beer)

    visit root_path
    fill_in 'q', with: 'Bla'
    click_on 'Buscar'

    expect(page).to have_content('Cerveja não encontrada')
  end

  scenario 'user view beer details' do
    create(:bar)
    beer = create(
      :beer,
      name: 'KBS 2016',
      style: 'Imperial Russial Stout',
      abv: 11.9,
      ibu: 70,
      nationality: 'American',
      description: 'Descrição da cerveja maravilhosa'
    )

    visit root_path
    fill_in 'q', with: 'KBS 2016'
    click_on 'Buscar'
    click_on 'KBS 2016'

    expect(page).to have_css('h4.card-title', text: beer.name)
    expect(page).to have_css('h4', text: beer.style)
    expect(page).to have_css('div', text: beer.abv)
    expect(page).to have_css('div', text: beer.ibu)
    expect(page).to have_css('div', text: beer.brewery)
    expect(page).to have_css('div', text: beer.nationality)
    expect(page).to have_css('div', text: beer.description)
  end
end
