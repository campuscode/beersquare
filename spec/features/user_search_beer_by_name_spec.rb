require 'rails_helper'

feature 'User search beer by name' do
  scenario 'successfully' do
    school = SchoolBeer.create(name: 'Escola Americana')
    style = create(:beer_style, name: 'Imperial Russial Stout',
                                school_beer: school)
    Beer.create(name: 'KBS 2016', beer_style: style, abv: 11.9, ibu: 70)
    Beer.create(name: 'KBS 2018', beer_style: style, abv: 11.9, ibu: 70)

    visit root_path
    fill_in 'q', with: 'KBS 2016'
    click_on 'Buscar'

    expect(page).to have_css('div.card-header', text: 'KBS 2016')
    expect(page).to have_css('li', text: 'Estilo: Imperial Russial Stout')
    expect(page).to have_css('li', text: 'ABV: 11.9%')
    expect(page).to have_css('li', text: 'IBU: 70')
    expect(page).to_not have_css('div.card-header', text: 'KBS 2018')
  end

  scenario 'and find more than one beers' do
    school = SchoolBeer.create(name: 'Escola Americana')
    style = create(:beer_style, name: 'Imperial Russial Stout',
                                school_beer: school)
    beer1 = create(:beer, name: 'KBS 2016', beer_style: style)
    beer2 = create(:beer, name: 'KBS 2018', beer_style: style)

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
    school = create(:school_beer)
    style = create(:beer_style, school_beer: school)
    beer = create(:beer, beer_style: style)

    visit root_path
    fill_in 'q', with: 'KBS 2016'
    click_on 'Buscar'
    click_on 'KBS 2016'

    expect(page).to have_css('h3.card-title', text: beer.name)
    expect(page).to have_css('h4', text: school.name)
    expect(page).to have_css('h4', text: beer.beer_style.name)
    expect(page).to have_css('li', text: beer.abv)
    expect(page).to have_css('li', text: beer.ibu)
    expect(page).to have_css('li', text: beer.brewery)
    expect(page).to have_css('li', text: beer.nationality)
    expect(page).to have_css('li', text: beer.description)
    expect(current_path).to eq root_path + 'beers/kbs-2016'
  end
end
