function search(){
	var xmlHttp = new XMLHttpRequest();
	var responseHandler = function() {
		if(xmlHttp.readyState == 4){
			var reply_string = xmlHttp.responseText;
			var reply_array = [];
			var result_string="";
			if(reply_string != ""){
				reply_array = reply_string.split(";");
			}
			var i=0;
			while(i<reply_array.length-1){
					result_string = result_string + 
					"<div class=\"results-button-container\">" +
						"<input name=\"filename\" class=\"results-button\" type=\"submit\" value=\""+reply_array[i]+"\"/>" +
					"</div>";
					++i;
			}
			document.getElementById("results").innerHTML = result_string;
		}
	};
	xmlHttp.onreadystatechange = responseHandler;
	
	
	var temp = "ArchiveHelperSearch.jsp?name="+ document.getElementById("name").value +
			   "&year="+document.getElementById("year").value+
			   "&season="+document.getElementById("season").value;
	xmlHttp.open("GET", temp , true);
	xmlHttp.send(null);
}