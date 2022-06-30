<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<link rel="stylesheet" href="resources/css/dropdown.css">
<style type="text/css">
.swiper-container {
	height: 420px;
	border: 5px solid silver;
	border-radius: 7px;
	box-shadow: 0 0 20px #ccc inset;
}

.swiper-slide {
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
	max-width: 100%;
}

.d-flex .card {
	margin-right: 20px;
}
</style>

<!-- 클래스명은 변경하면 안 됨 -->

<div id="doc" class="gm-t7">
	<div class="gm-b">
		<div id="secondary">
			<div id="leftcolumn">
				<!-- 중앙 정렬을 위해서 d-flex justify-content-center는 지우면 안됩니다 !! -->
				<nav class="navbar d-flex justify-content-center"
					style="margin-bottom: 5px;">
					<h2>🔥 인기 용품을 지금 바로 만나보세요 🔥</h2>
				</nav>
			</div>

			<div id="ccm-doc-hs" class="ccm-t7-hs">
				<div id="ccm-bd-hs">
					<div id="ccm-main-hs">
						<div class="ccm-b-hs">
							<div class="ccm-gc-hs">
								<div class="ccm-u-hs first">
									<div class="carousel"
										data-flickity='{ "cellAlign": "left", "contain": true ,
 									"autoPlay": 1200,"pauseAutoPlayOnHover": false,
									"dragThreshold": 10,"imagesLoaded": true,
									"freeScroll": true,"wrapAround": true}'>

										<c:forEach items="${popList}" var="proddto">

											<a href="productView.product?prod_num=${proddto.prod_num}">
												<div class="carousel-cell"
													style="width: 300px; height: 380px">
													<div class="card" style="width: 70%; height: 100%">
														<!-- 이미지 불러오기 수정해야함 -->
														<img src="resources/images/sik.jpg" class="card-img-top"
															alt="...">
														<div class="card-body">
															<h5 class="card-title">${proddto.prod_name}</h5>
															<hr>
															<p class="card-text">${proddto.prod_summary}</p>
														</div>
													</div>
												</div>
											</a>

										</c:forEach>
									</div>
								</div>

								<div class="region_content-hs rounded-4 " style="height: 402px;">
									<ul class="list-group list-group-flush rounded-4 ">

										<li class="list-group-item fs-2 text-center"><button
												disabled class="btn btn-outline-warning btn-lg"
												type="button"
												onclick="location.href='board.region?region_num=${regionDTO.region_num}'"
												style="-bs-btn-padding-x: 70px; - -bs-btn-padding-y: 15px;">
												<i class="bi bi-trophy-fill" width="40" height="40"
													fill="currentColor"></i> 용품 인기순위 <i
													class="bi bi-trophy-fill" width="40" height="40"
													fill="currentColor"></i>
											</button> <%--  <c:forEach items="${popList}" var="proddto"> --%> <!-- 1,2,3위만 잘라서 가져와야 할듯 -->
										<li class="list-group-item position-relative"><img
											src="resources/images/logoyogo-1-261.jpg"
											class="img-responsive rounded-circle"
											style="width: 107px; height: 107px;">
											<div
												class="position-absolute top-50 start-50 translate-middle">
												<i class="bi bi-trophy-fill" width="40" height="40"
													fill="currentColor"></i>
											</div></li>
										<%-- </c:forEach> --%>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 이전 버튼 -->
				<!-- 페이징 -->
				<div class="swiper-pagination"></div>
			</div>

			<nav
				class="navbar navbar-expand-lg border rounded-4 border-4 aria-label="
				Eighth
				navbarexample" 
					style="margin-bottom: 20px; background-color: #0d6efd; border-left-width: 100px; margin-left: 250px; margin-right: 250px; margin-top: 10px;">
				<div class="container-fluid" align="center">

					<div class="container">
						<a class="navbar-brand text-light" href="#" text>전 체 용 품 목 록 </a>
					</div>


					<!-- 검색 form  #091835-->
					<div class="d-flex" style="width: 500px; height: 40px;">
						<button type="button"
							style="width: 150px; height: 40px; font-size: revert; margin-right: 10px;"
							onclick="location.href ='goProduct.product'">전체보기</button>
						<!-- 검색 form -->
						<form class="d-flex" action="goProduct.product"
							style="width: 500px; height: 40px;" method="get">
							<select name="search">
								<option value="prod_name">용품명</option>
								<option value="brand_name">브랜드명</option>
							</select> <input class="form-control me-2" type="text" name="searchString"
								placeholder="인기용품을 검색해보세요!" aria-label="Search"
								style="margin-left: 8px;"> <input type="submit"
								value="검색"
								style="padding-left: 0px; padding-right: 0px; width: 122px;">
							<div class="dropdown">

								<button type="button" class="dropbtn" data-bs-toggle="dropdown"
									aria-expanded="false"
									style="width: 66px; height: 40px; border-left-width: 2px; margin-left: 10px;">정렬</button>
								<div class="dropdown-content">
									<a
										href="goProduct.product?search=${search}&searchString=${searchString}&mode=listProductNew">최신순</a>
									<a
										href="goProduct.product?search=${search}&searchString=${searchString }&mode=listProductPop">인기순</a>
									<a
										href="goProduct.product?search=${search}&searchString=${searchString }&mode=listProductPrice">가격순</a>
								</div>
							</div>
						</form>

					</div>
			</nav>


			<c:set var="i" value="0" />
			<c:set var="j" value="4" />
			<table align="center"
				style="border: 1px solid; border-left-width: 50px; border-color: transparent;">
				<c:forEach items="${listProduct}" var="pdto">
					<c:if test="${i%j == 0 }">
						<tr>
					</c:if>
					<td>
						<div class="card"
							style="width: 18rem; margin-right: 30px; margin-bottom: 50px;">
							<a href="productView.product?prod_num=${pdto.prod_num}"><img
								src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${pdto.prod_viewImage1}"></a>
							<div class="card-body">
								<p class="card-text">

									용품명 :${pdto.prod_name}<br /> 브랜드명
									:${pdto.brandCategoryDTO.brand_name}<br /> 평점 :
									${pdto.prod_reviewScore } 용품명 :${pdto.prod_name}<br> 브랜드명
									:${pdto.brandCategoryDTO.brand_name}

								</p>
								<br>
								<p class="card-text">가격 :${pdto.prod_price}</p>
							</div>
						</div>
					</td>
					<c:if test="${i%j == j-1 }">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }" />
				</c:forEach>
				<c:if test="${empty listProduct}">
					<div class="card" style="width: 20rem;">
						<h4>등록된 상품이 없습니다!</h4>
						<br>
						<div class="card-body">
							<p class="card-text">다시 검색해 주세요!</p>
						</div>
					</div>
				</c:if>
			</table>
		</div>
	</div>
</div>


<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<c:if test="${rowCount>0 }">
			<c:if test="${startPage>1}">
				<li class="page-item"><a class="page-link"
					onclick="location.href='goProduct.product?&pageNum=${startPage-1}&mode=${mode}'">
						Previous</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<!-- 1 2  -->
				<li class="page-item"><a class="page-link"
					onclick="location.href='goProduct.product?&pageNum=${i}&mode=${mode}'">
						<c:out value="${i}" />
				</a></li>
			</c:forEach>
			<c:if test="${endPage < pageCount }">
				<li class="page-item"><a class="page-link"
					onclick="location.href='goProduct.product?&pageNum=${endPage+1}&mode=${mode}'">
						Next</a></li>
			</c:if>
		</c:if>
	</ul>
</nav>

<%@ include file="../bottom.jsp"%>