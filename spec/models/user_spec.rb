require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @reply1 = {
      "name" => "aapirails",
      "refresh_token" => "aaaa0000",
      "link_karma" => 100,
      "comment_karma" => 100,
      "id" => "1111",
      "inbox_count" => 5,
      "gold_creddits" => 10
    }

    @reply2 = {
      "name" => "aapirails",
      "refresh_token" => "bbbb0000",
      "link_karma" => 200,
      "comment_karma" => 200,
      "id" => "1111",
      "inbox_count" => 5,
      "gold_creddits" => 10
    }
  end

  scenario "creates new user" do
    u = User.find_or_create_by_auth(@reply1)
    expect(u.name).to eq "aapirails"
    expect(u.refresh_token).to eq "aaaa0000"
    expect(u.reddit_id).to eq "1111"
    expect(u.comment_karma).to eq 100
  end

  scenario "finds and updates old user" do
    User.find_or_create_by_auth(@reply1)
    u = User.find_or_create_by_auth(@reply2)
    expect(u.name).to eq "aapirails"
    expect(u.refresh_token).to eq "bbbb0000"
    expect(u.reddit_id).to eq "1111"
    expect(u.comment_karma).to eq 200
  end

end
