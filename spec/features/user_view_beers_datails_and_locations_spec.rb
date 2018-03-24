require 'rails_helper'

feature 'User view' do
  scenario 'beer details' do
    beer = Beer.create(
      name: 'Erdinger',
      style: 'Wheiss',
      brewery: 'Cervejaria alemã',
      abv: 1.1,
      ibu: 2.2,
      nationality: 'Alemanha',
      description: 'Cerveja de trigo deliciosamente refrescante'
    )

    visit beer_path(beer)

    expect(page).to have_css('h4', text: beer.name)
    expect(page).to have_css('h4', text: "Estilo: #{beer.style}")
    expect(page).to have_css('div', text: "Cervejaria: #{beer.brewery}")
    expect(page).to have_css('div', text: "ABV: #{beer.abv}")
    expect(page).to have_css('div', text: "IBU: #{beer.ibu}")
    expect(page).to have_css('div', text: "Nacionalidade: #{beer.nationality}")
    expect(page).to have_css('div', text: "Descrição: #{beer.description}")
  end

  scenario 'offering bar' do
    beer = Beer.create(
      name: 'Erdinger',
      style: 'Wheiss',
      brewery: 'Cervejaria alemã',
      abv: 1.1,
      ibu: 2.2,
      nationality: 'Alemanha',
      description: 'Cerveja de trigo deleciosamente refrescante'
    )

    bar = Bar.create(
      name: 'Bar do Zé',
      state: 'SP',
      city: 'São Paulo',
      neighborhood: 'Pinheiros',
      zip_code: '05404-000',
      phone: '(11) 1234-4321',
      trading_hour: 'de segunda a segunda das 16:00 às 03:00',
      payment: 'Cheque, dinheiro e cartão',
      rank: '10',
      services: 'Menu completo'
    )

    BarBeer.create(bar: bar, beer: beer)

    visit beer_path(beer)
    expect(page).to have_css('h4', text: bar.name)
    expect(page).to have_css('div', text: bar.state)
    expect(page).to have_css('div', text: bar.city)
    expect(page).to have_css('div', text: bar.neighborhood)
  end

  scenario 'user finds 2 bars' do
    beer = Beer.create(
      name: 'Erdinger',
      style: 'Wheiss',
      brewery: 'Cervejaria alemã',
      abv: 1.1,
      ibu: 2.2,
      nationality: 'Alemanha',
      description: 'Cerveja de trigo deleciosamente refrescante'
    )

    bar = Bar.create(
      name: 'Bar do Zé',
      state: 'SP',
      city: 'São Paulo',
      neighborhood: 'Pinheiros',
      zip_code: '05404-000',
      phone: '(11) 1234-4321',
      trading_hour: 'de segunda a segunda das 16:00 às 03:00',
      payment: 'Cheque, dinheiro e cartão',
      rank: '10',
      services: 'Menu completo'
    )

    bar1 = Bar.create(
      name: 'Bar Budha',
      state: 'TO',
      city: 'Tocantins',
      neighborhood: 'Vl. Madalena',
      zip_code: '05404-100',
      phone: '(11) 4321-1234',
      trading_hour: 'de segunda a segunda das 16:00 às 03:00',
      payment: 'Cheque, dinheiro e cartão',
      rank: '10',
      services: 'Menu completo'
    )

    BarBeer.create(bar: bar, beer: beer)
    BarBeer.create(bar: bar1, beer: beer)

    visit beer_path(beer)
    expect(page).to have_css('h4', text: bar.name)
    expect(page).to have_css('div', text: bar.state)
    expect(page).to have_css('div', text: bar.city)
    expect(page).to have_css('div', text: bar.neighborhood)

    expect(page).to have_css('h4', text: bar1.name)
    expect(page).to have_css('div', text: bar1.state)
    expect(page).to have_css('div', text: bar1.city)
    expect(page).to have_css('div', text: bar1.neighborhood)
  end

  scenario 'offering bars' do
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

    bar = Bar.create(
      name: 'Bar do Zé',
      state: 'SP',
      city: 'São Paulo',
      neighborhood: 'Pinheiros',
      zip_code: '05404-000',
      phone: '(11) 1234-4321',
      trading_hour: 'de segunda a segunda das 16:00 às 03:00',
      payment: 'Cheque, dinheiro e cartão',
      rank: '10',
      services: 'Menu completo'
    )

    bar1 = Bar.create(
      name: 'Bar Budha',
      state: 'TO',
      city: 'Tocantins',
      neighborhood: 'Vl. Madalena',
      zip_code: '05404-100',
      phone: '(11) 4321-1234',
      trading_hour: 'de segunda a segunda das 16:00 às 03:00',
      payment: 'Cheque, dinheiro e cartão',
      rank: '10',
      services: 'Menu completo'
    )

    BarBeer.create(bar: bar, beer: beer)
    BarBeer.create(bar: bar1, beer: beer1)

    visit beer_path(beer)
    expect(page).to have_css('h4', text: bar.name)
    expect(page).to have_css('div', text: bar.state)
    expect(page).to have_css('div', text: bar.city)
    expect(page).to have_css('div', text: bar.neighborhood)

    expect(page).to_not have_css('h4', text: bar1.name)
    expect(page).to_not have_css('div', text: bar1.state)
    expect(page).to_not have_css('div', text: bar1.city)
    expect(page).to_not have_css('div', text: bar1.neighborhood)
  end

  scenario 'offering bars' do
    beer = Beer.create(
      name: 'Erdinger',
      style: 'Wheiss',
      brewery: 'Cervejaria alemã',
      abv: 1.1,
      ibu: 2.2,
      nationality: 'Alemanha',
      description: 'Cerveja de trigo deliciosamente refrescante'
    )

    bar = Bar.create(
      name: 'Bar Budha',
      state: 'TO',
      city: 'Tocantins',
      neighborhood: 'Vl. Madalena',
      zip_code: '05404-100',
      phone: '(11) 4321-1234',
      trading_hour: 'de segunda a segunda das 16:00 às 03:00',
      payment: 'Cheque, dinheiro e cartão',
      rank: '10',
      services: 'Menu completo'
    )

    visit beer_path(beer)
    expect(page).to_not have_css('h4', text: bar.name)
    expect(page).to_not have_css('div', text: bar.state)
    expect(page).to_not have_css('div', text: bar.city)
    expect(page).to_not have_css('div', text: bar.neighborhood)
    expect(page).to have_css(
      'div', text: 'No momento nenhum bar está oferecendo esta cerveja'
    )
  end

  scenario 'user view bar details' do
    beer = Beer.create(
      name: 'Erdinger',
      style: 'Wheiss',
      brewery: 'Cervejaria alemã',
      abv: 1.1,
      ibu: 2.2,
      nationality: 'Alemanha',
      description: 'Cerveja de trigo deliciosamente refrescante'
    )

    bar = Bar.create(
      name: 'Bar Budha',
      state: 'TO',
      city: 'Tocantins',
      neighborhood: 'Vl. Madalena',
      zip_code: '05404-100',
      phone: '(11) 4321-1234',
      trading_hour: 'de segunda a segunda das 16:00 às 03:00',
      payment: 'Cheque, dinheiro e cartão',
      rank: '10',
      services: 'Menu completo'
    )

    BarBeer.create(
      bar: bar, beer: beer
    )

    visit beer_path(beer)
    click_on 'Bar Budha'

    expect(page).to have_css('h3', text: bar.name)
    expect(page).to have_css('li', text: bar.neighborhood)
    expect(page).to have_css('li', text: bar.city)
    expect(page).to have_css('li', text: bar.state)
    expect(page).to have_css('li', text: bar.zip_code)
    expect(page).to have_css('li', text: bar.phone)
    expect(page).to have_css('li', text: bar.trading_hour)
    expect(page).to have_css('li', text: bar.payment)
    expect(page).to have_css('li', text: bar.rank)
    expect(page).to have_css('li', text: bar.services)
  end
end
