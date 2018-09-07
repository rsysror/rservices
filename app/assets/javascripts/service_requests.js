function rating_value_feed(selector,score){
	console.log(selector);
	$('#'+ selector).raty({readOnly: true,  score: score });	
}