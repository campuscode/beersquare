require 'rails_helper'

feature 'user choose bar' do
  scenario 'successfully' do
    school = create(:school_beer, name: 'Escola Alemã')
    style_weiss = create(:beer_style, name: 'Weiss', school_beer: school)
    style_wheat = create(:beer_style, name: 'Wheat Ale', school_beer: school)
    beer = Beer.create(
      name: 'Erdinger Weissbier',
      abv: '5,3%',
      ibu: '13',
      beer_style: style_weiss
    )
    Beer.create(
      name: 'Urbana Boo',
      beer_style: style_wheat,
      abv: '4,9',
      ibu: '20'
    )

    bar = Bar.create(
      name: 'CampusCode Pub',
      state: 'SP',
      city: 'São Paulo',
      neighborhood: 'Jardins',
      zip_code: '01234-001',
      phone: '11-55006789',
      trading_hour: '17:00 - 00:00',
      payment: 'dinheiro, cartões de crédito e débito',
      rank: '5.0',
      services: 'cozinha, valet, música ao vivo'
    )

    BarBeer.create(bar: bar, beer: beer)

    visit bar_path(bar)

    expect(page).to have_css('h3', text: 'CampusCode Pub')
    expect(page).to have_css('li', text: 'Jardins')
    expect(page).to have_css('li', text: 'São Paulo')
    expect(page).to have_css('li', text: 'SP')
    expect(page).to have_css('li', text: '01234-001')
    expect(page).to have_css('li', text: '11-55006789')
    expect(page).to have_css('li', text: '17:00 - 00:00')
    expect(page).to have_css(
      'li', text: 'dinheiro, cartões de crédito e débito'
    )
    expect(page).to have_css('li', text: '5.0')
    expect(page).to have_css('li', text: 'cozinha, valet, música ao vivo')
    expect(page).to have_content('Cervejas')
    expect(page).to have_css('li', text: 'Erdinger Weissbier')
    expect(page).not_to have_css('li', text: 'Urbana Boo')
  end

  scenario 'bar has not beers' do
    bar = Bar.create(
      name: 'CampusCode Pub',
      state: 'SP',
      city: 'São Paulo',
      neighborhood: 'Jardins',
      zip_code: '01234-001',
      phone: '11-55006789',
      trading_hour: '17:00 - 00:00',
      payment: 'dinheiro, cartões de crédito e débito',
      rank: '5.0',
      services: 'cozinha, valet, música ao vivo'
    )

    school = create(:school_beer, name: 'Escola Alemã')
    style_weiss = create(:beer_style, name: 'Weiss', school_beer: school)
    style_wheat = create(:beer_style, school_beer: school)
    Beer.create(
      name: 'Erdinger Weissbier',
      abv: '5,3%',
      ibu: '13',
      beer_style: style_weiss
    )
    Beer.create(
      name: 'Urbana Boo',
      beer_style: style_wheat,
      abv: '4,9',
      ibu: '20'
    )

    visit bar_path(bar)

    expect(page).to have_content('Cervejas')
    expect(page).to_not have_css('li', text: 'Urbana Boo')
    expect(page).to have_content(
      'Este bar não tem cerveja disponível no momento'
    )
  end

  scenario 'and bar show beer list' do
    bar = Bar.create(
      name: 'CampusCode Pub',
      state: 'SP',
      city: 'São Paulo',
      neighborhood: 'Jardins',
      zip_code: '01234-001',
      phone: '11-55006789',
      trading_hour: '17:00 - 00:00',
      payment: 'dinheiro, cartões de crédito e débito',
      rank: '5.0',
      services: 'cozinha, valet, música ao vivo'
    )
    school = create(:school_beer, name: 'Escola Alemã')
    style_weiss = create(:beer_style, name: 'Weiss', school_beer: school)
    style_wheat = create(:beer_style, school_beer: school)
    beer = Beer.create(
      name: 'Erdinger',
      beer_style: style_weiss,
      brewery: 'Cervejaria alemã',
      abv: 1.1,
      ibu: 2.2,
      nationality: 'Alemanha',
      description: 'Cerveja de trigo deliciosamente refrescante'
    )
    beer1 = Beer.create(
      name: 'Matta',
      beer_style: style_wheat,
      brewery: 'Da Matta',
      abv: 2.2,
      ibu: 1.1,
      nationality: 'Brasileira',
      description: 'Cerveja de trigo encorpada, com notas de cravo e banana'
    )
    BarBeer.create(bar: bar, beer: beer)
    BarBeer.create(bar: bar, beer: beer1)

    visit bar_path(bar)

    expect(page).to have_content('Cervejas')
    expect(page).to have_css('li', text: beer.name)
    expect(page).to have_css('li', text: beer1.name)
  end
end
