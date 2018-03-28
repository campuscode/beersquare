require 'rails_helper'

feature 'User view' do
  scenario 'a bar list' do
    bar = create(:bar)
    bar2 = create(:bar, name: 'Ambar')

    visit bars_path

    expect(page).to have_css('h3', text: bar.name)
    expect(page).to have_css('h3', text: bar2.name)
  end

  scenario 'no bar' do
    Bar.delete_all
    visit bars_path

    expect(page).to have_content('Não existem bares cadastrados até o momento')
  end
end
