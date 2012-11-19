$.urlParam = function(name){
	var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(window.location.href);
	if(results != null)
		return results[1];
	else 
		return "";
}
