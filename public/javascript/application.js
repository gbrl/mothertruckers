$(document).ready(function() {

  // LAUNCH MASONRY
  $grid = $('#all-trucks');
  $grid.masonry({
  // options
    itemSelector: '.truck-box',
    columnWidth: 310
  });
  $grid.masonry('layout');

  // SETUP SEARCH BEHAVIOUR

  $('#searchbar').on('submit', function(e) {
    e.preventDefault();
  });

  $('#searchbar input').keyup(function(){
   // console.clear();
   // $grid.masonry('reloadItems');
   var valThis = $(this).val();
   var thangs = new Array();
     $("#all-trucks .truck-box").each(function(){
       var text = $(this).text().toLowerCase().trim();
       if (text.indexOf(valThis) >= 0) {
         $(this).show();
         $grid.masonry('layout');
       } else {
         $(this).hide();
         $grid.masonry('layout');
       }
    });    
  });

    
});
