require 'clockwork'
require 'clockwork/database_events'
require File.expand_path('../../../config/boot',        __FILE__)
require File.expand_path('../../../config/environment', __FILE__)
require 'stalker'

module Clockwork
  handler do |job, time|
    puts "Running #{job} at #{time}"
    UpdateReddit.new
    # Stalker.enqueue(job)
  end

  every(15.seconds, 'update.reddit')
end
