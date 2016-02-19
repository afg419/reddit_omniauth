require 'rails_helper'

RSpec.feature "LoginLogoutNav", type: :feature do
  scenario "A logged in user sees logout.  A logged out user sees login" do
    ApplicationController.any_instance.stubs(:current_user).returns(true)
    VCR.use_cassette 'pms-read' do
      visit root_path
      expect(page).to have_content("Logout")

      ApplicationController.any_instance.stubs(:current_user).returns(false)
      click_on "Logout"
      expect(page).to have_content("Login with Reddit")
    end
  end
end
