require 'rails_helper'

RSpec.feature "NonLoggedInAllPages", type: :feature do
  scenario "root page displays default all page", js: true do
    create_cache
    VCR.use_cassette 'posts-all-non-logged' do
    visit root_path
    sleep(0.5)
      within('.nav') do
        expect(page).to have_content("All")
        expect(page).to have_content("hot")
        expect(page).to have_content("new")
        expect(page).to have_content("controversial")
        expect(page).to have_content("top")
      end
      expect(page).to have_content("Friends pranked me by converting my bedroom to a utility closet.")
      expect(page).to have_content("sal_marinto r/funny")
      expect(page).to have_content("Comments: 1307")
    end
  end
end
