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
})

var get_posts = function(class_name, subreddit ,filter_by){
  $(class_name).click(function(){
    $.ajax({
       type:"GET",
       url: "/api/v1/posts/r/" + subreddit + "/" + filter_by,
       success: function(msg) {
         render_to_posts_page(msg, subreddit + "/" + filter_by)
       },
       error: function(something, msg){
          alert(msg)
       }
    });
  })
}

var render_to_posts_page = function(json_reply, title){
  $("#standard-posts").empty();
  $("#json-posts").empty();
  $("#json-posts").append(
    "<h2>" + title + "</h2>"
  );
  for (i=0; i< json_reply.length; i++){
    var post = json_reply[i].table
    $("#json-posts").append(
      "<div class='jumbotron'>" +
      "<h3>" + post.title + "</h3>" +
      "<h4>Upvotes: " + post.ups + "</h4>" +
      "<p>submitted by " + post.author + "to r/" + post.subreddit +"</p>" +
      "<p>Comments: " + post.num_comments + "</p>" +
      "</div>"
    )
    }
}
