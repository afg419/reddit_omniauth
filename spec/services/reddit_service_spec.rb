require 'rails_helper'

RSpec.describe RedditService, type: :model do
  before :each do
    @service = RedditService.new
    @current_access_token = "52329580-8Rs4HZnHoAEBfZShYi5qWOxuSx0" #expired
    @current_access_token2 = "52329580-2hg-4itv1k-B_nYZwD6Vmv65axE"
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
      reply = @service.unauth_get_json
      first_json_post = JSON.parse(reply)["data"]["children"].first["data"]["title"]
      first_title = "To Kill a Mockingbird author Harper Lee has passed away at age 89."
      first_author = "Sctvman"

      expect(first_json_post["title"]).to eq first_title
      expect(first_json_post["author"]).to eq first_author
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
