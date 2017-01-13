require 'rails_helper'

feature 'Picture listing', type: :feature do
  scenario 'Should display a feed of the user' do
    visit pictures_path

    mock_authorized_instagram
    stub_instagram_recent_media
    click_on t('log_in_with_instagram')
    
    image1 = 'http://distillery.s3.amazonaws.com/media/2011/02/02/6ea7baea55774c5e81e7e3e1f6e791a7_7.jpg'
    image2 = 'http://distillery.s3.amazonaws.com/media/2011/02/02/74c5e816ea7baea557e7e3e1f6e791a7_7.jpg'

    expect(find "img[src='#{image1}']").to be_present
    expect(find "img[src='#{image2}']").to be_present
  end
end
