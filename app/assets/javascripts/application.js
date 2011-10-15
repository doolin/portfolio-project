// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//= require jquery
//= require jquery_ujs
//= require_tree .
   	
$(document).ready( function() {
  $(".tags").css("color","black");
  

  $('#project_summary').startCounting({limit: 255});
  $('#project_description').startCounting({limit: 2500});

  // Show extra profile information on gravatar
  $('.profile_block').hover(
      function() { $('.profile_info', this).animate({"bottom": "0"}); },
      function() { $('.profile_info', this).animate({"bottom": "-38"}); } 
  ); 
});
