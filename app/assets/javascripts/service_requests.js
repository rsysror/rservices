function rating_value_feed(selector,score){
    $('#'+ selector).raty({readOnly: true,  score: score });    
}

$(document).on("turbolinks:load", function() {
	$(document).on('change', '#service_request_select_comment', function() {
         if ( this.value === 'Other Reason')
         {
           $("#comment-field").show();
         }
         else
         {
           $("#comment-field").hide();
         }
    });
});