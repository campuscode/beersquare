require 'rails_helper'

feature 'User find local by name' do
  scenario 'successfully' do
    bar = create(:bar)
    horario = 'Domingo a Quarta: 12h / 0h - Quinta a Sábado: 12h / 1h'

    visit root_path bar
    select 'Bar', from: 'type'
    fill_in 'q', with: 'EAP'
    click_on 'Buscar'

    expect(page).to have_css('div', text: 'EAP')
    expect(page).to have_css('li', text: 'Fone: (11) 3031-4328')
    expect(page).to have_css('li', text: 'R. Vupabussu, 305')
    expect(page).to have_css('li', text: 'Pinheiros')
    expect(page).to have_css('li', text: 'São Paulo')
    expect(page).to have_css('li', text: 'SP')
    expect(page).to have_css('li', text: '05429-040')
    expect(page).to have_css('li', text: horario)
    expect(page).to have_css('li', text: 'Cartão Débito/Crédito e Dinheiro')
    expect(page).to have_css('li', text: 'Rank')
    expect(page).to have_css('li', text: 'Servimos porções e lanches')
  end
end
