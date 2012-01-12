// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree ./foundation
//= require_self
//= require ajaxray_textcounting
   	
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

$(window).load(function() {
         $('#featured').orbit();
});

// For Google+
(function() {
  var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
  po.src = 'https://apis.google.com/js/plusone.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();