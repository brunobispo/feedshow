require 'rails_helper'

feature 'Authentications', type: :feature do
  scenario 'Unauthenticated user access the pictures page' do
    sign_out :user
    visit pictures_path
    expect(page).to have_content(I18n.t 'log_in_with_instagram')
  end
end
