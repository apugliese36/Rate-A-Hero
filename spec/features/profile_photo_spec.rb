require 'rails_helper'

feature 'profile photo' do
  scenario 'user uploads a profile photo' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Jeff'
    fill_in 'Last Name', with: 'Miller'
    fill_in 'Email', with: 'Dan@gmail.com'
    fill_in 'Username', with: 'apple123'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    attach_file 'user_profile_photo',
    '#{Rails.root}/spec/support/images/photo.png'
    click_button 'Sign Up'

    expect(page).to have_content('Welcome to Rate-A-Hero. Enjoy your heroic experience!')
    visit users_path
    expect(page).to have_css("img[src*='photo.png']")
  end
end
