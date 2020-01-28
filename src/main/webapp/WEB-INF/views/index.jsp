<%@include file="tag-libs.jspf"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<title>Weather Report</title>
</head>
<body>
	<div class="container">
		<!-- Content Row -->
		<div class="row">
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">
							Enter City<span></span>
						</h2>

						<div class="card_cont_mn playlist_mn">
							<input type="text" id="cityNameId" required="required"> <input
								type="button" name="Submit" value="Submit"
								onclick="findWeatherReport();">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Weather Report</h2>
						<div class="card_cont_mn" id="responseId">
						<div class="accordion" id="cityAccordion">
						</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-12 mb-5">

				<span class="my-6"> &nbsp; </span>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="<c:url value='/assets/js/index.js'/>"></script>
</body>
</html>