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
			<p class="fw-bolder">회원 목록</p>
		</div>
	<div class="row">
		<!-- 드랍 버튼 -->
			<div class="col" align="left">
				<div class="dropdown">
					<button class="btn btn-outline-success dropdown-toggle" type="button"
						id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
						정렬</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<li><button class="dropdown-item" type="button">최신순</button></li>
						<li><button class="dropdown-item" type="button">포인트</button></li>
						<li><button class="dropdown-item" type="button">대여건수</button></li>
					</ul>
				</div>
			</div>
		<!-- 드랍 버튼 끝 -->
		
		<!-- 회원 검색 모달 버튼 -->
			<div class="col" align="right">
				<button type="button" 
					class="btn btn-outline-success"
					data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">
						회원 검색
				</button>
			</div>
		<!-- 회원 검색 모달 버튼 끝 -->
	</div>
	<div class="row">
		&nbsp;
	</div>
</div>
	<!-- 회원 검색 모달 -->
	<form class="row gy-2 gx-3 align-items-center">
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">회원 검색</h5>
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
									<option selected>회원ID</option>
									<option value="1">회원실명</option>
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
						<button type="button" class="btn btn-outline-success"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-outline-success">찾기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	<!-- 회원 검색 모달 끝 -->
	
	<!-- 본문 -->
	<table class="table table-striped">
		<tr>
			<th>ID</th>
			<th>EMAIL</th>
			<th>실명</th>
			<th>포인트</th>
			<th>대여건수</th>
			<th>회원등록일</th>
			<th>이용제한</th>
		</tr>
		<tr>
			<td>ABC1234</td>
			<td>ABC1234@gmail.com</td>
			<td>윤석열</td>
			<td>9000</td>
			<td>22</td>
			<td>2022-05-09</td>
			<td>
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckDefault">
				</div>
			</td>
		</tr>
		<tr>
			<td>MNK9876</td>
			<td>MNK9876@gmail.com</td>
			<td>한국인</td>
			<td>3000</td>
			<td>2</td>
			<td>2022-06-02</td>
			<td>
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckDefault">
				</div>
			</td>
		</tr>
		
		
	</table>
	
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