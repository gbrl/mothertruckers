$(document).ready(function() {

  // LAUNCH MASONRY
  $grid = $('#all-trucks');
  $grid.masonry({
  // options
    itemSelector: '.truck-box',
    columnWidth: 310
  });

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
         console.log("Found a match.");
         // console.log(text);
         //$(this).show()
         //thangs.push($(this)[ 0 ]);
         $grid.masonry('addItems', $(this)[ 0 ]).masonry('layout');
       } else {
         //thangs.push($(this)[ 0 ]);
         $grid.masonry('remove', $(this)[ 0 ]).masonry('layout');
       }
    });

    //console.log(thangs);
    
  });

    
});
