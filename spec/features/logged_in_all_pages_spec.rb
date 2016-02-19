require 'rails_helper'

RSpec.feature "LoggedInAllPages", type: :feature do
  scenario "A logged in user sees their all/top page", :js => true do
    create_cache
    ApplicationController.any_instance.stubs(:current_user).returns(true)
    VCR.use_cassette 'posts-all-top' do
      visit root_path
      sleep(0.25)
      within('.filter') do
        expect(page).to have_content("hot")
        expect(page).to have_content("new")
        expect(page).to have_content("controversial")
        expect(page).to have_content("top")
      end
      expect(page).to have_content("all/top")
      expect(page).to have_content("Friends pranked me by converting my bedroom to a utility closet.")
      expect(page).to have_content("sal_marinto r/funny")
      expect(page).to have_content("Comments: 1307")    end
  end

  scenario "A logged in user sees their all/new page", :js => true do
    create_cache("new")
    ApplicationController.any_instance.stubs(:current_user).returns(true)
    ApplicationController.any_instance.stubs(:selected_filter).returns("new")
    VCR.use_cassette 'posts-all-new' do
      visit root_path
      sleep(0.25)
      within('.filter') do
        expect(page).to have_content("hot")
        expect(page).to have_content("new")
        expect(page).to have_content("controversial")
        expect(page).to have_content("top")
      end
      expect(page).to have_content("all/new")
      expect(page).to have_content("Friends pranked me by converting my bedroom to a utility closet.")
      expect(page).to have_content("sal_marinto r/funny")
      expect(page).to have_content("Comments: 1307")    end
  end
end
