$(document).ready(function() {

  // RATINGS FORM
  $("#rateit-range-2").on("click", function(){

    // Get some values from elements on the page:
    var $form = $("#ratings-form");
    var rating = $("#rateit-range-2").attr("aria-valuenow");
    var user_id = $form.find( "input[name='user_id']" ).val();
    var truck_id = $form.find( "input[name='truck_id']" ).val();
    var form_url = $form.attr( "action" );

    // Send the data using post
    var posting = $.post( form_url, { score: rating, user_id: user_id, truck_id: truck_id } );
  });

  // LAUNCH MASONRY
  $grid = $('#all-trucks');
  $grid.masonry({
  // options
    itemSelector: '.truck-box',
    columnWidth: 300
  });
  $grid.imagesLoaded().progress( function() {
    $grid.masonry('layout');
  });

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
