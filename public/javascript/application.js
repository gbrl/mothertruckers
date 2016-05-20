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

$(document).ready(function(){
  var submitIcon = $('.searchbox-icon');
  var inputBox = $('.searchbox-input');
  var searchBox = $('.searchbox');
  var isOpen = false;
  submitIcon.click(function(){
      if(isOpen === false){
          searchBox.addClass('searchbox-open');
          inputBox.focus();
          isOpen = true;
      } else {
          searchBox.removeClass('searchbox-open');
          inputBox.focusout();
          isOpen = false;
      }
  });
   submitIcon.mouseup(function(){
          return false;
      });
  searchBox.mouseup(function(){
          return false;
      });
  $(document).mouseup(function(){
          if(isOpen === true){
              $('.searchbox-icon').css('display','block');
              submitIcon.click();
          }
      });
});
  function buttonUp(){
      var inputVal = $('.searchbox-input').val();
      inputVal = $.trim(inputVal).length;
      if( inputVal !== 0){
          $('.searchbox-icon').css('display','none');
      } else {
          $('.searchbox-input').val('');
          $('.searchbox-icon').css('display','block');
      }
  }
