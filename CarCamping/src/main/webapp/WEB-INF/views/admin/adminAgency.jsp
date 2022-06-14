<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="left.jsp"%>   
<!-- Content Column Grid -->
<div class="col-md-8 themed-grid-col">
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
	<div class="row" align="center">
		<div class="col">
			<p class="fw-bolder">대리점 목록</p>
		</div>
	<div class="row">
		<!-- 드랍 버튼 -->
			<div class="col" align="left">
				<div class="dropdown">
					<button class="btn btn-outline-success" dropdown-toggle" type="button"
						id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
						지역선택</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<li><button class="dropdown-item" type="button">서울/경기권</button></li>
						<li><button class="dropdown-item" type="button">강원도</button></li>
						<li><button class="dropdown-item" type="button">충청북도</button></li>
						<li><button class="dropdown-item" type="button">충청남도</button></li>
					</ul>
				</div>
			</div>
		<!-- 드랍 버튼 끝 -->
		
		<!-- 대리점 등록 모달 버튼 -->
			<div class="col" align="right">
				<button type="button" 
					class="btn btn-outline-success"
					data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">
						대리점 등록
				</button>
			</div>
		<!-- 대리점 등록 모달 버튼 끝 -->
	</div>
	<div class="row">
		&nbsp;
	</div>
</div>
	<!-- 대리점 등록 모달 -->
	<form class="row gy-2 gx-3 align-items-center">
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">대리점 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<!-- 대리점 지역&이름 -->
					<div class="row">
						<div class="col">
							<div class="form-floating">
								<select class="form-select" id="floatingSelect"
									aria-label="Floating label select example">
									<option selected>서울/경기도</option>
									<option value="1">강원도</option>
									<option value="2">충청북도</option>
									<option value="3">충청남도</option>
								</select> <label for="floatingSelect">지역</label>
							</div>
						</div>
						<div class="col">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">대리점명</label>
							</div>
						</div>
					</div>
					
				<!-- 대리점 위치 -->
						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">대리점 위치</label>
							</div>
						</div>
				
				<!-- 대리점 전화번호 -->
						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">대리점 전화번호 ('-'포함)</label>
							</div>
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
	<!-- 대리점 등록 모달 끝 -->
	
	<!-- 본문 -->
	<table class="table table-striped">
		<tr>
			<th>지역</th>
			<th>대리점명</th>
			<th>위치</th>
			<th>전화번호</th>
			<th>수정</th>
		</tr>
		<tr>
			<td>서울/경기도</td>
			<td>강북점</td>
			<td>서울시 노원구 덕릉로 126라길11</td>
			<td>02-933-9933</td>
			<td><button type="button" 
					class="btn btn-success"
					data-bs-toggle="modal"
					data-bs-target="#staticBackdrop-11">
						수정
				</button></td>
		</tr>
		<tr>
			<td>서울/경기도</td>
			<td>강북점</td>
			<td>서울시 노원구 덕릉로 126라길11</td>
			<td>02-933-9933</td>
			<td><button type="button" 
					class="btn btn-success"
					data-bs-toggle="modal"
					data-bs-target="#staticBackdrop-11">
						수정
				</button></td>
		</tr>
		<tr>
			<td>서울/경기도</td>
			<td>강북점</td>
			<td>서울시 노원구 덕릉로 126라길11</td>
			<td>02-933-9933</td>
			<td><button type="button" 
					class="btn btn-success"
					data-bs-toggle="modal"
					data-bs-target="#staticBackdrop-11">
						수정
				</button></td>
		</tr>
		
	</table>
	
	<!-- 대리점 수정 모달 -->
	<form class="row gy-2 gx-3 align-items-center">
	<div class="modal fade" id="staticBackdrop-11" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">대리점 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<!-- 대리점 지역&이름 -->
					<div class="row">
						<div class="col">
							<div class="form-floating">
								<select class="form-select" id="floatingSelect"
									aria-label="Floating label select example">
									<option selected>서울/경기도</option>
									<option value="1">강원도</option>
									<option value="2">충청북도</option>
									<option value="3">충청남도</option>
								</select> <label for="floatingSelect">지역</label>
							</div>
						</div>
						<div class="col">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">대리점명</label>
							</div>
						</div>
					</div>
					
				<!-- 대리점 위치 -->
						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">대리점 위치</label>
							</div>
						</div>
				
				<!-- 대리점 전화번호 -->
						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">대리점 전화번호 ('-'포함)</label>
							</div>
						</div>
						
				<!-- 버튼 영역 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-success"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-outline-success">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	<!-- 대리점 수정 모달 끝 -->
	
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