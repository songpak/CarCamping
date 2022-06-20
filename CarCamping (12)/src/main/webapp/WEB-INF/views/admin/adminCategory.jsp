<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="left.jsp"%>
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
		<div class="col">
			<p class="fw-bolder">카테고리 목록</p>
		</div>
		<div class="row">
			<!-- 드랍 버튼 -->
			<div class="col" align="left">
				<div class="dropdown">
					<button class="btn btn-outline-success" dropdown-toggle" type="button"
						id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
						카테고리 선택</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<li><button class="dropdown-item" type="button">브랜드</button></li>
						<li><button class="dropdown-item" type="button">상품</button></li>
					</ul>
				</div>
			</div>
			<!-- 드랍 버튼 끝 -->

			<!-- 모달 버튼 -->
			<div class="col" align="right">
				<button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">카테고리 등록</button>
			</div>
			<!-- 모달 버튼 끝 -->
		</div>
		<div class="row">&nbsp;</div>
	</div>
	<!-- 카테고리 등록 모달 -->
	<form class="row gy-2 gx-3 align-items-center">
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">카테고리 등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- 카테고리 옵션&이름 -->
						<div class="row">
							<div class="col">
								<div class="form-floating">
									<select class="form-select" id="floatingSelect"
										aria-label="Floating label select example">
										<option selected>브랜드</option>
										<option value="1">차박용품</option>
									</select> <label for="floatingSelect">카테고리</label>
								</div>
							</div>
							<div class="col">
								<div class="form-floating mb-3">
									<input type="email" class="form-control" id="floatingInput"
										placeholder="name@example.com"> <label
										for="floatingInput">카테고리명</label>
								</div>
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
			<th>카테고리 범주</th>
			<th>카테고리명</th>
			<th>수정</th>
		</tr>
		<tr>
			<td>차박용품</td>
			<td>도킹텐트</td>
			<td><button type="button" class="btn btn-success"
					data-bs-toggle="modal" data-bs-target="#staticBackdrop-111">
					삭제</button></td>
		</tr>
		<tr>
			<td>차박용품</td>
			<td>에어메트</td>
			<td><button type="button" class="btn btn-success"
					data-bs-toggle="modal" data-bs-target="#staticBackdrop-111">
					삭제</button></td>
		</tr>
		<tr>
			<td>브랜드</td>
			<td>디오프</td>
			<td><button type="button" class="btn btn-success"
					data-bs-toggle="modal" data-bs-target="#staticBackdrop-111">
					삭제</button></td>
		</tr>
		<tr>
			<td>브랜드</td>
			<td>아드리아 모빌</td>
			<td><button type="button" class="btn btn-success"
					data-bs-toggle="modal" data-bs-target="#staticBackdrop-111">
					삭제</button></td>
		</tr>
	</table>

	<!-- 카테고리 삭제 모달 -->
	<div class="modal fade" id="staticBackdrop-111"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">카테고리 삭제</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-success"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-outline-success">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 카테고리 삭제 모달 끝 -->
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
<%@ include file="../bottom.jsp"%>