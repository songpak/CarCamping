<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>

 <c:set var="ccr_num" value="${regionSelected.ccr_num }"/>
 <c:set var="mem_id" value="${sessionScope.id}"/>
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
html, body {
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
	border-color: #00205b;
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
#rigonContent 
.border .border-4 {
	border-color : red;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous">
</script>
 
<div class="container-fluid themed-container" style="margin-left: 55px;" id="test">
	<div class="row mb-3">
		<div class="d-flex flex-column flex-shrink-0 p-3 text-white border border-4 border-dark"
			style="width: 332px; padding-left: 0px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px; height: 632px; margin-right: 86px; margin-top: 50px;">
			<span class="fs-4 text-center" style="height: 40px;">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#regionContent" style=" background-color: #00205b; border-color: #00205b;">${regionSelected.ccr_name}</button>
			</span>
		
			<hr style="margin-top: 0px; margin-bottom: 5px;">
			<ul id="regionInfo" class="nav nav-pills flex-column mb-auto"
				style="margin-bottom: 0px; height: 600px;">
				<li class="list-group-item d-flex justify-content-between align-items-center">
					<img src="resources/images/sik.jpg" class="card-img-top" style="height: 250px;">
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					좋 아 요
					<c:if test="${check==0}">
					<button type="button" id="likeCount" class="btn rounded-pill" onclick="Like_function();"
						style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 10px; height: 20px; background-color:#ffffff;">
						${regionSelected.ccr_likeCount}💖
					</button>
					</c:if>
					<c:if test="${check==1 }">
					<button type="button" id="likeCount" class="btn rounded-pill" onclick="Like_function();"
						style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 10px; height: 20px; background-color:#bb2d3b;">
						${regionSelected.ccr_likeCount}💖
					</button>
					</c:if>
				</li>

				<li id="viewCount" class="list-group-item d-flex justify-content-between align-items-center">
					리 뷰 수
					<button type="button" class="btn btn-dark rounded-pill" disabled
						style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 10px; height: 20px;">
						${reviewCount}</button>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					별점 (${regionSelected.ccr_score}/5)
					<div class="container"
						style="width: 424px; margin-left: 0px; margin-right: 0px; padding-right: 0px; padding-left: 0px;">
						<div class="row">
							<div id="myform">
								<fieldset style="float: right;">
									<c:choose>
				 				<c:when test="${regionSelected.ccr_score >= 1 && regionSelected.ccr_score < 2 }">
				  							<label for="rate1">⭐</label>
				 				</c:when>
				 				<c:when test="${regionSelected.ccr_score >= 2 && regionSelected.ccr_score < 3 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				 				</c:when>
								 <c:when test="${regionSelected.ccr_score >= 3 && regionSelected.ccr_score < 4 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				 				</c:when>
				 				<c:when test="${regionSelected.ccr_score >= 4 && regionSelected.ccr_score < 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						 <label for="rate4">⭐</label>
				 				</c:when>
				 				<c:when test="${regionSelected.ccr_score eq 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						<label for="rate4">⭐</label>
				  						<label for="rate5">⭐</label> 
				 				</c:when>
								 <c:otherwise>
										 ☆☆☆☆☆
								 </c:otherwise>
								</c:choose>
								</fieldset>
							</div>
						</div>
					</div>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
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
				<li class="list-group-item d-flex justify-content-between align-items-center">
					일일대여요금
					<div>
						<p>${regionSelected.ccr_pricePerDay}원</p>
					</div>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
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
				<li class="list-group-item d-flex justify-content-between align-items-center">
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
				<li class="list-group-item d-flex justify-content-between align-items-center">
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
				<li class="list-group-item d-flex justify-content-between align-items-center">
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
				<li class="list-group-item d-flex justify-content-between align-items-center">
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
				<li class="list-group-item d-flex justify-content-between align-items-center">
					바닥종류
					<div>
						<p>${regionSelected.ccr_ground}</p>
					</div>
				</li>
			</ul>
		</div>

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
							data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #00205b; border-color: #00205b;">정렬</button>
						<ul class="dropdown-menu" style="margin-right: 13px;">
							<li><a class="dropdown-item"
								href="regionView.region?ccr_num=${ccr_num}&orderBy=newly&mode=${mode}&search=${search}&searchString=${searchString}&pageNum=1">
								최신순</a></li>
							<li><a class="dropdown-item"
								href="regionView.region?ccr_num=${ccr_num}&orderBy=review_likeCount&mode=${mode}&search=${search}&searchString=${searchString}&pageNum=1">
								좋아요순</a></li>
							<li><a class="dropdown-item"
								href="regionView.region?ccr_num=${ccr_num}&orderBy=review_regionScore&mode=${mode}&search=${search}&searchString=${searchString}&pageNum=1">
								별점순</a></li>
						</ul>
					</div>
					<button type="button" class="btn btn-success" style=" margin-left: 15px; background-color: #00205b; border-color: #00205b;" onclick="show_allList()">
							전체보기
					</button>
					<button type="button" class="btn btn-success" style=" margin-left: 15px; " onclick="location.href='test.region'">
							테스트
					</button>
				</div>
				
					<%-- regionView.region?ccr_num=${ccr_num}&orderBy=${orderBy }&mode=${mode}&search=${search}&searchString=${searchString}&pageNum=${i} --%>
				<!-- 리뷰 검색 -->
				<div class="col" align="right">
					<div class="input-group mb-3">
						<input type="hidden" name="mode" value="find" /> <select
							id="search" class="form-select"
							aria-label="Default select example">
							<option value="review_title" align="center">리뷰제목</option>
							<option value="review_regionContent" align="center">리뷰내용</option>
							<option value="mem_nickName" align="center">리뷰작성자</option>
						</select> <input type="text" id="searchString" class="form-control"
							placeholder="리뷰를 검색하세요 !" aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-primary" type="button" id="button-addon2" style="background-color: #00205b; border-color: #00205b;"
							onclick="search_function();">검색</button>
					</div>
				</div>
			</div>

			<!-- 본문 -->
			<table class="table table-borderless">
				<tr>
					<c:if test="${empty reviewList}">
						<c:if test="${not empty searchString }"><td><h2 align="center">검색 하신 리뷰는 존재하지 않습니다.</h2></td></c:if>
						<c:if test="${empty searchString }"><td><h2 align="center">제일 먼저 리뷰를 등록해보세요!</h2></td></c:if>
					</c:if>
					<c:forEach var="review_ccr" items="${reviewList }">
						<td>
							<div class="card border-success" style="width: 18rem;">
								<img src="resources/images/sik.jpg" class="card-img-top"
									style="width: 284px; height: 200px;">
								<div class="card-body">
									<div class="card-body">
										<h5 class="card-title">${review_ccr.review_title}</h5>
										<p class="card-text">${review_ccr.review_summaryContent }</p>
									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">별점
											(${review_ccr.review_regionScore}/5)
											<fieldset style="float: right;">
												<c:choose>
				 				<c:when test="${review_ccr.review_regionScore >= 1 && review_ccr.review_regionScore < 2 }">
				  							<label for="rate1">⭐</label>
				 				</c:when>
				 				<c:when test="${review_ccr.review_regionScore >= 2 && review_ccr.review_regionScore < 3 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				 				</c:when>
								 <c:when test="${review_ccr.review_regionScore >= 3 && review_ccr.review_regionScore < 4 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				 				</c:when>
				 				<c:when test="${review_ccr.review_regionScore >= 4 && review_ccr.review_regionScore < 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						 <label for="rate4">⭐</label>
				 				</c:when>
				 				<c:when test="${review_ccr.review_regionScore eq 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						<label for="rate4">⭐</label>
				  						<label for="rate5">⭐</label> 
				 				</c:when>
								 <c:otherwise>
										 ☆☆☆☆☆
								 </c:otherwise>
								</c:choose>
											</fieldset>
										</li>
										<li
											class="list-group-item d-flex justify-content-between align-items-center">
											조회수
											<div>
												<p>${review_ccr.review_readCount}</p>
											</div>
										</li>
										<li class="list-group-item d-flex justify-content-between align-items-center">
											좋아요
											<div>
												<p>${review_ccr.review_likeCount}</p>
											</div>
										</li>
									</ul>
									<div class="card-body">
										<a href="javascript:popup(${review_ccr.review_num })"><button
												type="button" class="btn btn-primary" style="width: 100%;">리뷰 보러가기</button></a>
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
								<li class="page-item">
								<a class="page-link" href="#" onclick="location.href='regionView.region?ccr_num=${ccr_num}&orderBy=${orderBy }&mode=${mode}&search=${search}&searchString=${searchString}&pageNum=${startPage-1}'">
									Previous</a>
								</li> 
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li class="page-item">
							<a class="page-link" href="#" onclick="location.href='regionView.region?ccr_num=${ccr_num}&orderBy=${orderBy }&mode=${mode}&search=${search}&searchString=${searchString}&pageNum=${i}'">
									<c:out value="${i}" /></a>
							</li>						
 						</c:forEach>
						<c:if test="${endPage < pageCount }">
							<li class="page-item">
							<a class="page-link" href="#" onclick="location.href='regionView.region?ccr_num=${ccr_num}&orderBy=${orderBy }&mode=${mode}&search=${search}&searchString=${searchString}&pageNum=${endPage+1}'">
									Next</a>							
							</li>
						</c:if>
					</c:if>	
				</ul>
			</nav>
		</div>
	</div>
</div>
<script>
		var isRun = false; // ajax 동시 호출 막기(ajax가 호출되는 동안 버튼이 클릭돼도 중복으로 실행되는것을 막기위함)
		
		function Like_function(){
			var mid = '${mem_id}';
			var isEmpty = function(value){//빈값체크
	            if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
	              return true
	            }else{
	              return false
	            }
	          };
			
			if(isEmpty(mid)){ //아이디가 없으면
				console.log("아이디없음");
				alert("로그인을 해주세요 !!");
				
			}else{ //아이디가 있으면			
				 if(isRun == true) {
				        return;
				    }
				 isRun = true;
					//클릭시 로딩 이미지 호출
				  var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
				    loadingHtml += '<div class="loading_box"><img src="<c:url value="/resources/images/loading_image.gif"/>"  /></div></div>'; 
				   $('body').fadeTo( "fast", 0.4 ).append(loadingHtml);
				 
			
					var like_button = document.getElementById("likeCount");
	   				var like_color = like_button.style.backgroundColor;
	   				
					
					$.ajax({
						url: "updateRegionLike.region", //컨트롤러 맵핑
		                type: "POST",
		                data: { //사용자가 데이터를 정의한다	
		                	mem_id: '${mem_id}',
		                	ccr_num: ${ccr_num}
		                },         
		                success: function (res) { //아래 function에서 data를 사용하기 위해서 파라미터로 정의한 데이터 data를 넘겨주어야한다.
					       	// $('#test').text(data); // 바꾸고 싶은 태그의 아이디를 이용해서 태그에 접근하여 맵핑된 컨트롤러가 리턴한 스트링값으로 바꾼다.
					       	 $('body').fadeTo( "slow", 1 ).find('#loading').remove();
		                	$("#likeCount").text(res+"💖");
		                	if(like_color == 'rgb(255, 255, 255)'){
		                		 alert("회원님의 좋아요가 성공적으로 등록되었습니다 !!😍");	
		               			$("#likeCount").css("background-color","#bb2d3b");
		               		}else if(like_color == 'rgb(187, 45, 59)'){
		               			 alert("회원님의 좋아요가 취소되었습니다 !!😢"); 
		                		$("#likeCount").css("background-color","#fffff");//#bb2d3b  rgb(187, 45, 59)
		               		}
		                	
		                	isRun  = false;
		                }
					});
			}	
		}
		function popup(review_num) {
			var url = "regionReviewView.region?review_num="+review_num;
			var name = "popup";
		    var _left = Math.ceil(( window.screen.width - 800 )/2);
			var _top = Math.ceil(( window.screen.height - 1000 )/2); 
			
			var option = "width = 800, height = 900, top ="+_top+", left = "+_left+"'y', location = no,  menubar=no,resizable=no.toolbar=no";
			window.open(url, name, option);
		}
		
		function search_function(){
			var searchSelect = document.getElementById("search");
			var search = searchSelect.options[searchSelect.selectedIndex].value;
			var searchString = document.getElementById("searchString").value;
			location.href="regionView.region?ccr_num="+${ccr_num}+"&mode="+'searchReview'+"&orderBy="+'newly'+"&search="+search+"&searchString="+searchString;
		}
		
		function show_allList(){
			location.href = "regionView.region?ccr_num=${ccr_num}";
			
		}
		
</script>


<%@include file="../bottom.jsp"%>