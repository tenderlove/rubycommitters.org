$(document).ready(function(){
	//equalize the height of each account in the INDEX list
	// #accounts is the scope that indicates the INDEX view
	$('#accounts .account').equalHeights();
	
	
	//gather the user names of each account in the INDEX list
	var usernames = new Array();
	$('#accounts .account').each(function(i){
	  usernames[i] = $(this).find('h2').text();
	})
	
	//bind the filter input on the INDEX list
	$('#filter_by_username').keyup(function(){
	  $('#accounts .account').addClass('hide');
	  regexp = new RegExp($(this).val().toLowerCase());
	  for(var i=0; i<usernames.length; i++) {
	    if(usernames[i].toLowerCase().match(regexp)){
	      $('#accounts .account').find('h2:contains('+usernames[i]+')').closest('.account').removeClass('hide');
	    }
    }
    var count = $('.account').not('.hide').length;
    switch (count) {
      case 1:
        results = count+" result";
        break;
      default:
        results = count+" results";
        break;
    }
    if ($(this).val() != '') {
      $('#filter .results').html(results);
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