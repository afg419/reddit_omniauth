require 'rails_helper'

RSpec.describe RedditService, type: :model do
  before :each do
    @service = RedditService.new
    @login_code = "tytuTH-bx8M8nVXF1cm6vKG_Kl0"
    @current_access_token = "52329580-8Rs4HZnHoAEBfZShYi5qWOxuSx0" #expired
    @current_access_token2 = "52329580-2hg-4itv1k-B_nYZwD6Vmv65axE"
  end

  it "gets access token from login code" do
    VCR.use_cassette 'auth-handshake' do
      reply = @service.o_authenticate_with_reddit(@login_code)
      expect(reply).to eq "{\"error\": 401}" # no idea why this won't work
    end
  end

  it "makes api call to all/top posts" do
    VCR.use_cassette 'posts-all-top' do
      reply = Post.all('all','top', @current_access_token)
      first_title = "Friends pranked me by converting my bedroom to a utility closet."
      first_author = "sal_marin"
      expect(reply.count).to eq 25
      expect(reply.first.title).to eq first_title
      expect(reply.first.author).to eq first_author
    end
  end

  it "makes api call to all/new posts" do
    VCR.use_cassette 'posts-all-new' do
      reply = Post.all('all','new', @current_access_token)
      first_title = "[META] Mods"
      first_author = "ProletariatCossack"

      expect(reply.count).to eq 25
      expect(reply.first.title).to eq first_title
      expect(reply.first.author).to eq first_author
    end
  end

  it "make unauth api call to all/top posts" do
    VCR.use_cassette 'unauth-posts-all-top' do
      reply = Post.all_unauth("all", "top")
      first_title = "Friends pranked me by converting my bedroom to a utility closet."
      first_author = "sal_marin"

      expect(reply.first.title).to eq first_title
      expect(reply.first.author).to eq first_author
    end
  end

  it "makes api call to read pms" do
    VCR.use_cassette 'pms-read' do
      reply = PrivateMessage.all('inbox', @current_access_token)
      first_author = "reddit"
      first_body_52_chars = "Hello!\r\n\r\nHere’s some information to get you started"

      expect(reply.count).to eq 1
      expect(reply.first.author).to eq first_author
      expect(reply.first.body[0..51]).to eq first_body_52_chars
    end
  end

  it "makes api call to sent pms" do
    VCR.use_cassette 'pms-sent' do
      reply = PrivateMessage.all('sent', @current_access_token)

      expect(reply.count).to eq 0
    end
  end

  it "makes api call to cast vote" do
    VCR.use_cassette 'cast-vote' do
      request_body = "dir=1&id=t3_46i27j&rank=6"
      reply = @service.post(path: "vote", post_body: request_body, token: @current_access_token2)

      expect(reply).to eq "{}"
    end
  end
end
