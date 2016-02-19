require 'rails_helper'

RSpec.feature "NonLoggedInAllPages", type: :feature do
  scenario "root page displays default all page", js: true do
    # visit root_path
    #   within('.nav') do
    #     expect(page).to have_content("All")
    #     expect(page).to have_content("hot")
    #     expect(page).to have_content("new")
    #     expect(page).to have_content("controversial")
    #     expect(page).to have_content("top")
    #   end
    # expect(page).to have_content("Google’s CEO just sided with Apple in the encryption debate")
    # expect(page).to have_content("ytuns")
    # expect(page).to have_content("Android")
    # expect(page).to have_content("Colombian prison drain pipes yield over 100 dismembered corpses")
  end
end
