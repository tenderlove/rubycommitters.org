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
    speed = 1000,  // animation speed
    $wall = $('#accounts')
  ;

  $wall.masonry({
    columnWidth: 300, 
    // only apply masonry layout to visible elements
    itemSelector: '.account:not(.invis)',
    animate: true,
    animationOptions: {
      duration: speed,
      queue: false
    }
  });
	
	
	//gather the user names of each account in the INDEX list
	var usernames = new Array();
	$('#accounts .account').each(function(i){
	  usernames[i] = $(this).find('h2').text();
	})
	
	//bind the filter input on the INDEX list
	$('#filter_by_username').keyup(function(){
	  var count = 0;
	  $('.stay_alive').removeClass('stay_alive');
	  regexp = new RegExp($(this).val().toLowerCase());
	  for(var i=0; i<usernames.length; i++) {
	    if(usernames[i].toLowerCase().match(regexp)){
	      count++;
	      $('#accounts .account').find('h2:contains('+usernames[i]+')').closest('.account').addClass('stay_alive');
	    }
    }
    
    $('.stay_alive').removeClass('invis').fadeIn(speed);
    $('.account').not('.stay_alive').addClass('invis').fadeOut(speed);

    $wall.masonry();
    
    if ($(this).val() != '') {
      $('#filter .results').html(count == 1 ? count+" result" : count+" results");
    } else {
      $('#filter .results').empty();
    }
	})
	
	// Set the card height relative to the services height
	s_height = $('.my_services').height();      // services
	a_height = $('#account .account').height(); // account
	if (s_height >= a_height) {
	  $('#account .account').height(s_height);
	}
	
	// accont popout
	$('#accounts .account').hover(function() {
	 $(this).addClass('account_hover');
	}, function() {
	 $(this).removeClass('account_hover');
	});
});