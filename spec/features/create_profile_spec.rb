require 'rails_helper'

feature 'create profile' do
  scenario 'succesfully' do
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Meu perfil'
    click_on 'Editar'
    fill_in 'Nome', with: 'José da Silva'
    fill_in 'Data de nascimento', with: '01/01/2000'
    click_on 'Salvar'

    expect(page).to have_content('Perfil atualizado com sucesso')
    expect(page).to have_content('José da Silva')
    expect(page).to have_content('meu@email.com')
    expect(page).to have_content('01/01/2000')
  end

  scenario 'When the user already has a profile' do
    user = create(:user)
    profile = Profile.last

    login_as(user, scope: :user)
    visit root_path
    click_on 'Meu perfil'
    click_on 'Editar'
    fill_in 'Nome', with: 'Josimar Barbosa'
    fill_in 'Data de nascimento', with: '01/01/1998'
    click_on 'Salvar'

    expect(user.profile).not_to be_nil
    expect(user.profile).to eq(profile)
    expect(page).to have_content('Perfil atualizado com sucesso')
    expect(page).to have_content('meu@email.com')
    expect(page).to have_content('Josimar Barbosa')
    expect(page).to have_content('01/01/1998')
  end
end
