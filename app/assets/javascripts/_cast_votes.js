$(document).ready(function(){
  cast_vote('.upvote');
  cast_vote('.downvote');
})

var cast_vote = function(class_name){
  $(class_name).click(function(){
    post_id = this.classList[1]
    class_name = class_name
    var vote_count = 0
    color = ""

    if (class_name == ".upvote"){
      vote_count = 1
      color = 'orange'
      $(".downvote" + "." + post_id).removeClass('purple')
    } else {
      vote_count = -1
      color = 'purple'
      $(".upvote" + "." + post_id).removeClass('orange')
    }

    $.ajax({
       type:"GET",
       url: "/api/v1/vote/" + post_id + "/" + vote_count,
       success: function(msg) {
         $(class_name + "." + post_id).toggleClass(color)
       },
       error: function(something, msg){
          alert(msg)
       }
    });
  })
}
