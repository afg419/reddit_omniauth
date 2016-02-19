require 'clockwork'
require 'clockwork/database_events'
require_relative './config/boot'
require_relative './config/environment'

module Clockwork

  handler do |job|
    puts "Running #{job}"
  end

  every(15.seconds, 'Updating Reddit') { Delayed::Job.enqueue UpdateReddit.new }
end
