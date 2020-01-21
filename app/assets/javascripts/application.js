// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require underscore
//= require gmaps/google

//= require jquery
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja
//= require select2


$(document).ready(function(){
  $('#calendar').fullCalendar({
  });
});

$(document).ready(function() {
  $('.mySelect2').select2();
});

$(document).ready(function() {
  $('.mySelect2').select2({
    maximumSelectionLength: 3,
	  width: 300,
    placeholder: 'This is my placeholder',
    allowClear: true
  });
});

$(function(){
  setTimeout("$('.alert').fadeOut('slow')", 1000)
})
