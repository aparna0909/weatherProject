function findWeatherReport() {
	$("#cityAccordion").html("");
	var cityName = $("#cityNameId").val();
	if (cityName == null || cityName == "") {
		alert("City name can't be empty");
		return;
	}
	var nameArr = cityName.split(',');
	for (i in nameArr) {
		var name=nameArr[i].trim();
		if (name
				.match("^([a-zA-Z\u0080-\u024F]+(?:. |-| |'))*[a-zA-Z\u0080-\u024F]*$")) {
			$.ajax({
				'url' : 'fetchWeatherReport',
				'type' : 'POST',
				'data' : {
					'cityName' : name
				},
				'success' : function(res) {
					$("#cityAccordion").append(res);
				}
			}).done(function() {

			})
		}else{
			alert("Invalid city name -" +name);
		}
	}
}