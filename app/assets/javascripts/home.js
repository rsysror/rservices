$(document).ready(function() { 
  
  $("form#new_user").submit(function(e) {
    e.preventDefault(); 
    var form = $(this);
    var url = form.attr('action');

    $.ajax({
      type: "POST",
      url: url,
      dataType: "json",
      data: form.serialize(), // serializes the form's elements.
      success: function(data)
      { 
        window.location.href = "/";
      },
      error: function(err)
      { 
        $('.display_errors').css('display','block');
        $(".display_errors").html(err.responseText);
      }
    });
  });

  $("form#login_form").submit(function(e) {
    e.preventDefault(); 
    var form = $(this);
    var url = form.attr('action');

    $.ajax({
      type: "POST",
      url: url,
      dataType: "json",
      data: form.serialize(), // serializes the form's elements.
      success: function(data)
      { 
        alert('success');
        debugger
        window.location.href = data.url;
      },
      error: function(err)
      { 
        $('.display_errors').css('display','block');
        $(".display_errors").html(err.responseText);
      }
    });
  });

});
