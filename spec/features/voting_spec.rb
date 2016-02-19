require 'rails_helper'

RSpec.feature "Logged in user can vote", type: :feature do
  scenario "Logged in user votes on front page", js: true do
    VCR.use_cassette 'votes' do
      create_cache
      ApplicationController.any_instance.stubs(:current_user).returns(true)

      visit root_path

      find(".upvote").click
      expect(page).to have_css(".orange")

      find(".downvote").click
      expect(page).to have_css(".purple")

      find(".downvote").click
      expect(page).to_not have_css(".purple")
      expect(page).to_not have_css(".orange")
    end
  end
end
