var prepare_votes = function(){
  cast_vote('.upvote');
  cast_vote('.downvote');
  color_all_votes();
}

//called when tab clicked

var get_posts = function(class_name, selected, type){
  $(class_name).click(function(){
    $.ajax({
       type:"GET",
       url: "/api/v1/posts/r/?"+type+"=" + selected,
       success: function(msg) {
         render_to_posts_page(msg)
         prepare_votes();
       },
       error: function(something, msg){
          alert(msg)
       }
    });
  })
}

// When refreshing, the following is called

var get_posts_on_refresh = function(){
  $.ajax({
     type:"GET",
     url: "/api/v1/posts/r/",
     success: function(msg) {
       render_to_posts_page(msg);
       prepare_votes();
     },
     error: function(something, msg){
        alert(msg)
     }
  });
}

// this renders the new content to page

var render_to_posts_page = function(json_reply){

  $.getJSON( "/api/v1/posts/title", function(msg) {
    var title = "" + msg.subreddit + "/" + msg.filter
    $("#json-posts").prepend(
      "<h2>" + title + "</h2>"
    );
  });
  $("#json-posts").empty();

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
