$(document).ready(function(){
  cast_vote('.upvote');
  cast_vote('.downvote');
})

$(document).ajaxComplete(function(){
  cast_vote('.upvote');
  cast_vote('.downvote');
})


var class_to_vote = {'upvote':1, 'downvote':-1}

var cast_vote = function(class_name){
  $(class_name).click(function(){
    var post_id = this.classList[1]

    var vote_count = 0
    var color = ""

    if (class_name == ".upvote"){
      vote_count = 1
      color = 'orange'
    } else {
      vote_count = -1
      color = 'purple'
    }

    $.ajax({
       type:"GET",
       url: "/api/v1/vote/" + post_id + "/" + vote_count,
       success: function(msg) {
         $(this).css('backgroundColor', color)
       },
       error: function(something, msg){
          alert(msg)
       }
    });
  })
}
