<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="myPageWriteReviewButton.jsp"%> 
<script src="http://code.jquery.com/jquery-latest.js"></script>
<div class="container" align="center" class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
	<div class="row" align="center">
		</div>
	  
<!-- Content Column Grid -->
	<script>
		function popup_region(a){
			var url = "myPageWriteReviewRegionView.myPage?review_num="+a
			var name = "내가 쓴 리뷰"
			var option = "width=800,height=400,top=100,left=300,location=no"
			window.open(url,name,option);
		}

		function popup_product(a){
			var url = "myPageWriteReviewProductView.myPage?rp_num="+a
			var name = "내가 쓴 리뷰"
			var option = "width=800,height=400,top=100,left=300,location=no"
			window.open(url,name,option);
		}
		</script>

<table class="table table-borderless">
<!-- 차박지 리뷰 -->
<c:if test="${empty param.mode}">
	<!-- 본문 -->

	<c:if test="${empty listRegion}">
			<tr>
				<td>작성한 차박지 리뷰가 없습니다.</td>
			</tr>
		</c:if>
			<br>		
		<c:forEach var="rdto" items="${listRegion}">
			<td>
				<div class="card" style="width: 18rem;">
					<img src="Region1.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">${rdto.review_title}</h5>
						<p class="card-text">
							<label for="disabledRange" class="form-label">평점 ${rdto.review_regionScore}</label> <input
								type="range" class="form-range" id="disabledRange" disabled>
							조회수 ${rdto.review_readCount} &nbsp;|&nbsp;좋아요 개수 ${rdto.review_likeCount}<br>작성일 ${rdto.review_sysdate}<br>
						</p>
						<button type="button" class="btn btn-dark"
							onclick="location.href='javascript:popup_region(${rdto.review_num})'">
							상세보기</button>
						</div>
					</div>
				</td>

		</c:forEach>
	</c:if>



		<!-- 용품 리뷰만 보기 -->	
<c:if test="${not empty param.mode}">
	<c:if test="${empty listProduct}">
			<tr>
				<td>작성한 용품 리뷰가 없습니다.</td>
			</tr>
		</c:if>	
					<br>		
		<c:forEach var="pdto" items="${listProduct}">
			<td>
				<div class="card" style="width: 18rem;">
					<img src="Region1.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">${pdto.rp_title}</h5>
						<p class="card-text">
							<label for="disabledRange" class="form-label">평점 ${pdto.rp_score}</label> <input
								type="range" class="form-range" id="disabledRange" disabled>
							조회수 ${pdto.rp_readCount} &nbsp;|&nbsp;좋아요 개수 ${pdto.rp_likeCount}<br>작성일 ${pdto.rp_sysdate}<br>
						</p>
						<button type="button" class="btn btn-dark"
							onclick="location.href='javascript:popup_product(${pdto.rp_num})'">
							상세보기</button>
						</div>
					</div>
				</td>
			</c:forEach>
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

<%@ include file="../bottom.jsp"%>