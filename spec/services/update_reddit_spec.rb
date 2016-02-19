require 'rails_helper'

RSpec.describe UpdateReddit, type: :model do
  it "makes api calls" do
    VCR.use_cassette "worker-api-calls" do
      @updater = UpdateReddit.new
      build_params = @updater.make_api_calls

      filters = [:top, :new, :rising, :controversial, :hot, :gilded]
      expect(build_params.keys).to eq filters

      first_controversial_author = "GallowBoob"
      first_controversial_title = "Native New Zealand Maori girls"

      expect(build_params[:controversial].first.author).to eq first_controversial_author
      expect(build_params[:controversial].first.title).to eq first_controversial_title
    end
  end

  it "builds size 1 cache" do
    VCR.use_cassette "worker-api-calls" do
      expect(Cache.count).to eq 0
      @updater = UpdateReddit.new
      expect(Cache.count).to eq 1
      @updater = UpdateReddit.new
      expect(Cache.count).to eq 1
    end
  end

end
