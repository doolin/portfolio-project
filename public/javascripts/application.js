// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

   	
$(document).ready( function() {
  $(".tags").css("color","black");
  

  $('#project_summary').startCounting({limit: 255});
  $('#project_description').startCounting({limit: 2500});


  
});
