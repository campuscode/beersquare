require 'rails_helper'

feature 'user choose bar' do
  scenario 'successfully' do
    cerveja1 = Beer.create(
      name: 'Erdinger Weissbier',
      style: 'Weiss',
      abv: '5,3%',
      ibu: '13'
    )
    Beer.create(name: 'Urbana Boo', style: 'Wheat Ale', abv: '4,9', ibu: '20')

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

    BarBeer.create(bar: bar, beer: cerveja1)

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
    expect(page).to have_content('Cervejas: ')
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

    Beer.create(name: 'Urbana Boo', style: 'Wheat Ale', abv: '4,9', ibu: '20')

    visit bar_path(bar)

    expect(page).to have_content('Cervejas: ')
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

    beer = Beer.create(
      name: 'Erdinger',
      style: 'Wheiss',
      brewery: 'Cervejaria alemã',
      abv: 1.1,
      ibu: 2.2,
      nationality: 'Alemanha',
      description: 'Cerveja de trigo deliciosamente refrescante'
    )

    beer1 = Beer.create(
      name: 'Matta',
      style: 'Wheiss',
      brewery: 'Da Matta',
      abv: 2.2,
      ibu: 1.1,
      nationality: 'Brasileira',
      description: 'Cerveja de trigo encorpada, com notas de cravo e banana'
    )

    bar_beer = BarBeer.create(bar:bar, beer:beer)
    bar_beer1 = BarBeer.create(bar:bar, beer:beer1)

    visit bar_path(bar)

    expect(page).to have_content('Cervejas da Casa')
    expect(page).to have_css('li', text: beer.name)
    expect(page).to_have_css('li', text: beer1.name)
  end
end
