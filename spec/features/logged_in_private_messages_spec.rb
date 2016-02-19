RSpec.feature "LoggedInPmPages", type: :feature do
  # 
  # scenario "A logged in user sees their messages page" do
  #   ApplicationController.any_instance.stubs(:current_user).returns(true)
  #   VCR.use_cassette 'pms-read' do
  #     visit private_messages_path
  #     expect(page).to have_content("Inbox")
  #     expect(page).to have_content("Sent")
  #     expect(page).to have_content("Hello! Here’s some information to get you started with reddit.")
  #   end
  # end
  #
  # scenario "A logged in user sees their all/sent page" do
  #   ApplicationController.any_instance.stubs(:current_user).returns(true)
  #   ApplicationController.any_instance.stubs(:selected_mailbox).returns("sent")
  #   VCR.use_cassette 'pms-sent' do
  #     visit private_messages_path
  #     expect(page).to have_content("Inbox")
  #     expect(page).to have_content("Sent")
  #     expect(page).to have_content("Hmmm seems you don't have any mail in this box")
  #   end
  # end
end
