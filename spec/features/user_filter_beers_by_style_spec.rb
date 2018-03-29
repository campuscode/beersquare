require 'rails_helper'

feature 'User filter beer' do
  scenario 'by its school' do
    school = SchoolBeer.create(name: 'Escola Americana')

    visit search_beers_path
    select 'Escola Americana', from: 'Escola Cervejeira'
    click_on 'Filtrar'

    expect(current_path).to eq(search_school_beers_path)
    expect(page).to have_css('h1', text: school.name)
  end

  scenario 'and view its styles' do
    school = SchoolBeer.create(name: 'Escola Alemã')
    BeerStyle.create(name: 'Weiss', school_beer: school)
    BeerStyle.create(name: 'Berliner', school_beer: school)
    BeerStyle.create(name: 'Pilsner', school_beer: school)

    visit search_beers_path
    select 'Escola Alemã', from: 'Escola Cervejeira'
    click_on 'Filtrar'

    expect(current_path).to eq(search_school_beers_path)
    expect(page).to have_css(
      'li', text: "Estilo: #{school.beer_styles.first.name}"
    )
    expect(page).to have_css(
      'li', text: "Estilo: #{school.beer_styles.second.name}"
    )
    expect(page).to have_css(
      'li', text: "Estilo: #{school.beer_styles.last.name}"
    )
  end

  scenario 'filter styles from school' do
    name = 'RIS - Russian Imperial Stout'
    school = create(:school_beer, name: 'Escola Americana')
    create(:beer_style, school_beer: school, name: name)

    visit search_beers_path
    select 'Escola Americana', from: 'Escola Cervejeira'
    click_on 'Filtrar'

    expect(page).to have_css('h1.card-title', text: 'Escola Americana')
    expect(page).to have_css('li', text: 'RIS - Russian Imperial Stout')
  end
end
