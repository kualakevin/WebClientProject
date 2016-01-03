
function process(){
	var xmlHttp = new XMLHttpRequest();
	var responseHandler = function() {
		if(xmlHttp.readyState == 4){
			var reply_string = xmlHttp.responseText;
			document.getElementById("under-input").innerHTML = reply_string;
		}
	};
	xmlHttp.onreadystatechange = responseHandler;
	var temp = "EventsHelperAvailable.jsp?search-input=" + document.getElementById("search-input").value;
	xmlHttp.open("GET", temp , true);
	xmlHttp.send(null);
}

function search(){
	var xmlHttp = new XMLHttpRequest();
	var responseHandler = function() {
		if(xmlHttp.readyState == 4){
			var reply_string = xmlHttp.responseText;
			//need to change table
			var reply_array; 
			var event_name;
			var event_details;
			var event_signup_url;
			var format = 
				"<div class = \"table-wrapper-error\" id=\"table-wrapper\">"+
					"<table class=\"table-error\">"+
						"<tr class = \"table-header\"> " +
							"<td class=\"table-name-wrapper\">Name</td>"+
							"<td class=\"table-detail-wrapper\">Details</td>"+
							"<td class=\"table-url-wrapper\">Link</td>"+
						"</tr>"+
					"</table>"+
				"</div>";
			if(reply_string != ""){
				reply_array = reply_string.split(";");
				event_name = reply_array[0];
				event_details = reply_array[1];
				event_signup_url = reply_array[2];
				format = 
				"<div class = \"table-wrapper\" id=\"table-wrapper\">"+
					"<table class=\"table\">"+
						"<tr class = \"table-header\"> " +
							"<td class=\"table-name-wrapper\">Name</td>"+
							"<td class=\"table-detail-wrapper\">Details</td>"+
							"<td class=\"table-url-wrapper\">Link</td>"+
						"</tr>"+
						"<tr>"+
							"<td class=\"table-name-wrapper\">"+event_name+"</td>"+
							"<td class=\"table-detail-wrapper\">"+ event_details +"</td>"+
							"<td class=\"table-url-wrapper\">"+event_signup_url+"</td>"+
						"</tr>"+
					"</table"+
				"</div>";
			}
			document.getElementById("table-wrapper").outerHTML = format;
		}
	};
	xmlHttp.onreadystatechange = responseHandler;
	var temp = "EventsHelperSearch.jsp?search-input=" + document.getElementById("search-input").value;
	xmlHttp.open("GET", temp , true);
	xmlHttp.send(null);
}