require 'rails_helper'

RSpec.describe RedditService, type: :model do
  before :each do
    @service = RedditService.new
  end

  it "can hit reddit api for user access token" do
    params = user_clicks_accept

    VCR.use_cassette 'user_token/api_response' do
      @service.o_authenticate_with_reddit(params["code"])
    end


  end
end
