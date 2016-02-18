$(document).ready(function(){
  cast_vote('.upvote');
  cast_vote('.downvote');
})

var cast_vote = function(class_name){
  $(class_name).click(function(){
    post_id = this.classList[1]
    var vote_count = 0

    if (class_name == ".upvote"){
      vote_count = 1
    } else {
      vote_count = -1
    }

    $.ajax({
       type:"GET",
       url: "/api/v1/vote/" + post_id + "/" + vote_count,
       success: function(msg) {
         color_votes(msg);
       },
       error: function(something, msg){
          alert(msg)
       }
    });
  })
}

var color_votes = function(msg){
  for (var property in msg) {
      if (msg.hasOwnProperty(property)) {
        $(".upvote" + "." + property).removeClass('orange')
        $(".downvote" + "." + property).removeClass('purple')

        if (msg[property] == 1){
          $(".upvote" + "." + property).addClass('orange')
        } else if (msg[property] == -1){
          $(".downvote" + "." + property).addClass('purple')
        }
      }
  }
}
