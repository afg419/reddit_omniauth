$("#aarons-messages").empty();
$("#new-message").empty();
$("#jordans-messages").html("<%= escape_javascript(render partial: 'messages.html.erb', locals: {messages: @messages}) %> ");
