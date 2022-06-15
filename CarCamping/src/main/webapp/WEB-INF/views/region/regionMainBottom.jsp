<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</div>
				</div>

			</div>
		</div>
	</div>
		<!--HOT차박지  -->
		<div class="ccm-b-hs">
			<div id="hot-loaction-title-hs" style="margin-top: 20px;">
				<nav
					class="navbar navbar-expand-lg border rounded-4 border-4 aria-label="
					Eighth
					navbarexample" 
					style="margin-bottom: 0px; background-color: #dc3545d4;">
					<div class="container">
						<a class="navbar-brand text-light" href="#" >H O T 차 박 지</a>
					</div>
				</nav>
			</div>
			<div id="hot-loaction-content-hs"
				style="margin-bottom: 0px; margin-top: 10px;">
				<div class="carousel"
					data-flickity='{ "cellAlign": "left", "contain": true ,
 									"autoPlay": 1200,"pauseAutoPlayOnHover": false,
									"dragThreshold": 10,"imagesLoaded": true,
									"freeScroll": true,"wrapAround": true}'>

					<c:forEach var="hotRegion" items="${hotRegionList}">

						<a href="regionView.region?ccr_num=${hotRegion.ccr_num}">
							<div class="carousel-cell" style="width: 300px; height: 380px">
								<div class="card" style="width: 100%; height: 100%">
									<img src="resources/images/${hotRegion.ccr_viewImage1}"
										class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">${hotRegion.ccr_name}</h5>
										<hr>
										<p class="card-text">${hotRegion.ccr_summary}</p>
									</div>
								</div>
							</div>
						</a>

					</c:forEach>

				</div>
			</div>
		</div>

	<!--추천차박지  -->
	<div class="ccm-b-hs" style="margin-top: 20px; margin-bottom: 45px;">
		<nav
			class="navbar navbar-expand-lg navbar navbar-dark bg-primary border rounded-4 border-4"
			aria-label="Eighth navbar example" style="margin-bottom: 0px;">
			<div class="container">
				<a class="navbar-brand text-light" href="#">추 천 차 박 지</a>
			</div>
		</nav>
		<div id="recommand-loaction-content-hs ">
			<div class="carousel"
				data-flickity='{ "cellAlign": "left", "contain": true ,
 									"autoPlay": 1200,"pauseAutoPlayOnHover": false,
									"dragThreshold": 10,"imagesLoaded": true,
									"freeScroll": true,"wrapAround": true}'>
				<c:forEach var="recommandRegion" items="${recommandRegionList}">

					<a href="regionView.region?ccr_num=${recommandRegion.ccr_num}">
						<div class="carousel-cell" style="width: 300px; height: 380px">
							<div class="card" style="width: 100%; height: 100%">
								<img src="resources/images/${recommandRegion.ccr_viewImage1}"
									class="card-img-top" alt="...">
								<div class="card-body">
									<h5 class="card-title">${recommandRegion.ccr_name}</h5>
									<hr>
									<p class="card-text">${recommandRegion.ccr_summary}</p>
								</div>
							</div>
						</div>
					</a>

				</c:forEach>
			</div>
		</div>
	</div>
</div>


<script>
	
</script>