<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="left.jsp"%> 

<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script> -->
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
  
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
		<p class="fw-bolder">차박 장소 목록</p>
	</div>
	<div class="row">
		<!-- 정렬&지역 드랍 버튼 -->
		<div class="col">
			<form name="searchRegion" method="post" action="adminRegion.admin">
				<select name="region_num">
					<c:forEach items="${adminListRegion}" var="dto">
						<option value="${dto.region_num}">${dto.region_name}</option>
					</c:forEach>
				</select>
				<input type="submit" value="정렬">
			</form>
		</div>

		<div class="col" align="right">
		<!-- 장소 등록 버튼 -->
			<button type="button" class="btn btn-primary"
					onclick="location.href='javascript:popup()'">
						장소 등록
			</button>
		<!-- 장소 등록 버튼 끝 -->
		</div>
	</div>
		&nbsp;
	<script>
		function popup(){
			var url = "adminRegisterRegion.admin"
			var name = "장소 등록"
			var option = "width=600,height=800,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>

	<!-- 본문 -->
	
	<table class="table table-striped">
  		<tr>
  			<th>지역</th>
  			<th>장소명</th>
  			<th>일일대여요금(원)</th>
  			<th>평점</th>
  			<th>인기장소</th>
  			<th>보기|수정</th>
		</tr>
		
		<c:if test="${empty adminListCarCampingRegion}">
			<tr><td colspan="6">등록된 차박장소가 없습니다</td></tr>
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
				<td><button type="button" class="btn btn-primary" onclick="location.href='javascript:popupView(${cdto.ccr_num})'">수정</button></td>
				<c:set var="count" value="${count+1}"/>
				</tr>
			</c:forEach>
		</c:if>	
	</table>
	<script>
		function popupView(ccr_num){
			var url = "adminViewRegion.admin?ccr_num="+ccr_num
			var name = "장소 수정"
			var option = "width=600,height=800,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>
	
	
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

