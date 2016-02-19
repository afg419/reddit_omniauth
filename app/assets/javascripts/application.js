// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets

$(document).ready(function(){
  $('.nav-tabs a').click(function(){
    $(this).tab('show');
  })

  get_posts_by_filter('.nav-top','top');
  get_posts_by_filter('.nav-new','new');
  get_posts_by_filter('.nav-rising','rising');
  get_posts_by_filter('.nav-controversial','controversial');
  get_posts_by_filter('.nav-hot','hot');
  get_posts_by_filter('.nav-gilded','gilded');
  get_posts_by_subreddit('.sub-all' , "all")

  for(i = 0; i < default_subreddits.length; i++){
    get_posts_by_subreddit('.sub-' + default_subreddits[i] , default_subreddits[i])
  }

get_posts_on_refresh();
  cast_vote('.downvote');
  color_all_votes();
})
