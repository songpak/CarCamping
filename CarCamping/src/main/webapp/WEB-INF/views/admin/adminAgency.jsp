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
			<p class="h2"><strong>대리점 목록</strong></p>
		</div>
	
	<div class="row justify-content-md-center">
		<!-- 정렬 지역 버튼 -->
		<div class="col" align="left">
			<form name="searchRegion" method="post" action="adminAgency.admin">
				<select name="region_num">
					<c:forEach items="${adminListRegion}" var="dto">
						<option value="${dto.region_num}">${dto.region_name}</option>
					</c:forEach>
				</select>
				<input type="submit" value="정렬">
			</form>
		</div>
		<!-- 정렬 지역 버튼 끝 -->
		
		<!-- 대리점 등록 버튼 -->
			<div class="col" align="right">
				<button type="button" class="btn btn-info"
					onclick="location.href='javascript:popup()'">
						대리점 등록
			</button>
			</div>
		<!-- 대리점 등록 버튼 끝 -->
	</div>
	</div>
	&nbsp;
	<script>
		function popup(){
			var url = "adminRegisterAgency.admin"
			var name = "대리점 등록"
			var option = "width=300,height=400,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>
	
	<!-- 본문 -->
<div class="row" style="overflow:hidden;">
	<table class="table table-striped">
		<tr>
			<th>지역</th>
			<th>대리점명</th>
			<th>위치</th>
			<th>전화번호</th>
			<th> </th>
		</tr>
		<c:if test="${not empty adminListAgency}">
			<c:forEach items="${adminListAgency}" var="dto">
				<tr>
					<td>${dto.regionDTO.region_name}</td>
					<td>${dto.agency_name}</td>
					<td>${dto.agency_location}</td>
					<td>${dto.agency_phone}</td>
					<td><button type="button" 
							class="btn btn-info"
							onclick="location.href='javascript:popup2(${dto.agency_num})'">
								수정
						</button></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty adminListAgency}">
			<tr>
				<td colspan="5" align="center">등록된 대리점이 없습니다</td>
			</tr>
		</c:if>
	</table>
	
	<script>
		function popup2(a){
			var url = "adminViewAgency.admin?agency_num="+a
			var name = "대리점 수정"
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
</div>
<!-- End Content Coulmn Grid -->
<%@ include file="../bottom.jsp"%>