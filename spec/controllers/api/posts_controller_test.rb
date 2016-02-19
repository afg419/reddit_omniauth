# require 'spec_helper'
#
# describe Api::PostsController do
#     context "with current_user" do
#       it "updates vote history" do
#         ApplicationController.any_instance.stubs(:current_user).returns(true)
#         a = ApplicationController.new
#
#         expect(a.voting_history).to eq {}
#         patch :update, :post_id => "3jj4kl", :vote_count => 1
#         expect(a.voting_history).to eq({"3jj4kl" => 1})
#       end
#     end
#
#     # context "without current_user" do
#     #   it "does not save the new contact in the database"
#     #   it "re-renders the :new template"
#     # end
# end
# #
# describe "GET #index" do
#   it "populates an array of contacts" do
#     contact = Factory(:contact)
#     get :index
#     assigns(:contacts).should eq([contact])
#   end
#
#   it "renders the :index view" do
#     get :index
#     response.should render_template :index
#   end
# end
#
# describe "GET #show" do
#   it "assigns the requested contact to @contact" do
#     contact = Factory(:contact)
#     get :show, id: contact
#     assigns(:contact).should eq(contact)
#   end
#
#   it "renders the #show view" do
#     get :show, id: Factory(:contact)
#     response.should render_template :show
#   end
# end
