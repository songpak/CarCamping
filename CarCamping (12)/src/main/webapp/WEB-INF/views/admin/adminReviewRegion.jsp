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
		<p class="fw-bolder">장소 리뷰 목록</p>
	</div>
	<div class="row">
		<!-- 드랍 버튼 -->
		<div class="col">
			<div class="btn-group">
				<button type="button" class="btn btn-outline-success dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false">정렬</button>
				<ul class="dropdown-menu" style="">
					<li><a class="dropdown-item" href="#">인기순</a></li>
					<li><a class="dropdown-item" href="#">최신순</a></li>
					<li><a class="dropdown-item" href="#">승인안됨</a></li>
				</ul>
			</div>
		</div>
		

		<!-- 리뷰 검색 모달 버튼 -->
			<div class="col" align="right">
				<button type="button" 
					class="btn btn-outline-success"
					data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">
						리뷰 검색
				</button>
			</div>
		<!-- 리뷰 검색 모달 버튼 끝 -->
	</div>
	<div class="row">&nbsp;</div>


	<!-- 리뷰 검색 모달 -->
	<form class="row gy-2 gx-3 align-items-center">
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">리뷰 검색</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- 선택범주&검색명 -->
						<div class="row">
							<div class="col">
								<div class="form-floating">
									<select class="form-select" id="floatingSelect"
										aria-label="Floating label select example">
										<option selected>리뷰 제목</option>
										<option value="1">장소명</option>
									</select> <label for="floatingSelect">선택</label>
								</div>
							</div>
							<div class="col">
								<div class="form-floating mb-3">
									<input type="email" class="form-control" id="floatingInput"
										placeholder="name@example.com"> <label
										for="floatingInput">검색창</label>
								</div>
							</div>
						</div>

						<!-- 버튼 영역 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary">찾기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 리뷰 검색 모달 끝 -->

	<!-- 본문 -->
	<table class="table table-borderless">
		<tr>
			<td>
				<div class="card" style="width: 18rem;">
					<img src="Region1.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">리뷰제목</h5>
						<p class="card-text">
							<label for="disabledRange" class="form-label">평점|평점개수</label> <input
								type="range" class="form-range" id="disabledRange" disabled>
							조회수|좋아요 개수<br>작성일<br>관리자 승인 여부
						</p>
						<button type="button" class="btn btn-success"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop-1">
							내용</button>
					</div>
				</div>
			</td>
		</tr>
	</table>

	<!-- 장소 내용 모달 -->
	<form class="row gy-2 gx-3 align-items-center">
		<div class="modal fade" id="staticBackdrop-1"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" align="center">
						<h5 class="modal-title" id="staticBackdropLabel">리뷰 제목</h5>
						<div id="passwordHelpBlock" class="form-text">
  								작성 일시
						</div>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						
						<!-- 리뷰요약내용 -->
						<div class="col">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">리뷰요약내용</label>
							</div>
						</div>

						<!-- 리뷰 상세  내용 -->
						
						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" style="height: 100px"></textarea>
							<label for="floatingTextarea2">리뷰 상세 설명</label>
						</div>
						
						<!-- 리뷰 이미지 슬라이드 -->
						
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
									<img src="HipProfile.png" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="BasicProfile.png" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="HipProfile.png" class="d-block w-100" alt="...">
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
						<div class="row">
							&nbsp;
						</div>
						
						<!-- 인기리뷰 여부 -->
						
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox" role="switch"
								id="flexSwitchCheckDefault"> <label
								class="form-check-label" for="flexSwitchCheckDefault">
								인기리뷰 </label>
						</div>
						
						<!-- 관리자 승인 여부 -->
						
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox" role="switch"
								id="flexSwitchCheckDefault"> <label
								class="form-check-label" for="flexSwitchCheckDefault">
								승인 </label>
						</div>

						<!-- 버튼 영역 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-success">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 장소 내용 모달 끝 -->

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