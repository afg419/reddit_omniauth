class Cache < ActiveRecord::Base
  serialize :top
  serialize :new
  serialize :rising
  serialize :controversial
  serialize :hot
  serialize :gilded
end
