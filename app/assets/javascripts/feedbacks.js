$(function(){
  $('#default').raty(
    {click: function(score, evt) 
      {
        $('#feedback_rating').val(score);
      }
  }); 
});