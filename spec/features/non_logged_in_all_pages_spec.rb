require 'rails_helper'

RSpec.feature "NonLoggedInAllPages", type: :feature do
  scenario "root page displays default all page", js: true do
    Cache.create(top: {"data" => {"children" => ["data" => {author: "WHAT A CLEVER TEST!"} ]}})
    VCR.use_cassette 'really?' do

    sleep(3)
    visit root_path
      within('.nav') do
        expect(page).to have_content("All")
        expect(page).to have_content("hot")
        expect(page).to have_content("new")
        expect(page).to have_content("controversial")
        expect(page).to have_content("top")
      end

    end
  end
end
