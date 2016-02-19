# this file is for rails specific testing helpers

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# require 'vcr'
require 'simplecov'
require 'capybara/rspec'
require 'capybara/rails'

SimpleCov.start "rails"

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  def create_cache(filter = "top")
    Cache.create({filter.to_sym => [OpenStruct.new({
                        :domain=>"imgur.com",
                        :banned_by=>nil,
                        :media_embed=>{"content"=>"&lt;iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=%2F%2Fimgur.com%2Fa%2Figwwn%2Fembed&amp;url=http%3A%2F%2Fimgur.com%2Fa%2Figwwn&amp;image=http%3A%2F%2Fi.imgur.com%2FfCBFh1R.jpg%3Ffb&amp;key=2aa3c4d5f3de4f5b9120b660ad850dc9&amp;type=text%2Fhtml&amp;schema=imgur\" width=\"550\" height=\"550\" scrolling=\"no\" frameborder=\"0\" allowfullscreen&gt;&lt;/iframe&gt;", "width"=>550, "scrolling"=>false, "height"=>550},
                        :subreddit=>"funny",
                        :selftext_html=>nil,
                        :selftext=>"",
                        :likes=>nil,
                        :suggested_sort=>nil,
                        :user_reports=>[],
                        :secure_media=>{"oembed"=>{"provider_url"=>"http://imgur.com", "description"=>"This album is really big! It's going to take us a bit to get your download ready for you. Enter your email and we will notify you when it's ready. Once ready, it will be available for up to 24 hours.", "title"=>"Imgur: The most awesome images on the Internet", "type"=>"rich", "thumbnail_width"=>600, "height"=>550, "width"=>550, "html"=>"&lt;iframe class=\"embedly-embed\" src=\"https://cdn.embedly.com/widgets/media.html?src=%2F%2Fimgur.com%2Fa%2Figwwn%2Fembed&amp;url=http%3A%2F%2Fimgur.com%2Fa%2Figwwn&amp;image=http%3A%2F%2Fi.imgur.com%2FfCBFh1R.jpg%3Ffb&amp;key=2aa3c4d5f3de4f5b9120b660ad850dc9&amp;type=text%2Fhtml&amp;schema=imgur\" width=\"550\" height=\"550\" scrolling=\"no\" frameborder=\"0\" allowfullscreen&gt;&lt;/iframe&gt;", "version"=>"1.0", "provider_name"=>"Imgur", "thumbnail_url"=>"https://i.embed.ly/1/image?url=http%3A%2F%2Fi.imgur.com%2FfCBFh1R.jpg%3Ffb&amp;key=b1e305db91cf4aa5a86b732cc9fffceb", "thumbnail_height"=>315}, "type"=>"imgur.com"},
                        :link_flair_text=>nil,
                        :id=>"46i27j",
                        :from_kind=>nil,
                        :gilded=>1,
                        :archived=>false,
                        :clicked=>false,
                        :report_reasons=>nil,
                        :author=>"sal_marin",
                        :media=>{"oembed"=>{"provider_url"=>"http://imgur.com", "description"=>"This album is really big! It's going to take us a bit to get your download ready for you. Enter your email and we will notify you when it's ready. Once ready, it will be available for up to 24 hours.", "title"=>"Imgur: The most awesome images on the Internet", "type"=>"rich", "thumbnail_width"=>600, "height"=>550, "width"=>550, "html"=>"&lt;iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=%2F%2Fimgur.com%2Fa%2Figwwn%2Fembed&amp;url=http%3A%2F%2Fimgur.com%2Fa%2Figwwn&amp;image=http%3A%2F%2Fi.imgur.com%2FfCBFh1R.jpg%3Ffb&amp;key=2aa3c4d5f3de4f5b9120b660ad850dc9&amp;type=text%2Fhtml&amp;schema=imgur\" width=\"550\" height=\"550\" scrolling=\"no\" frameborder=\"0\" allowfullscreen&gt;&lt;/iframe&gt;", "version"=>"1.0", "provider_name"=>"Imgur", "thumbnail_url"=>"http://i.imgur.com/fCBFh1R.jpg?fb", "thumbnail_height"=>315}, "type"=>"imgur.com"},
                        :score=>6462,
                        :approved_by=>nil,
                        :over_18=>false,
                        :hidden=>false,
                        :preview=>{"images"=>[{"source"=>{"url"=>"https//i.redditmedia.com/XephHPsufOlI9OCIeWEXUcsiga6IOxKfMS1hnN5gCrw.jpg?s=e2d4e28a7033a041644e2cde49973bab", "width"=>600, "height"=>315}, "resolutions"=>[{"url"=>"https://i.redditmedia.com/XephHPsufOlI9OCIeWEXUcsiga6IOxKfMS1hnN5gCrw.jpg?fit=crop&amp;crop=faces%2Centropy&amp;arh=2&amp;w=108&amp;s=ebfccfe42126c9be8cd1eafef234378d", "width"=>108, "height"=>56}, {"url"=>"https://i.redditmedia.com/XephHPsufOlI9OCIeWEXUcsiga6IOxKfMS1hnN5gCrw.jpg?fit=crop&amp;crop=faces%2Centropy&amp;arh=2&amp;w=216&amp;s=85f55e540d10885d3d9b344db5d01cc9", "width"=>216, "height"=>113}, {"url"=>"https://i.redditmedia.com/XephHPsufOlI9OCIeWEXUcsiga6IOxKfMS1hnN5gCrw.jpg?fit=crop&amp;crop=faces%2Centropy&amp;arh=2&amp;w=320&amp;s=d0b37d59bad3f8ab643df1d2be08967e", "width"=>320, "height"=>168}], "variants"=>{}, "id"=>"eZ-0VNdFW0Ik30ZL3k5tMFng2PB3i5GFthULcgTB6vQ"}]},
                        :num_comments=>1307,
                        :thumbnail=>"http://a.thumbs.redditmedia.com/D2aNnrthB-OVrpl0hfnKzTOd34SXNsuEYXDGzTyxNG0.jpg",
                        :subreddit_id=>"t5_2qh33",
                        :hide_score=>false,
                        :edited=>false,
                        :link_flair_css_class=>nil,
                        :author_flair_css_class=>nil,
                        :downs=>0,
                        :secure_media_embed=>{"content"=>"&lt;iframe class=\"embedly-embed\" src=\"https://cdn.embedly.com/widgets/media.html?src=%2F%2Fimgur.com%2Fa%2Figwwn%2Fembed&amp;url=http%3A%2F%2Fimgur.com%2Fa%2Figwwn&amp;image=http%3A%2F%2Fi.imgur.com%2FfCBFh1R.jpg%3Ffb&amp;key=2aa3c4d5f3de4f5b9120b660ad850dc9&amp;type=text%2Fhtml&amp;schema=imgur\" width=\"550\" height=\"550\" scrolling=\"no\" frameborder=\"0\" allowfullscreen&gt;&lt;/iframe&gt;", "width"=>550, "scrolling"=>false, "height"=>550},
                        :saved=>false,
                        :removal_reason=>nil,
                        :post_hint=>"link",
                        :stickied=>false,
                        :from=>nil,
                        :is_self=>false,
                        :from_id=>nil,
                        :permalink=>"/r/funny/comments/46i27j/friends_pranked_me_by_converting_my_bedroom_to_a/",
                        :locked=>false,
                        :name=>"t3_46i27j",
                        :created=>1455872411.0,
                        :url=>"http://imgur.com/a/igwwn",
                        :author_flair_text=>nil,
                        :quarantine=>false,
                        :title=>"Friends pranked me by converting my bedroom to a utility closet.",
                        :created_utc=>1455843611.0,
                        :distinguished=>nil,
                        :mod_reports=>[],
                        :visited=>false,
                        :num_reports=>nil,
                        :ups=>6462
              })]})
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end


  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end


  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end


  config.before(:each) do
    DatabaseCleaner.start
  end


  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include FactoryGirl::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.ignore_hosts '127.0.0.1'
  c.hook_into :webmock
end
