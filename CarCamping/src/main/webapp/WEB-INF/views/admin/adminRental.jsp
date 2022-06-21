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
			var url = "adminViewRentalLog.admin?rental_num="+a
			var name = "대여 정보"
			var option = "width=600,height=800,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>
	
	<!-- 본문 -->
<div class="row" style="overflow:hidden;">	
	<table class="table table-striped">
		<tr class="table-info">
			<th>회원ID</th>
			<th>용품명</th>
			<th>수량</th>
			<th>대리점명</th>
			<th>대여시작일</th>
			<th>대여종료일</th>
			<th>대여요금</th>
			<th>포인트 사용 요금</th>
			<th>반납상태</th>
			<th> </th>
		</tr>
		<c:if test="${not empty adminListRentalLog}">
		<c:forEach items="${adminListRentalLog}" var="dto">
			<tr>
				<td>${dto.productCartDTO.memberDTO.mem_id}</td>
				<td>${dto.productCartDTO.productDTO.prod_name}</td>
				<td>${dto.productCartDTO.cart_prodCount}</td>
				<td>${dto.productCartDTO.agencyDTO.agency_name}</td>
				<td>${dto.rental_from}</td>
				<td>${dto.rental_to}</td>
				<td>${dto.rental_price}</td>
				<td>${dto.rental_usePoint}</td>
				<c:if test="${dto.rentalReturn==0}">
					<td>대여중</td>
				</c:if>
				<c:if test="${dto.rentalReturn==1}">
					<td>반납완료</td>
				</c:if>
				<c:if test="${dto.rentalReturn==2}">
					<td>연장중</td>
				</c:if>
				<c:if test="${dto.rentalReturn==3}">
					<td>미납</td>
				</c:if>					
				<td><button type="button" class="btn btn-info"
				onclick="location.href='javascript:popup(${dto.rental_num})'">정보</button></td>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty adminListRentalLog}">
			<td colspan="10" align="center">해당하는 대여내역이 없습니다</td>
		</c:if>
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