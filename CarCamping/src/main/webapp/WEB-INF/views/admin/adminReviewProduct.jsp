<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="left.jsp"%>   
<!-- Content Column Grid -->
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
		<p class="fw-bolder">용품 리뷰 목록</p>
	</div>
	<div class="row">
		<!-- 드랍 버튼 -->
		<div class="col">
			<form name="sortForm" action="adminReviewProduct.admin" method="post" enctype="multipart/form-data">
				<select name="sort">
					<option value="rp_likeCount">좋아요순</option>
					<option value="rp_sysdate">최신순</option>
					<option value="rp_adminConfirm">승인안됨</option>	
				</select>
				<input type="submit" value="정렬">
			</form>
		</div>
		
		<!-- 리뷰 검색 버튼 -->
		<div class="col">
			<form name="searchForm" action="adminReviewProduct.admin" method="post" enctype="multipart/form-data">
				<input type="text" name="search">
				<input type="submit" value="검색">
			</form>
		</div>

	</div>
	&nbsp;

	<!-- 본문 -->
	<table class="table table-borderless">
		<tr>
			<c:set var="count" value="0" />
			<c:forEach items="${adminListReviewProduct}" var="dto">
				<td>
					<div class="card" style="width: 18rem;">
						<img src="Region1.jpg" class="card-img-top">
						<div class="card-body">
							<h5 class="card-title">${dto.rp_title}</h5>
							<p class="card-text">
								<label for="disabledRange" class="form-label">평점|평점개수</label> <input
									type="range" class="form-range" id="disabledRange" disabled>
								${dto.rp_readCount}회 방문|${dto.rp_likeCount} 좋아요<br>
								${dto.rp_sysdate}<br>
								<c:if test="${dto.rp_adminConfirm==0}">
							승인 완료
							</c:if>
								<c:if test="${dto.rp_adminConfirm==1}">
							승인 대기중
							</c:if>
							</p>
							<button type="button" class="btn btn-primary"
								onclick="location.href='javascript:popup(${dto.rp_num})'">
								내용</button>
						</div>
					</div>
				</td>
				<c:set var="count" value="${count+1}" />
				<c:if test="${count%4==0}">
		</tr>
		<tr>
				</c:if>
		</c:forEach>
		</tr>
	</table>
	<script>
		function popup(a){
			var url = "adminViewReviewProduct.admin?rp_num="+a
			var name = "장소 리뷰 보기"
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

<!-- End Content Column Grid -->
<%@ include file="../bottom.jsp"%>