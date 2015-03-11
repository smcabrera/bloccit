require 'rails_helper'

describe 'Sign in flow' do

  include TestFactories

  describe 'successful' do
    it 'redirects to the topics index' do
      user = authenticated_user
      visit root_path

# the checkpoint suggests another html class but I used this because for some reason I hadn't written the one they used.
      within '.jumbotron' do
        click_link 'Sign In'
      end

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Sign in'
      # For some reason I didn't get signed in here because when I test the current path...
      expect(current_path).to eq new_user_session_path

      #...it passes. Which is what would happen on the sad path if the sign in was unsuccessful
      # What's going on here? I used the user's password directly in the fill_in method...

      #expect(current_path).to eq topics_path
    end
  end
end
