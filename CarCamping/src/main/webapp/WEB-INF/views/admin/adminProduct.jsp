<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="left.jsp"%>   
<!-- Content Column Grid -->
<div class="col-md-8 themed-grid-col">
	<div class="row" align="center">
		<div class="row">
			<figure class="text-center">
				<blockquote class="blockquote">
					<p>A well-known quote, contained in a blockquote element.</p>
				</blockquote>
				<figcaption class="blockquote-footer">
					Someone famous in <cite title="Source Title">Source Title</cite>
				</figcaption>
			</figure>
		</div>
		<p class="fw-bolder">차박 용품 목록</p>
	</div>
	<div class="row">
		<!-- 드랍 버튼 -->
		<div class="col">
			<div class="dropdown">
				<button class="btn btn-outline-success dropdown-toggle" type="button"
					id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
					카테고리</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
					<li><button class="dropdown-item" type="button">도킹텐트</button></li>
					<li><button class="dropdown-item" type="button">에어메트</button></li>
				</ul>
			</div>
		</div>

		<div class="col" align="right">
			<!-- 용품 등록 모달 버튼 -->
			<button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
				data-bs-target="#staticBackdrop">용품 등록</button>
			<!-- 용품 등록 모달 버튼 끝 -->
		</div>
	</div>
	<div class="row">&nbsp;</div>


	<!-- 용품 등록 모달 -->
	<form class="row gy-2 gx-3 align-items-center">
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" align="center">
						<h5 class="modal-title" id="staticBackdropLabel">용품 등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- 카테고리&브랜드 -->
						<div class="row">
							<div class="col">
								<div class="form-floating">
									<select class="form-select" id="floatingSelect1"
										aria-label="Floating label select example">
										<option selected>도킹텐트</option>
										<option value="1">에어메트</option>
										<option value="2">폴딩박스</option>
										<option value="3">바베큐 그릴</option>
									</select> <label for="floatingSelect">카테고리</label>
								</div>
							</div>
							<div class="col">
								<div class="form-floating">
									<select class="form-select" id="floatingSelect2"
										aria-label="Floating label select example">
										<option selected>툴레</option>
										<option value="1">디오프</option>
										<option value="2">아드리아 모빌</option>
										<option value="3">제드코리아</option>
									</select> <label for="floatingSelect">브랜드</label>
								</div>
							</div>
						</div>
						<!-- 용품명 -->
						<div class="col">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">용품명</label>
							</div>
						</div>

						<!-- 일일대여요금 -->

						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">일일대여요금 (원단위로 숫자만)</label>
							</div>
						</div>

						<!-- 용품 요약 설명 -->

						<div class="form-floating mb-3">
							<input type="email" class="form-control" id="floatingInput"
								placeholder="name@example.com"> <label
								for="floatingInput">용품 요약 설명 (30자 이내) </label>
						</div>

						<!-- 용품 상세 설명 -->
						&nbsp;
						<div class="mb-3">
							<input class="form-control" type="file" id="formFile">
							<div id="passwordHelpBlock" class="form-text">메인 이미지를
								선택해주세요</div>
						</div>

						<input class="form-control" id="formFileMultiple" type="file"
							multiple accept="image/*">
						<div id="passwordHelpBlock" class="form-text">최소 2개 이미지를
							선택해주세요 (최대 5개)</div>
						<ul id="file-list">
							<li class="no-items"></li>
						</ul>

						<script>
							var filesUpload = document
									.getElementById("formFileMultiple"), fileList = document
									.getElementById("file-list");

							function traverseFiles(files) {
								var li, file, fileInfo;
								fileList.innerHTML = "";

								for (var i = 0, il = files.length; i < il; i++) {
									li = document.createElement("li");
									file = files[i];
									fileInfo = "<div><strong>파일명:</strong> "
											+ file.name + "</div>";

									li.innerHTML = fileInfo;
									fileList.appendChild(li);
								}
								;
							};

							filesUpload.onchange = function() {
								traverseFiles(this.files);
							};
						</script>

						<!-- 버튼 영역 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-success"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-outline-success">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 용품 등록 모달 끝 -->

	<!-- 본문 -->
	<table class="table table-borderless">
		<tr>
			<td>
				<div class="card" style="width: 18rem;">
					<img src="Region1.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">용품명</h5>
						<p class="card-text">
							<div class="starpoint_wrap">
  						<div class="starpoint_box">
						   <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
						   <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
						   <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
						   <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
						   <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
						   <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
						   <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
						   <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
						   <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
						   <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
						   <input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_2" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_4" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_6" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_8" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_10" class="star_radio">
    						<span class="starpoint_bg">
    						</span>
  						</div>
					</div>
						(59개의 리뷰)
						<br>
							용품 리뷰 개수|좋아요 수<br> 최조등록일|최종수정일
						</p>
						<button type="button" class="btn btn-success"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop-1">
							수정</button>
					</div>
				</div>
			</td>
		</tr>
	</table>

	<!-- 용품 수정 모달 -->
	<form class="row gy-2 gx-3 align-items-center">
		<div class="modal fade" id="staticBackdrop-1"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" align="center">
						<h5 class="modal-title" id="staticBackdropLabel">용품 등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- 카테고리&브랜드 -->
						<div class="row">
							<div class="col">
								<div class="form-floating">
									<select class="form-select" id="floatingSelect1"
										aria-label="Floating label select example">
										<option selected>도킹텐트</option>
										<option value="1">에어메트</option>
										<option value="2">폴딩박스</option>
										<option value="3">바베큐 그릴</option>
									</select> <label for="floatingSelect">카테고리</label>
								</div>
							</div>
							<div class="col">
								<div class="form-floating">
									<select class="form-select" id="floatingSelect2"
										aria-label="Floating label select example">
										<option selected>툴레</option>
										<option value="1">디오프</option>
										<option value="2">아드리아 모빌</option>
										<option value="3">제드코리아</option>
									</select> <label for="floatingSelect">브랜드</label>
								</div>
							</div>
						</div>
						<!-- 용품명 -->
						<div class="col">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">용품명</label>
							</div>
						</div>

						<!-- 일일대여요금 -->

						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">일일대여요금 (원단위로 숫자만)</label>
							</div>
						</div>

						<!-- 용품 요약 설명 -->

						<div class="form-floating mb-3">
							<input type="email" class="form-control" id="floatingInput"
								placeholder="name@example.com"> <label
								for="floatingInput">용품 요약 설명 (30자 이내) </label>
						</div>

						<!-- 용품 상세 설명 -->
						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" style="height: 100px"></textarea>
							<label for="floatingTextarea2">용품 상세 설명 (1000자 이내)</label>
						</div>
						<!-- 현재 이미지 캐러셀 -->
						&nbsp;
						<div id="carouselExampleIndicators" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="Region1.jpg" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="Region1.jpg" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="Region1.jpg" class="d-block w-100" alt="...">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>


						<!-- 이미지 수정 -->
						&nbsp; 
						<input class="form-control" type="file"
							id="formFile">
						<div id="passwordHelpBlock" class="form-text">메인 이미지를 선택해주세요</div>

						<input class="form-control" id="formFileMultiple-1" type="file"
							multiple accept="image/*">
						<div id="passwordHelpBlock" class="form-text">최소 2개 이미지를
							선택해주세요 (최대 5개)</div>
						<ul id="file-list-1">
							<li class="no-items"></li>
						</ul>

						<script>
							var filesUpload = document
									.getElementById("formFileMultiple-1"), fileList = document
									.getElementById("file-list-1");

							function traverseFiles(files) {
								var li, file, fileInfo;
								fileList.innerHTML = "";

								for (var i = 0, il = files.length; i < il; i++) {
									li = document.createElement("li");
									file = files[i];
									fileInfo = "<div><strong>파일명:</strong> "
											+ file.name + "</div>";

									li.innerHTML = fileInfo;
									fileList.appendChild(li);
								}
								;
							};

							filesUpload.onchange = function() {
								traverseFiles(this.files);
							};
						</script>

						<!-- 인기장소 여부 -->
						&nbsp;
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox" role="switch"
								id="flexSwitchCheckDefault"> <label
								class="form-check-label" for="flexSwitchCheckDefault">
								인기용품 </label>
						</div>

						<!-- 버튼 영역 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-success"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-outline-success">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 용품 수정 모달 끝 -->

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
</div>

<!-- End Content Coulmn Grid -->
<%@ include file="../bottom.jsp"%>