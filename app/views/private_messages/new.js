$("#aarons-messages").empty();
$("#jordans-messages").empty();
$("#new-message").html("<%= escape_javascript(render partial: 'new_message.html.erb', locals: {new_message: @message}) %> ");
