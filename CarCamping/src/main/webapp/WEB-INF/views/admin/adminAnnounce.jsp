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
			<p class="fw-bolder">공지사항 목록</p>
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
						<li><button class="dropdown-item" type="button">오래된순</button></li>
						
					</ul>
				</div>
			</div>
		<!-- 드랍 버튼 끝 -->
	
		<!-- 공지사항 등록 모달 버튼 -->
			<div class="col" align="right">
				<button type="button" 
					class="btn btn-outline-success"
					data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">
						공지사항 등록
				</button>
			</div>
		<!-- 공지사항 등록 모달 버튼 끝 -->
	</div>
	<div class="row">
		&nbsp;
	</div>
</div>
	<!-- 공지사항 등록 모달 -->
	<form class="row gy-2 gx-3 align-items-center">
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">공지사항 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					
				<!-- 공지사항 제목 -->
						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">공지사항 제목</label>
							</div>
						</div>
				<!-- 공지사항 내용 -->
						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" style="height: 100px"></textarea>
							<label for="floatingTextarea2">공지사항 내용 (1000자 이내)</label>
						</div>
				
				<!-- 이미지 삽입 -->

						&nbsp; 

						<input class="form-control" id="formFileMultiple-1" type="file"
							multiple accept="image/*">
						<div id="passwordHelpBlock" class="form-text">
						이미지 업로드는 최대 5개만 가능합니다
						</div>
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
	<!-- 공지사항 등록 모달 끝 -->
	
	<!-- 본문 -->
	<table class="table table-striped">
		<tr>
			<th>제목</th>
			<th>게시일</th>
			<th>최종 수정일</th>
			<th>수정</th>
		</tr>
		<tr>
			<td>포인트 지급제도 변경건</td>
			<td>2022-05-29</td>
			<td>2022-06-07</td>
			<td><button type="button" 
					class="btn btn-success"
					data-bs-toggle="modal"
					data-bs-target="#staticBackdrop-11">
						수정
				</button></td>
		</tr>
		<tr>
			<td>포인트 지급제도 변경건</td>
			<td>2022-05-29</td>
			<td>2022-06-07</td>
			<td><button type="button" 
					class="btn btn-success"
					data-bs-toggle="modal"
					data-bs-target="#staticBackdrop-11">
						수정
				</button></td>
		</tr>
		<tr>
			<td>포인트 지급제도 변경건</td>
			<td>2022-05-29</td>
			<td>2022-06-07</td>
			<td><button type="button" 
					class="btn btn-success"
					data-bs-toggle="modal"
					data-bs-target="#staticBackdrop-11">
						수정
				</button></td>
		</tr>
		
	</table>
	
	<!-- 공지사항 수정 모달 -->
	<form class="row gy-2 gx-3 align-items-center">
		<div class="modal fade" id="staticBackdrop-11" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">공지사항 수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<!-- 공지사항 제목 -->
						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">공지사항 제목</label>
							</div>
						</div>
						<!-- 공지사항 내용 -->
						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" style="height: 100px"></textarea>
							<label for="floatingTextarea2">공지사항 내용 (1000자 이내)</label>
						</div>

						<!-- 이미지 삽입 -->

						&nbsp; 

						<input class="form-control" id="formFileMultiple-1" type="file"
							multiple accept="image/*">
						<div id="passwordHelpBlock" class="form-text">
							이미지 업로드는 최대 5개만 가능합니다
						</div>
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