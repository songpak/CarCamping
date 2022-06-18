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
	</div>
	<div class="row">
		<!-- 드랍 버튼 -->
			<div class="col" align="left">
				<form name="sortForm" method="post" action="adminAnnounce.admin">
					<select name="sort">
							<option value="desc">최신순</option>
							<option value="asc">오래된순</option>
					</select>
					<input type="submit" value="정렬">
				</form>
			</div>
		<!-- 드랍 버튼 끝 -->
	
		<!-- 공지사항 등록 버튼 -->
			<div class="col" align="right">
				<button type="button" class="btn btn-primary" onclick="location.href='javascript:popup()'">
				공지사항 등록</button>
			</div>
		<!-- 공지사항 등록 버튼 끝 -->
	</div>
		&nbsp;
	<script>
		function popup(){
			var url = "adminRegisterAnnounce.admin"
			var name = "공지사항 등록"
			var option = "width=300,height=200,top=100,left=200,location=no"
			window.open(url,name,option);
		}
		function con_view(a){
			var url = "adminViewAnnounce.admin?aa_num="+a
			var name = "공지사항 보기"
			var option = "width=300,height=200,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>
	
	<!-- 본문 -->
	
	<table class="table table-striped">
		<tr>
			<th>제목</th>
			<th>게시일</th>
			<th>최종 수정일</th>
			<th>수정</th>
		</tr>

		<c:forEach items="${adminListAnnounce}" var="dto">
			<tr>
				<td>${dto.aa_title}</td>
				<td>${dto.aa_sysdate}</td>
				<td>${dto.aa_update}</td>
				<td>
					<button type="button" class="btn btn-primary"
							onclick="location.href='javascript:con_view(${dto.aa_num})'">
							보기</button>
				</td>
			</tr>
		</c:forEach>
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