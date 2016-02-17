require 'rails_helper'

RSpec.feature "NonLoggedInAllPages", type: :feature do
  scenario "root page displays default all page" do
    visit root_path
    within('.nav') do
      expect(page).to have_content("All")
      expect(page).to have_content("Hot")
      expect(page).to have_content("New")
      expect(page).to have_content("Controversial")
      expect(page).to have_content("Top")
    end
  end
end
