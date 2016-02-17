require 'rails_helper'

RSpec.feature "LoggedInAllPages", type: :feature do
  scenario "A logged in user sees their /all page" do
    visit root_path
    expect(page).to have_content("All")
    expect(page).to have_content("Hot")
    expect(page).to have_content("New")
    expect(page).to have_content("Controversial")
    expect(page).to have_content("Top")
  end
end
