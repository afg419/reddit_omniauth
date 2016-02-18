require 'rails_helper'

# comment out lines @current_access_token =, code = , and all vcrs within make em
# put in pry beneath create action in SessionsController
# record params["code"] in pry beneath get access token below by code =
# exit! or ctrl c from pry
# run tests
# open vcr for client-login-handshake and get current_access_token, set it at @current_access_token = and uncomment
# uncomment all filled in vcrs in make em!
# run tests


describe "makes all the logged in cassettes" do

  before :each do
    @reddit_service = RedditService.new
    @current_access_token = "52329580-tZn8AIcl6sr2jjrmW2euJ75rODk"
  end

  it "get access token" do
    #copy from pry the confirmation key from the user logging in
    #send in the following request
    # code = "MHgP6x_Lg4Na3RbNlNB-3FHW5Nw"
    # VCR.use_cassette 'client-login-handshake' do
    #   @reddit_service.o_authenticate_with_reddit(code)
    # end
  end

  it "Now that we're logged in... make em!" do
    VCR.use_cassette 'posts-all-top' do
      Post.all('all','top', @current_access_token)
    end

    VCR.use_cassette 'posts-all-new' do
      Post.all('all','new', @current_access_token)
    end

    VCR.use_cassette 'pms-read' do
      PrivateMessage.all('inbox', @current_access_token)
    end

    VCR.use_cassette 'pms-sent' do
      PrivateMessage.all('sent', @current_access_token)
    end

#####################################

    # VCR.use_cassette 'cast-vote' do
    #
    # end
    #
    # VCR.use_cassette 'create-post' do
    #
    # end
    #
    # VCR.use_cassette 'create-comment' do
    #
    # end
    #
    # VCR.use_cassette 'aggregate-cassettes' do
    #
    # end
  end
end
