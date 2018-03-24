require 'rails_helper'

feature 'User search beer by name' do
  scenario 'successfully' do
    school = SchoolBeer.create(name: 'Escola Alemã')
    Beer.create(
      name: 'KBS 2016', style: 'Imperial Russial Stout', abv: 11.9, ibu: 70,
      school_beer: school
    )
    Beer.create(
      name: 'KBS 2018', style: 'Imperial Russial Stout', abv: 11.9, ibu: 70,
      school_beer: school
    )

    visit root_path
    fill_in 'q', with: 'KBS 2016'
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
    fill_in 'q', with: 'KBS'
    click_on 'Buscar'

    expect(page).to have_css('li', text: beer1.name)
    expect(page).to have_css('li', text: 'Estilo: Imperial Russial Stout')
    expect(page).to have_css('li', text: 'ABV: 11.9%')
    expect(page).to have_css('li', text: 'IBU: 70')
    expect(page).to have_css('li', text: beer2.name)
  end

  scenario 'and not found' do
    create(:beer)

    visit root_path
    fill_in 'q', with: 'Bla'
    click_on 'Buscar'

    expect(page).to have_content('Cerveja não encontrada')
  end
end
