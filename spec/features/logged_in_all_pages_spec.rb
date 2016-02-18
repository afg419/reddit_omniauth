require 'rails_helper'

RSpec.feature "LoggedInAllPages", type: :feature do
  scenario "A logged in user sees their all/top page" do
    ApplicationController.any_instance.stubs(:current_user).returns(true)
    VCR.use_cassette 'posts-all-top' do
      visit root_path
      expect(page).to have_content("hot")
      expect(page).to have_content("new")
      expect(page).to have_content("controversial")
      expect(page).to have_content("top")
    end

    expect(page).to have_content("Google’s CEO just sided with Apple in the encryption debate")
  end

  scenario "A logged in user sees their all/new page" do
    ApplicationController.any_instance.stubs(:current_user).returns(true)
    ApplicationController.any_instance.stubs(:selected_filter).returns("new")
    VCR.use_cassette 'posts-all-new' do
      visit root_path
      expect(page).to have_content("hot")
      expect(page).to have_content("new")
      expect(page).to have_content("controversial")
      expect(page).to have_content("top")
    end

    expect(page).to have_content("Osborne urged to spend more on infrastructure by OECD")
  end

  # scenario "A logged in user can click filters" do
  #   ApplicationController.any_instance.stubs(:current_user).returns(true)
  #   VCR.use_cassette 'posts-all-new' do
  #     visit root_path
  #     expect(page).to have_content("hot")
  #     expect(page).to have_content("new")
  #     expect(page).to have_content("controversial")
  #     expect(page).to have_content("top")
  #   end
  #
  #   expect(page).to have_content("Osborne urged to spend more on infrastructure by OECD")
  # end

end
