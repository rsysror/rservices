// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require moment
//= require twitter/bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .


$(function(){
  $('select').change(function () {
  $('.loading').show();
  })
})

$(document).on('ready turbolinks:load', function() {
  $('.side-menu a').filter(function(){
    return this.href==location.href}).addClass('active').siblings('a').removeClass('active')
    $('.side-menu a').click(function(){
    $(this).addClass('active').siblings().removeClass('active')  
  })
})


// function add_date_picker_function(){
// $('#datetimepicker1').datetimepicker({format: 'YYYY/MM/DD',minDate: '0'}).on('dp.change',function(e){
// 	$.get( '#{get_services_path}', { city_id: $('#city_selection').val(), 
// 		portfolio_id: $('#service_request_portfolio_id').val(),date: $('#date_value').val()})
// });
// }