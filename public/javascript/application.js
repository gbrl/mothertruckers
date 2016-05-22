$(document).ready(function() {

  // SEARCH 

    $("#searchbar-input").keypress(function (e) {
      if (e.which == 13) {
        e.preventDefault();
        var search_query = $(this).val();
        search_query = search_query.replace("?","");
        base_url = "http://localhost:3000/search?"
        search_url = base_url + search_query
        window.location = search_url;
      }
    });

    // $('#searchbar').on('submit', function(e) {
    //   e.preventDefault();
    // });

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


  // FAVOURITES 

  $(".heart").hover(function(){
      $(this).attr("src", function(index, attr){
        return attr.replace(".png", "_red.png");
      });
    }, function(){
      $(this).attr("src", function(index, attr){
          return attr.replace("_red.png", ".png");
      });
  });


  $(".heart-live-anchor").on("click", function(e){

    e.preventDefault();

    $(this).children(".heart").attr("src", function(index, attr){
        return attr.replace(".png", "_red.png");
    });

    $(this).children(".hearted").attr("src", function(index, attr){
        return attr.replace("_red.png", ".png");
    });

    // Get some values from elements on the page:
    var user_id  = $(this).attr("userid");
    var truck_id  = $(this).attr("truckid");
    var form_url  = "/users/" + user_id + "/favourites/" + truck_id;

    // Send the data using post
    var posting = $.post( form_url, { user_id: user_id, truck_id: truck_id } );
  });


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

  if($('#all-trucks').length > 0) {
    $grid = $('#all-trucks');
    $grid.masonry({
    // options
      itemSelector: '.truck-box',
      columnWidth: 300
    });
    $grid.imagesLoaded().progress( function() {
      $grid.masonry('layout');

      var search_query = location.search;
      search_query = search_query.replace("?","");
      if (search_query.length > 0) {
        $("#all-trucks .truck-box").each(function(){
            var text = $(this).text().toLowerCase().trim();
             if (text.indexOf(search_query) >= 0) {
               $(this).show();
               $grid.masonry('layout');
             } else {
               $(this).hide();
               $grid.masonry('layout');
             }
          });
      }
    });
  }

});
