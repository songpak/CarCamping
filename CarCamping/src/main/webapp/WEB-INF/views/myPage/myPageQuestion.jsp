<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%> 
<!-- Content Column Grid -->
<div class="container" align="center" class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
	<div class="row" align="center">
		<div class="col">
			<p class="fw-bolder">문의사항 목록</p>
		</div>
	<div class="row">
		<!-- 드랍 버튼 -->
			<div class="col" align="left">
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
						정렬</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<li><button class="dropdown-item" type="button">최신순</button></li>
						<li><button class="dropdown-item" type="button">오래된순</button></li>
						
					</ul>
				</div>
			</div>
		<!-- 드랍 버튼 끝 -->
	
		<!-- 답변 유무 라디오 그룹 -->
		
			
		<!-- 답변 유무 라디오 그룹 끝 -->
	</div>
	<div class="row">
		&nbsp;
	</div>
</div>
	
	<!-- 본문 -->
	<table class="table table-striped">
		<tr>
			<th>문의일시</th>
			<th>회원ID</th>
			<th>제목</th>
			<th>답변</th>
		</tr>
		<tr>
			<td>2022-06-03</td>
			<td>ABC1234</td>
			<td>포인트 적립제도에 대해 문의드립니다</td>
			<td><button type="button" 
					class="btn btn-primary"
					data-bs-toggle="modal"
					data-bs-target="#staticBackdrop-11">
						보기
				</button></td>
		</tr>
		
	</table>
	
	<div class="col" align="right">
			문의하기
	</div>
	<!-- 누르면 문의하기 폼 가져오기 -->
	<form class="row gy-2 gx-3 align-items-center">
		<div class="modal fade" id="staticBackdrop-11" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">문의하기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<!-- 문의사항 제목 -->
						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">제목</label>
							</div>
						</div>
						
						<!-- 문의일시 -->
						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" style="height: 100px"></textarea>
							<label for="floatingTextarea2">문의일시</label>
						</div>
						
						
						<!-- 문의사항 내용 -->
						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" style="height: 100px"></textarea>
							<label for="floatingTextarea2">문의내용</label>
						</div>
						
						<!-- 답변일시 -->
						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" style="height: 100px"></textarea>
							<label for="floatingTextarea2">답변일시</label>
						</div>
						
						
						<!-- 답변내용 -->
						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" style="height: 100px"></textarea>
							<label for="floatingTextarea2">답변 (1000자 이내)</label>
						</div>
						
						
						<!-- 버튼 영역 -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary">수정</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	</form>
	<!-- 문의사항 답변 모달 끝 -->
	
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