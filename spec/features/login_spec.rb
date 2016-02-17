require 'rails_helper'

RSpec.feature "User Login and Logout", type: :feature do
  scenario "First time user logs into app using reddit oauth" do
    visit root_path
    expect(page).to have_content "Login with Reddit"
    # click_on "Login with Reddit"

    acceptance_params = {"state"=>"RANDOM6299",
         "code"=>"9661bAppca_DE1EP7MFVky8TwuY",
         "controller"=>"sessions",
         "action"=>"create"}

    # VCR.use_cassette 'user_token/api_response' do
    #   uri = URI('https://www.reddit.com/api/v1/access_token')
    #   req = Net::HTTP::Post.new(uri)
    #   req.basic_auth ENV["app_id"], ENV["reddit_secret_key"]
    #   req.body = "grant_type=authorization_code&code=#{code}&redirect_uri=http://localhost:3000/reddit/auth"
    #
    #   res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") {|http|
    #     http.request(req)
    #   }
    #   res.body
    #
    #   response = Net::HTTP.get_response(URI("https://www.reddit.com/api/v1/authorize?client_id=_wQqSTYHc9pGZQ&response_type=code&state=RANDOM1009&redirect_uri=http://localhost:3000/reddit/auth&duration=permanent&scope=identity history flair read"))
    #   binding.pry
    # end


    # {"state"=>"RANDOM6299",
    #  "code"=>"9661bAppca_DE1EP7MFVky8TwuY",
    #  "controller"=>"sessions",
    #  "action"=>"create"}

    #user denies
    # {"state"=>"RANDOM6299",
    #  "error"=>"access_denied",
    #  "controller"=>"sessions",
    #  "action"=>"create"}
  end

  # describe YourModel do
  #   describe '#call_api&quot; do
  #      it &quot;gets a response from an api&quot; do
  #        VCR.use_cassette 'model/api_response' do
  #           response = call_api(api_url)
  #           response.first.should == &quot;hello world&quot;
  #        end
  #      end
  #   end
  # end

  # context "invalid dojo attributes" do
  #   scenario "user doesn't provide name" do
  #     visit root_path
  #     click_on "Register New Dojo"
  #
  #     fill_in "Password", with: "serenity"
  #     click_on "Register"
  #
  #     expect(page).to have_content "Dojo name can't be blank"
  #   end
  #
  #   scenario "user inputs name already taken" do
  #     Dojo.create(dojo_name: "Beth's Awesome Dojo", password: "1234")
  #     visit root_path
  #     click_on "Register New Dojo"
  #
  #
  #     fill_in "Dojo name", with: "Beth's Awesome Dojo"
  #     fill_in "Password", with: "some_password"
  #     click_on "Register"
  #
  #     expect(page).to have_content "Dojo name has already been taken"
  #   end
  #
  #   scenario "user doesn't provide a password" do
  #     visit root_path
  #     click_on "Register New Dojo"
  #
  #
  #     fill_in "Dojo name", with: "Beth's Awesome Dojo"
  #     click_on "Register"
  #
  #     expect(page).to have_content "Password can't be blank"
  #   end
  # end
end
