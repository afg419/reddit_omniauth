require 'rails_helper'

describe "These methods are impossible to access without the logging in working" do
  it "gets personal data aww yeah" do
    VCR.use_cassette "personal-info" do
      ApplicationController.any_instance.stubs(:current_user).returns(true)
      ApplicationController.any_instance.stubs(:current_access_token).returns("52329580-2hg-4itv1k-B_nYZwD6Vmv65axE")
      a = ApplicationController.new
      user_info = a.user_info_from_api

      expect(user_info["name"]).to eq "aapirails"
      expect(user_info["link_karma"]).to eq 1
      expect(user_info["id"]).to eq "v5lrg"
      expect(user_info["has_mail"]).to eq false
    end
  end

  it "successfully tests the helpers" do
    VCR.use_cassette "personal-info" do
      ApplicationController.any_instance.stubs(:current_access_token).returns("52329580-2hg-4itv1k-B_nYZwD6Vmv65axE")
      ApplicationController.any_instance.stubs(:current_user).returns(false)
      a = ApplicationController.new

      expect(a.current_user?).to eq false
      expect(a.current_navbar["home"][a.current_user]).to eq "logged_out_nav.html.erb"

      ApplicationController.any_instance.stubs(:current_user).returns(true)

      expect(a.current_user?).to eq true
      expect(a.current_navbar["home"][a.current_user]).to eq "logged_in_nav.html.erb"
      expect(a.current_navbar["private_messages"][a.current_user]).to eq "pm_nav.html.erb"
    end
  end
end
