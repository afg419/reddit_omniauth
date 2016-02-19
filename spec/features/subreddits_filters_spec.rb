require 'rails_helper'

RSpec.feature "Display subs and filters", type: :feature do
  scenario "non logged in visits the subs and filters", js: true do
    create_cache
    VCR.use_cassette 'subs-and-filters' do
      visit root_path
      expect(page).to have_content("all/top")

      click_on "funny"
      expect(page).to have_content("funny/top")
      expect(page).to have_content("Bro... wtf are you doing?")
      expect(page).to have_content("Uxepro")

      click_on "controversial"
      expect(page).to have_content("funny/controversial")
      expect(page).to have_content("Congrats Whitney!")
      expect(page).to have_content("PhantomPepper")
    end
  end

  scenario "logged in visits the subs and filters", js: true do
    create_cache
    VCR.use_cassette 'subs-and-filters' do
      ApplicationController.any_instance.stubs(:current_user).returns(true)
      visit root_path
      expect(page).to have_content("all/top")

      click_on "funny"
      expect(page).to have_content("funny/top")
      expect(page).to have_content("Bro... wtf are you doing?")
      expect(page).to have_content("Uxepro")

      click_on "controversial"
      expect(page).to have_content("funny/controversial")
      expect(page).to have_content("Congrats Whitney!")
      expect(page).to have_content("PhantomPepper")
    end
  end

end
