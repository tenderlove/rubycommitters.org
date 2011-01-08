/*
Authors:
Joe Sak     joe@joesak.com
Nic Haynes  nic@nicinabox.com
*/

$(document).ready(function(){
	//equalize the height of each account in the INDEX list
	// #accounts is the scope that indicates the INDEX view
	$('#accounts .account').equalHeights();
	
	var
	  count = 0;
    speed = 500,  // animation speed
    $wall = $('#accounts')
    options = {
      columnWidth: 300, 
      // only apply masonry layout to visible elements
      itemSelector: '.account:not(.kill)',
      animate: true,
      animationOptions: {
        duration: speed,
        queue: false
      }
    }
  ;
  
  $wall.masonry(options);
	
	//bind the filter input on the INDEX list
	$('#filter_by_username').keyup(function(){
    if ($(this).val() != '') {
      $('.stay_alive').removeClass('stay_alive');
  	  $.get('/accounts/filter/'+$(this).val().toLowerCase(), function(data){
  	    $.each(data, function(i) {	      
  	     $('#accounts .account#account_'+data[i].account.id).addClass('stay_alive');             
        });
      
        $('.stay_alive').removeClass('kill').fadeIn(speed);
        $('.account').not('.stay_alive').addClass('kill').fadeOut(speed);
      
        $wall.masonry(options);
        
        if ($('#filter .results').is(':empty')) {
          $('#filter .results').hide(); 
        }
        $('#filter .results').html(data.length == 1 ? data.length+" result" : data.length+" results").fadeIn('fast'); 
      });
    } else {
     $('#filter .results').fadeOut('fast', function(){$(this).empty()});
     $('.account').removeClass('kill').fadeIn(speed);
     $wall.masonry(options);
    }   
	});
	
	$('a.big_link').hover(function(){
	  $('.stay_alive').removeClass('stay_alive');
	})
	
	// Set the card height relative to the services height
	s_height = $('.my_services').height();      // services
	a_height = $('#account .account').height(); // account
	if (s_height >= a_height) {
	  $('#account .account').height(s_height);
	}
});