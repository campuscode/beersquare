require 'rails_helper'

feature 'Create a new user' do
  scenario 'successfully' do
    visit root_path
    click_on 'Inscrever-se'
    fill_in 'Email', with: 'meu@email.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'Criar Usuário'

    expect(page).to have_content('Olá meu@email.com')
    expect(page).to have_content('Logout')
    expect(page).not_to have_content('Login')
  end

  scenario 'and dont fill' do
    visit root_path
    click_on 'Inscrever-se'
    click_on 'Criar Usuário'

    expect(page).to have_content('Não foi possível salvar usuário')
    expect(page).to have_content('Email não pode ficar em branco')
    expect(page).to have_content('Senha não pode ficar em branco')
  end

  scenario 'and login' do
    create(:user)

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'meu@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

    expect(page).to have_content('Olá meu@email.com')
    expect(page).to have_content('Logout')
    expect(page).not_to have_content('Login')
  end
end
