$( document ).ready(function() {
  $('#portfolio_service_id').on('change', function(e){
    e.preventDefault();

    var parent_id = $(this).val();
    $.ajax({
      url: "/partner/portfolio/get_subservices",
      type: "GET",
      data: {"parent_id" : parent_id},
      dataType: "html",
      success: function(data) {
        jQuery("#versionsDiv").html(data);
      }
    });
  })
});