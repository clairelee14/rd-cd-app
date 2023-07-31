document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.dropdown-trigger');
    var instances = M.Dropdown.init(elems, {hover:true});
  });

  // fade #message if exists
 if($('#message').length){
  $( "#message" ).delay(3000).fadeOut({}, 3000);
  }

// $( document ).ready(function() {
//     console.log( "ready!" );
// });