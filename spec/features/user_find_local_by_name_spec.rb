require 'rails_helper'

feature 'User find local by name' do
  scenario 'successfully' do
    bar = create(:bar)

    visit bar_path
    # select
    # fill_in
  end
end
