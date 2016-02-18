var get_posts = function(class_name, subreddit ,filter_by){
  $(class_name).click(function(){
    $.ajax({
       type:"GET",
       url: "/api/v1/posts/r/" + subreddit + "/" + filter_by,
       success: function(msg) {
         render_to_posts_page(msg, subreddit + "/" + filter_by)
         cast_vote('.upvote');
         cast_vote('.downvote');
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
      "<h4>" +   "<a class='" + "upvote" + " " + post.id +  " " + "btn'>^^^</a> <a class='" + "downvote" + " " + post.id +  " " + "btn'>vvv</a> Upvotes:" + post.ups + "</h4>" +
      "<p>submitted by " + post.author + "to r/" + post.subreddit +"</p>" +
      "<p>Comments: " + post.num_comments + "</p>" +
      "</div>"
    )
    }
}
