<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="left.jsp"%>   

<!-- Content Column Grid -->
<div class="col-md-8 themed-grid-col" style="padding-left: 20px;padding-right: 20px;">
	<div class="row" align="center">
		<div class="col">
			<p class="h2"><strong>용품 리뷰 목록</strong></p>
		</div>
	
	<div class="row justify-content-md-center">
		<!-- 드랍 버튼 -->
		<div class="col" align="left">
			<form name="sortForm" action="adminReviewProduct.admin" method="post" enctype="multipart/form-data">
				<select name="sort">
					<option value="rp_likeCount">좋아요순</option>
					<option value="rp_sysdate">최신순</option>
					<option value="rp_adminConfirm">승인안됨</option>	
				</select>
				<button type="submit">정렬</button>
			</form>
		</div>
		
		<!-- 리뷰 검색 버튼 -->
		<div class="col" align="right">
			<form name="searchForm" action="adminReviewProduct.admin" method="post" enctype="multipart/form-data">
				<input type="search" name="search" placeholder="제목|내용">
				<button type="submit">검색</button>
			</form>
		</div>
	</div>
</div>
	&nbsp;

	<!-- 본문 -->
<div class="row" style="overflow:hidden;">	
	<table class="table table-striped">
		<tr class="table-info">
			<th>리뷰 제목</th>
			<th>개시일</th>
			<th>평점</th>
			<th>좋아요</th>
			<th>승인여부</th>
			<th> </th>
		</tr>
			<c:if test="${not empty adminListReviewProduct}">
			<c:forEach items="${adminListReviewProduct}" var="dto">
				<tr>
					<td>${dto.rp_title}</td>
					<td>${dto.rp_sysdate}</td>
					<td>${dto.rp_score}</td>
					<td>${dto.rp_likeCount}</td>
					<td>
						<c:if test="${dto.rp_adminConfirm==0}">
							승인 완료
						</c:if>
						<c:if test="${dto.rp_adminConfirm==1}">
							승인 대기중
						</c:if>
					</td>
					<td>
						<button type="button" class="btn btn-info"
							onclick="location.href='javascript:popup(${dto.rp_num})'">
							내용
						</button>
					</td>
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty adminListReviewProduct}">
				<tr>
					<td colspan="6" align="center">해당하는 리뷰가 없습니다</td>
				</tr>
			</c:if>
	</table>
	<script>
		function popup(a){
			var url = "adminViewReviewProduct.admin?rp_num="+a
			var name = "용품 리뷰 보기"
			var option = "width=700,height=800,top=100,left=200,location=no,resizable=no"
			window.open(url,name,option);
		}
	</script>
	
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page-3>1}">
				<li class="page-item"><a class="page-link" href="adminReviewProduct.admin?page=${page-1}">Previous</a></li>
			</c:if>
		<c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
			<c:if test="${i==page}">
				<li class="page-item"><a class="page-link" href="adminReviewProduct.admin?page=${i}" style="color:blue;">${i}</a></li>
			</c:if>
			<c:if test="${i!=page}">
				<li class="page-item"><a class="page-link" href="adminReviewProduct.admin?page=${i}">${i}</a></li>
			</c:if>
		</c:forEach>
			<c:if test="${page+3<pageCount}">
				<li class="page-item"><a class="page-link" href="adminReviewProduct.admin?page=${page+1}">Next</a></li>
			</c:if>
		</ul>
	</nav>
</div>
</div>
<!-- End Content Column Grid -->
<%@ include file="../bottom.jsp"%>