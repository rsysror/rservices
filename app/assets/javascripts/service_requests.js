function rating_value_feed(selector,score){
    $('#'+ selector).raty({readOnly: true,  score: score });    
}

$(document).on("turbolinks:load", function() {
	$(document).on('change', '#service_request_select_comment', function() {
         if ( this.value === 'Other Reason')
         {
           $("#comment-field").show();
           validate_comment()
         }
         else
         {
           $("#comment-field").hide();
         }
    });

    function validate_comment(){
        $("#comment_form").validate({
            errorPlacement: function (error, element) {
              error.insertBefore(element);
            },
            rules: {
              "service_request[comment]":{
                required: true,
                maxlength: 150,
                minlength: 15
              }
            },
            messages: {
              "service_request[comment]":{
                required: "Description is required!",
                maxlength: "Maximum 150 characters are allowed!",
                minlength: "Minimum 15 characters required!"
              }
            }
        })
    };
});