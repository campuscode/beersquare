require 'rails_helper'

feature 'user choose bar' do
  scenario 'successfully' do
    cerveja1 = Beer.create(name: 'Erdinger Weissbier', style: 'Weiss' , abv: '5,3%' , ibu: '13')

    cerveja2 = Beer.create(name: 'Urbana Boo', style: 'Wheat Ale' , abv: '4,9' , ibu: '20')

    cerveja3 = create(:beer)

    bar = Bar.create(name: 'CampusCode Pub', state: 'SP', city: 'São Paulo',
      neighborhood: 'Jardins', zip_code: '01234-001', phone: '11-55006789',
      trading_hour: 'segunda à sexta das 17h às 0h, sábado e domingo das 15h às 2h',
      payment: 'dinheiro, todos os cartões de crédito e débito; não aceita
      cheques e ticket', rank: '5', services: 'cozinha, valet, música ao vivo')

    visit pub_details_path

    expect(page).to have_css('h3', text: 'CampusCode Pub' )
    expect(page).to have_css('li', text: 'São Paulo' )
    expect(page).to have_css('li', text: 'CampusCode Pub' )




  end
end
