require 'spec_helper'
require 'rails_helper'

feature 'user edits/deletes account', %(
  As an authenticated user
  I want to update my information
  So that I can keep my profile up to date
) do

  scenario 'updating account information' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    visit edit_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password confirmation', with: 'newpassword'

    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content(
      'Your account has been updated successfully.'
    )
  end
end

feature 'user edits/deletes account', %(
  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app
) do

  scenario 'account is deleted' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    visit edit_user_registration_path
    click_link 'Cancel my account'

    expect(page).to have_content('Bye! Your account has been successfully
     cancelled. We hope to see you again soon.')
    expect(page).to_not have_content('Sign Out')
  end
end
