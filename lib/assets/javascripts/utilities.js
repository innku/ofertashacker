$.urlParam = function(name){
	var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(window.location.href);
	if(results != null) {
		return decodeURIComponent(results[1].replace(/\+/g, " "));
  } else 
		return "";
}
