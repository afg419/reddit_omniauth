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

  get_posts('.nav-top','all', 'top');
  get_posts('.nav-new','all', 'new');
  get_posts('.nav-rising','all', 'rising');
  get_posts('.nav-controversial','all', 'controversial');
  get_posts('.nav-hot','all', 'hot');
  get_posts('.nav-gilded','all', 'gilded');
  get_posts_from_current_subreddit();
  cast_vote('.upvote');
  cast_vote('.downvote');
  color_all_votes();
})
