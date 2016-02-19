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

  get_posts('.nav-top','top', "filter_by");
  get_posts('.nav-new','new', "filter_by");
  get_posts('.nav-rising','rising', "filter_by");
  get_posts('.nav-controversial','controversial', "filter_by");
  get_posts('.nav-hot','hot', "filter_by");
  get_posts('.nav-gilded','gilded', "filter_by");
  get_posts('.sub-all' , "all", "subreddit")

  for(i = 0; i < default_subreddits.length; i++){
    get_posts('.sub-' + default_subreddits[i] , default_subreddits[i], "subreddit")
  }

get_posts_on_refresh();
  cast_vote('.downvote');
  color_all_votes();
})
