$(document).ready(function() {

  // LAUNCH MASONRY
  $grid = $('#all-trucks');
  $grid.masonry({
  // options
    itemSelector: '.truck-box',
    columnWidth: 320
  });
  $grid.masonry('layout');

  // SETUP SEARCH BEHAVIOUR
  $('#searchbar').on('submit', function(e) {
    e.preventDefault();
  });

  $('#searchbar input').on('keyup', _.debounce(filterTrucks, 110));

  function filterTrucks(){
     var valThis = $(this).val();
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
  }  
  
});
