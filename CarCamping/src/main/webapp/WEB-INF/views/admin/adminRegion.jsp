<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="left.jsp"%> 

<!-- Content Column Grid -->
<div class="col-md-8 themed-grid-col">
	
	<div class="row" align="center">
		<div class="col">
			<p class="h2"><strong>차박장소 목록</strong></p>
		</div>
	
	<div class="row justify-content-md-center">
		<!-- 정렬&지역 드랍 버튼 -->
		<div class="col" align="left">
			<form name="searchRegion" method="post" action="adminRegion.admin">
				<select name="region_num">
					<c:forEach items="${adminListRegion}" var="dto">
						<option value="${dto.region_num}">${dto.region_name}</option>
					</c:forEach>
				</select>
				<button type="submit" class="btn btn-info">정렬</button>
			</form>
		</div>

		<!-- 장소 등록 버튼 -->
		<div class="col" align="right">
			<button type="button" class="btn btn-info"
					onclick="location.href='javascript:popup()'">
						장소 등록
			</button>
			</div>
		<!-- 장소 등록 버튼 끝 -->
		</div>
	</div>
		&nbsp;
	<script>
		function popup(){
			var url = "adminRegisterRegion.admin"
			var name = "장소 등록"
			var option = "width=470,height=700,top=100,left=200,location=no,resizable=no"
			window.open(url,name,option);
		}
	</script>

	<!-- 본문 -->
<div class="row" style="overflow:hidden;">
	<table class="table table-striped">
  		<tr class="table-info">
  			<th>지역</th>
  			<th>장소명</th>
  			<th>일일대여요금(원)</th>
  			<th>평점</th>
  			<th>인기장소</th>
  			<th> </th>
		</tr>
		
		<c:if test="${empty adminListCarCampingRegion}">
			<tr><td colspan="6" align="center">해당하는 차박장소가 없습니다</td></tr>
		</c:if>
		
		<c:if test="${not empty adminListCarCampingRegion}">
			<c:forEach items="${adminListCarCampingRegion}" var="cdto">
				<tr>
				<td>${cdto.regionDTO.region_name}</td>
				<td>${cdto.ccr_name}</td>
				<td>${cdto.ccr_pricePerDay}</td>
				<td>${cdto.ccr_score}</td>
				<c:if test="${cdto.ccr_popular==0}">
					<td>예</td>
				</c:if>
				<c:if test="${cdto.ccr_popular==1}">
					<td>아니오</td>
				</c:if>
				<td><button type="button" class="btn btn-info" onclick="location.href='javascript:popupView(${cdto.ccr_num})'">상세</button></td>
				<c:set var="count" value="${count+1}"/>
				</tr>
			</c:forEach>
		</c:if>	
	</table>
	<script>
		function popupView(ccr_num){
			var url = "adminViewRegion.admin?ccr_num="+ccr_num
			var name = "장소 보기"
			var option = "width=470,height=700,top=100,left=200,location=no,resizable=no"
			window.open(url,name,option);
		}
	</script>
	
	
	<!-- 페이지 블록 -->
	<nav aria-label="Page navigation example">
	
	
		<ul class="pagination justify-content-center">
		
			<c:if test="${page-3>1}">
				<li class="page-item"><a class="page-link" href="adminRegion.admin?page=${page-1}">Previous</a></li>
			</c:if>
		<c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
				<li class="page-item"><a class="page-link" href="adminRegion.admin?page=${i}">${i}</a></li>
		</c:forEach>
			<c:if test="${page+3<pageCount}">
				<li class="page-item"><a class="page-link" href="adminRegion.admin?page=${page+1}">Next</a></li>
			</c:if>
		
		</ul>
	</nav>
</div>
</div>
<!-- End Content Coulmn Grid -->
<%@ include file="../bottom.jsp"%>

