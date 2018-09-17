$(document).ready(function() { 
  
  // $("form#signup_form").submit(function(e) {
  //   e.preventDefault(); 
  //   form_Ajax(this, 'show_errors', 'submit_btn' );
  // });

  // $("form#login_form").submit(function(e) {
  //   e.preventDefault(); 
  //   // form_Ajax(this, 'display_errors', 'login_submit' );
  // });

});

  $(function(){  
    $('select').change(function () {
      var op = $(this).val();
      if (op != '') {
        $('#sub_service_create').prop('disabled', false);
      } 
      else 
      {
        $('#sub_service_create').prop('disabled', true);
      }
  });

});
