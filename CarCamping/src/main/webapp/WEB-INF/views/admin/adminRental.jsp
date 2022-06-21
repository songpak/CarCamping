<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="left.jsp"%>   
<!-- Content Column Grid -->
<div class="col-md-8 themed-grid-col">
	<div class="row" align="center">
		<div class="col">
			<p class="h2"><strong>대여 목록</strong></p>
		</div>
	<div class="row justify-content-md-center">
		<!-- 드랍 버튼 -->
			<div class="col" align="left">
				<form name="sortForm" method="post" enctype="multipart/form-data" action="adminRental.admin">
					<select name="sort">
						<option value="3">미납</option>
						<option value="2">연장</option>
						<option value="1">반납완료</option>
						<option value="0">대여중</option>
					</select>
					<input type="submit" value="정렬">
				</form>
			</div>
		<!-- 드랍 버튼 끝 -->
		
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
<div class="row" style="overflow:hidden;">	
	<table class="table table-striped">
		<tr class="table-info">
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
</div>
<!-- End Content Column Grid -->
<%@ include file="../bottom.jsp"%>