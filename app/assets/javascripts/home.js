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
