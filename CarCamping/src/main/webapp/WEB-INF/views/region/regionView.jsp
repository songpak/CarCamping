<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>

<div class="modal modal-center fade" id="regionContent" tabindex="-1"
	role="dialog" aria-labelledby="regionContentLabel">
	<div class="modal-dialog modal-center modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">${regionSelected.ccr_name}의
					정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">${regionSelected.ccr_content}</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					data-bs-dismiss="modal" style="width: 100%;">Close</button>
			</div>
			    
		</div>
	</div>
</div>
 



<style>
html, body{
	background: white;
}
body {
	background: white;
}

.row mb-3 {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

/* section {
	margin-top: 30px;
	margin-bottom: 50px;
} */

#regionInfo li {
	width: 100%;
	hegiht: 20px;
	padding-bottom: 0px;
	padding-top: 0px;
}

.modal.modal-center {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal.modal-center:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog.modal-center.modal-lg {
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	 
}

#regionContent .modal-content {
	width: 600px;
	height: 800px;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>

		

<div class="container-fluid themed-container" style="margin-left: 55px;">
	<!-- Row Grid -->
	<div class="row mb-3">
		<!-- 모달창  style="postion:relative;" style="position:absolute;-->
		<!--
<div class="modal fade modal-dialog modal-dialog-scrollable modal-dialog-centered" id="regionContent" tabindex="-1" aria-labelledby="regionContentLabel" aria-hidden="true" ">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
  -->
		<script>
		function Like_function(ccr_num){
			location.href="regionLike.region?ccr_num="+ccr_num;
			console.log("좋아요 클릭");
		}			
				
		</script>
	
			
		
		<!-- List Column Grid -->
		<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
			style="width: 332px; padding-left: 0px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px; height: 632px; margin-right: 86px;margin-top: 50px;">
			<span class="fs-4 text-center" style="height: 40px;">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#regionContent">${regionSelected.ccr_name}</button>
			</span>

			<hr style="margin-top: 0px; margin-bottom: 5px;">
			<ul id="regionInfo" class="nav nav-pills flex-column mb-auto"
				style="margin-bottom: 0px; height: 600px;">
				<img src="resources/images/sik.jpg" class="card-img-top" alt="..."
					style="height: 250px;">
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					좋 아 요
					<button type="button" class="btn btn-danger rounded-pill" onclick="Like_function(${regionSelected.ccr_num});"
						style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 10px; height: 20px;">
						${regionSelected.ccr_likeCount}
						<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15"
							fill="currentColor" class="bi bi-person-hearts"
							viewBox="0 0 16 16"> <path fill-rule="evenodd"
								d="M11.5 1.246c.832-.855 2.913.642 0 2.566-2.913-1.924-.832-3.421 0-2.566ZM9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276ZM15 2.165c.555-.57 1.942.428 0 1.711-1.942-1.283-.555-2.281 0-1.71Z"></path></svg>
					</button>
				</li>
				
				
				
				
				<li id="viewCount"
					class="list-group-item d-flex justify-content-between align-items-center">
					리 뷰 수
					<button type="button" class="btn btn-dark rounded-pill"
						style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 10px; height: 20px;">
						${regionSelected.ccr_reviewCount}</button>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					별점 (${regionSelected.ccr_score}/5)
					<div class="container"
						style="width: 424px; margin-left: 0px; margin-right: 0px; padding-right: 0px; padding-left: 0px;">
						<div class="row">
							<div id="myform">
								<fieldset style="float: right;">
									<label for="rate1">⭐</label>
									<!-- 스위치 케이스 -->
									<label for="rate2">⭐</label> <label for="rate3">⭐</label> <label
										for="rate4">⭐</label> <label for="rate5">⭐</label>
								</fieldset>
							</div>
						</div>
					</div>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					차량접근
					<div>
						<c:choose>
						 <c:when test="${regionSelected.ccr_car}>0">
						 	<p>불가능</p>
						 </c:when>
						 <c:otherwise>
						 	<p>가능</p>
						 </c:otherwise>
						</c:choose>
						
					</div>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					일일대여요금
					<div>
						<p>${regionSelected.ccr_pricePerDay}원</p>
					</div>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					샤워실
					<div>
						<c:choose>
						 <c:when test="${regionSelected.ccr_restroom}>0">
						 		<p>없음</p>
						 </c:when>
						 <c:otherwise>
						 	<p>있음</p>
						 </c:otherwise>
						</c:choose>
						
					</div>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					화장실
					<div>
						<c:choose>
						 <c:when test="${regionSelected.ccr_toilet}>0">
						 		<p>없음</p>
						 </c:when>
						 <c:otherwise>
						 	<p>있음</p>
						 </c:otherwise>
						</c:choose>
						
					</div>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					주변상점
					<div>
						<c:choose>
						 <c:when test="${regionSelected.ccr_market}>0">
						 	<p>없음</p>
						 </c:when>
						 <c:otherwise>
						 	<p>있음</p>
						 </c:otherwise>
						</c:choose>
						
					</div>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					수도시설
					<div>
						<c:choose>
						 <c:when test="${regionSelected.ccr_water}>0">
						 	<p>없음</p>
						 </c:when>
						 <c:otherwise>
						 	<p>있음</p>
						 </c:otherwise>
						</c:choose>
					</div>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					하천
					<div>
						<c:choose>
						 <c:when test="${regionSelected.ccr_river}>0">
						 	<p>없음</p>
						 </c:when>
						 <c:otherwise>
						 	<p>있음</p>
						 </c:otherwise>
						</c:choose>
						
					</div>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					바닥종류
					<div>
						<p>${regionSelected.ccr_ground}</p>
					</div>
				</li>
			</ul>
		</div>

		<script>
			function popup(review_num) {
				var url = "regionReviewView.region?review_num="+review_num;
				var name = "popup test";
				var option = "width = 700, height = 1000, top = 100, left = 200, location = no"
				window.open(url, name, option);
			}
		</script>
		<div class="col-md-8 themed-grid-col">
			<div class="row" align="center">
				<div class="row">
					<figure class="text-center">
						<blockquote class="blockquote">
							<p></p>
						</blockquote>
						<figcaption class="blockquote-footer">
							<cite title="Source Title"></cite>
						</figcaption>
					</figure>
				</div>
				<h2 style="margin-bottom: 20px;">차박지 리뷰 목록</h2>
			</div>
			<div class="row">
				<!-- 드랍 버튼 -->
				<div class="col">
					<div class="btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false">정렬</button>
						<ul class="dropdown-menu" style="">
							<li><a class="dropdown-item" href="regionView.region?ccr_num=${regionSelected.ccr_num}&orderBy=newly">최신순</a></li>
							<li><a class="dropdown-item" href="regionView.region?ccr_num=${regionSelected.ccr_num}&orderBy=likeCount">좋아요순</a></li>
							<li><a class="dropdown-item" href="regionView.region?ccr_num=${regionSelected.ccr_num}&orderBy=regionScore">평점순</a></li>
						</ul>
					</div>
				</div>


				<!-- 리뷰 검색 -->
				<div class="col" align="right">
					<div class="input-group mb-3">
						<select class="form-select" aria-label="Default select example">
							<option value="1" align="center">리뷰제목&내용</option>
							<option value="2" align="center">리뷰작성자</option>
						</select> <input type="text" class="form-control" placeholder="리뷰를 검색하세요 !"
							aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-primary" type="button" id="button-addon2">검색</button>
					</div>
				</div>
			</div>


			<!-- 본문 -->
			<table class="table table-borderless">
				<tr>
					<c:if test="${empty reviewList}">
						<td><h2 align="center">제일 먼저 리뷰를 등록해보세요!</h2></td>
					</c:if>
					<c:forEach var="review_ccr" items="${reviewList }"> 
						<td>
						<div class="card border-success" style="width: 18rem;">
							<img src="resources/images/sik.jpg" class="card-img-top"
								style="width: 286px; height: 200px;">
							<div class="card-body">
								<div class="card-body">
									<h5 class="card-title">${review_ccr.review_title}</h5>
									<p class="card-text">${review_ccr.review_summaryContent }</p>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">별점
										(${review_ccr.review_regionScore}/5)
										<fieldset style="float: right;">
											<label for="rate1">⭐</label>
											<!-- 스위치 케이스 -->
											<label for="rate2">⭐</label> <label for="rate3">⭐</label> <label
												for="rate4">⭐</label> <label for="rate5">⭐</label>
										</fieldset>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
									조회수
									<div><p>${review_ccr.review_readCount}</p></div>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
									좋아요
									<div><p>${review_ccr.review_likeCount}</p></div>
									</li>
								</ul>
								<div class="card-body">
									<a href="javascript:popup(${review_ccr.review_num })"><button type="button" class="btn btn-primary" style="width:100%;">리뷰보러가기</button></a>
								</div>
							</div>
						</div>
					</td>
					
					</c:forEach>
				</tr>
			</table>

			
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${rowCount>0 }">
						<c:if test="${startPage>1}">
						<li class="page-item"><a class="page-link" href="regionView.region?ccr_num=${regionSelected.ccr_num}&pageNum=${startPage-1}&orderBy=${orderBy}">Previous</a></li>		
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item"><a class="page-link" href="regionView.region?ccr_num=${regionSelected.ccr_num}&pageNum=${i}&orderBy=${orderBy}"><c:out value="${i}"/></a></li>
						</c:forEach>
				 		<c:if test="${endPage < pageCount }">
						<li class="page-item"><a class="page-link" href="regionView.region?ccr_num=${regionSelected.ccr_num}&pageNum=${endPage+1}&orderBy=${orderBy}">Next</a></li>
						</c:if> 
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<%@include file="../bottom.jsp"%>