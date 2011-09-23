url = "http://search.twitter.com/search.json";

$.ajax({
	type: 'GET',
	  url: url,
	  data: {
		  q: 'cats'		 
	  },
	  success: success1,
	  dataType: 'jsonp'
	});


function success1(result) {
	
	console.log(result);
}