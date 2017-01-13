require 'rails_helper'

feature 'Authentications', type: :feature do
  background do
    stub_instagram_recent_media
  end

  scenario 'Unauthenticated user can not access the pictures page' do
    sign_out :user
    visit pictures_path
    expect(page).to have_content(t 'log_in_with_instagram')
  end

  scenario 'User can log in by clicking on link' do
    visit pictures_path
    mock_authorized_instagram
    click_on t('log_in_with_instagram')
    expect(page).to have_content(t 'successfully_authenticated')
  end

  scenario 'User who doesnt authorize must see an alert' do
    visit pictures_path
    mock_unauthorized_instagram
    click_on t('log_in_with_instagram')
    expect(page).to have_content(t 'could_not_authenticate')
  end
end
