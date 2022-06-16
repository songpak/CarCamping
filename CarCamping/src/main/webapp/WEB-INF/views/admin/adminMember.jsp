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
				<form name="sortMember" action="adminMember.admin" enctype="multipart/form-data" method="post">
					<select name="sort">
						<option value="mem_point">포인트</option>
						<option value="mem_rentalCount">대여건수</option>
					</select>
					<input type="submit" value="정렬">
				</form>
				<button type="button" onclick="location.href='adminMember.admin'">전체 보기</button>
			</div>
		<!-- 드랍 버튼 끝 -->
		
		<!-- 회원 검색 버튼 -->
			<div class="col" align="right">
				<form name="search" action="adminMember.admin" enctype="multipart/form-data" method="post">
					<select name="name1">
						<option value="mem_id">아이디</option>
						<option value="mem_nickName">닉네임</option>
						<option value="mem_email">이메일</option>
						<option value="mem_userName">이름</option>
					</select>
					<input type="text" name="name2">
					<input type="submit" value="검색">
				</form>
			</div>
		<!-- 회원 검색 버튼 끝 -->
	</div>
</div>
	&nbsp;
	<script>
		function popup(a){
			var url = "adminViewMember.admin?mem_num="+a
			var name = "회원 정보"
			var option = "width=600,height=800,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>
	
	<!-- 본문 -->
	<table class="table table-striped">
		<tr>
			<th>ID</th>
			<th>닉네임</th>
			<th>EMAIL</th>
			<th>실명</th>
			<th>포인트</th>
			<th>대여건수</th>
			<th>회원등록일</th>
			<th>이용제한</th>
			<th>정보</th>
		</tr>
		<c:forEach items="${adminListMember}" var="dto">
			<tr>
				<td>${dto.mem_id}</td>
				<td>${dto.mem_nickName}</td>
				<td>${dto.mem_email}</td>
				<td>${dto.mem_userName}</td>
				<td>${dto.mem_point}</td>
				<td>${dto.mem_rentalCount}</td>
				<td>${dto.mem_sysdate}</td>
				<c:if test="${dto.mem_denied==0}">
					<td>제한</td>
				</c:if>
				<c:if test="${dto.mem_denied==1}">
					<td>일반</td>
				</c:if>
				<td><button type="button" class="btn btn-primary"
				onclick="location.href='javascript:popup(${dto.mem_num})'">정보</button></td>
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
<!-- End Content Column Grid -->
<%@ include file="../bottom.jsp"%>