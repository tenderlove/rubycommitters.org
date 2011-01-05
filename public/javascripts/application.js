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
	$('#filter_by_username').change(function(){

	})
	
});