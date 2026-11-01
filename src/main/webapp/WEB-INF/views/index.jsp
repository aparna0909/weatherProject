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
<style>
body { min-height: 100vh; background: linear-gradient(135deg, #eef6ff, #f4f8fb); color: #20334d; }
.weather-page { max-width: 960px; padding-top: 56px; padding-bottom: 32px; }
.weather-heading { margin-bottom: 28px; }
.weather-heading h1 { font-size: 2.4rem; font-weight: 700; letter-spacing: -1px; }
.weather-heading p, .search-hint { color: #596b80; }
.weather-page .card { border: 1px solid #e1e9f2; border-radius: 16px; box-shadow: 0 8px 28px rgba(32, 51, 77, .06); }
.weather-page .card-body { padding: 28px; }
.weather-page .card-title { font-size: 1.25rem; font-weight: 600; margin-bottom: 20px; }
.city-search { display: flex; gap: 12px; }
.city-search input { flex: 1; min-width: 0; height: 48px; border-radius: 8px; border: 1px solid #b6c6d8; padding: 10px 14px; }
.city-search button { border-radius: 8px; padding: 10px 22px; background: #245fc7; border-color: #245fc7; font-weight: 600; }
.city-search button:hover { background: #194ba3; border-color: #194ba3; }
.city-search input:focus, .city-search button:focus { outline: 3px solid #8cb5f5; outline-offset: 2px; }
.search-hint { font-size: .875rem; margin: 12px 0 0; }
#cityAccordion:empty::before { content: "Search for a city to see its weather here."; display: block; padding: 36px 16px; text-align: center; color: #596b80; background: #f6f9fd; border: 1px dashed #c6d5e7; border-radius: 10px; }
#responseId { overflow-x: auto; }
@media (max-width: 575px) {
    .weather-page { padding-top: 28px; }
    .weather-page .card-body { padding: 20px; }
    .city-search { flex-direction: column; }
}
</style>
</head>
<body>
	<main class="container weather-page">
        <header class="weather-heading">
            <h1>Weather Report</h1>
            <p>Check the current weather in your favorite cities.</p>
        </header>
		<!-- Content Row -->
		<div class="row">
			<div class="col-12 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">
							Find your city
						</h2>

                        <form onsubmit="findWeatherReport(); return false;">
                            <label for="cityNameId">City name</label>
                            <div class="city-search">
                                <input type="text" id="cityNameId" name="cityName" required
                                    placeholder="e.g. London, Paris" aria-describedby="cityHint">
                                <button type="submit" class="btn btn-primary">Get weather</button>
                            </div>
                            <p id="cityHint" class="search-hint">Compare cities by separating their names with commas.</p>
                        </form>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Your weather reports</h2>
						<div class="card_cont_mn" id="responseId" aria-live="polite">
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

	</main>
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