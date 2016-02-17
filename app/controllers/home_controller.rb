class HomeController < ApplicationController
  def show
    @all = reddit_service.unauth_get(path: 'all/top')
    binding.pry
  end
end
