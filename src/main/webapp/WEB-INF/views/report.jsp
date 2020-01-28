<%@include file="tag-libs.jspf"%>
<c:if test="${not empty response.id}">
<div class="card">
	<div class="card-header" id="city${response.id}">
		<h2 class="mb-0">
			<button class="btn btn-link" type="button" data-toggle="collapse"
				data-target="#collapse${response.id}" aria-expanded="true"
				aria-controls="collapse${response.id}">City -
				${response.name}</button>
		</h2>
	</div>
	<div id="collapse${response.id}" class="collapse collapsed"
		aria-labelledby="city${response.id}" data-parent="#cityAccordion">
		<table class="table table-striped">
			<thead>
				<tr align="center">
					<th>ID</th>
					<th>Name</th>
					<th>Code</th>
					<th>Date</th>
					<th>TimeZone</th>
					<th>Clouds</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>${response.id}</td>
					<td>${response.name}</td>
					<td>${response.cod}</td>
					<td>${response.date}</td>
					<td>${response.timezone}</td>
					<td>${response.clouds.all}</td>
				</tr>
				<tr align="center">
					<th colspan="6" align="center">Coordinates</th>
				</tr>
				<tr align="center">
					<td colspan="3" align="center">Lat - ${response.coord.lat}
					<td colspan="3" align="center">Long - ${response.coord.lon}</td>
				</tr>
				<tr align="center">
					<th colspan="6" align="center">Wind</th>
				</tr>
				<tr align="center">
					<td colspan="3" align="center">Speed - ${response.wind.speed}</td>
					<td colspan="3" align="center">Degree - ${response.wind.deg}</td>
				</tr>
				<tr align="center">
					<th colspan="6" align="center">Weather</th>
				</tr>
				<tr align="center">
					<th align="center">Id</th>
					<th align="center">Main</th>
					<th colspan="2" align="center">Description</th>
					<th colspan="2" align="center">Icon</th>
				</tr>
				<c:forEach items="${response.weather}" var="weather">
					<tr align="center">
						<td align="center">${weather.id}</td>
						<td align="center">${weather.main}</td>
						<td colspan="2" align="center">${weather.description}</td>
						<td colspan="2" align="center">${weather.icon}</td>
					</tr>
				</c:forEach>
				<tr align="center">
					<th colspan="6" align="center">Sys</th>
				</tr>
				<tr align="center">
					<td colspan="2" align="center">Country -
						${response.sys.country}</td>
					<td colspan="2" align="center">Sunrise -
						${response.sys.sunriseStr}</td>
					<td colspan="2" align="center">Sunset -
						${response.sys.sunsetStr}</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-striped">
			<thead>
				<tr align="center">
					<th colspan="8" align="center">Main</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td align="center">temp - ${response.main.temp}</td>
					<td align="center">feels_like - ${response.main.feels_like}</td>
					<td align="center">temp_min - ${response.main.temp_min}</td>
					<td align="center">temp_max - ${response.main.temp_max}</td>
					<td align="center">pressure - ${response.main.pressure}</td>
					<td align="center">humidity - ${response.main.humidity}</td>
					<td align="center">sea_level - ${response.main.sea_level}</td>
					<td align="center">grnd_level - ${response.main.grnd_level}</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</c:if>
