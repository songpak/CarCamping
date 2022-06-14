<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
1. 로그인 했을떄 안했을때 넘어가는 페이지 분리
2.리스트 다음페이지로 넘기기
3.리뷰 검색
4.대여날짜 넘기기
5.정렬
※일단 페이지 내에서 할 수 있는 기능부터 구현할것!!
 -->

<!-- 부트스트랩 영역 -->
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
	<!-- 부트스트랩 영역 끝 -->
	 
<!-- 용품상세보기 영역 -->
<div class="container-fluid themed-container"
	style="margin-top: 40px; margin-left: 10%;">
	<!-- Row Grid -->
	<div class="row mb-3">
		<!-- List Column Grid -->
		<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
			style="width: 280px;">
			<a href="/"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				<svg class="bi me-2" width="40" height="32">
					<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">용품
					상세정보</span>
					
			<!-- 이미지 영역 -->
			</a> <img src="resources/images/carbak1.jpg" class="card-img-top" alt="...">
			<!-- 이미지 영역 끝 -->
			
			<script type="text/javascript">
		$("#mForm").submit(function(){
			var indate2 = $("#indate1").val();
			var outdate2 = $("#outdate1").val();
			var date1 = indate2.split('-');
			var in_date = new Date(indate2);
			var date2 = outdate2.split('-');
			var out_date = new Date(outdate2);
			
   			var date = new Date();
   			
	   		if(indate2 != ''){
	       		if(outdate2 != ''){
		    		if(date.getDate() <= in_date.getDate()){
		    			if(in_date.getDate() > out_date.getDate()){
		     				alert('반납날짜보다 빌린날짜가 먼저여야 합니다');
		     				return false;
		     			}
		    		}else {
		    			alert('지난 날짜는 선택 할 수 없습니다.');
		    			return false;
		    		}
	       		}else{
	       			alert('반납날짜를 지정해주세요');
	       			return false;
	       		}
	       	}else{
	       		alert('빌린날짜를 지정해주세요');
	       		return false;
	       	}
		});
	});
</script>

<script>
			function popup1() {
				var url = "myPageContactUs.myPage";
				var name = "popup test";
				var option = "width = 600, height = 500, top = 100, left = 200, location = no"
				window.open(url, name, option);
			}
</script>
			<style>
.search-box {
	width: fit-content;
	background-color: 262626;
	border-radius: 8px;
	padding: 25px;
	box-shadow: 0 2px 8px rgb(0 0 0/ 20%);
	box-sizing: border-box;
	margin: 0 auto;
}

.search-box input {
	border-radius: 5px;
	border: 1px solid #1f244d;
	line-height: 40px;
}

.search-box input[type="text"], .search-box input[type="date"] {
	text-indent: 5px;
}

.search-box>div {
	margin-right: 10px;
	font-size: 13px;
}
</style>
			<form name="f_searchOk" action="SearchOk" method="post" id="mForm">
				<div style="width: 100%; padding: 50px 0; background: 262626;">
					<div class="row search-box">
						<div style="margin-bottom: 10px;">
							빌린날짜 <input type="date" id="indate1" name="indate"
								value="${indate}">
						</div>
						<div>
							반납날짜 <input type="date" id="outdate1" name="outdate"
								value="${outdate}">
						</div>
						<br>
						<br>
						<button type="button" class="btn btn-primary"
							style="margin-top: 10px; margin-bottom: 20px;"
							onclick="location.href='myPageCart.myPage'">대여하기</button>

						<button type="button" class="btn btn-primary"
						onclick="location.href='javascript:popup1()'">문의하기</button>
					</div>
				</div>
			</form>

		</div>
		<!-- 용품 상세보기 영역 끝 -->
		
		<!-- 팝업 연결 영역 -->
		<script>
        function popup(){
            var url = "productReviewView.product";
            var name = "popup test";
            var option = "width = 800, height = 1000, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>
    <!-- 팝업 연결영역 끝 -->
    
		<div class="col-md-8 themed-grid-col">
			<div class="row" align="center">
				<div class="row">
				</div>
				<h2>용품 리뷰 목록</h2>
			</div>
			<div class="row">
				<!-- 드랍 버튼 -->
				<div class="col">
					<div class="btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false">정렬</button>
						<ul class="dropdown-menu" style="">
							<li><a class="dropdown-item" href="#">인기순</a></li>
							<li><a class="dropdown-item" href="#">최신순</a></li>

						</ul>
					</div>
				</div>


				<!-- 리뷰 검색 모달 버튼 -->
				<div class="col" align="right">
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						리뷰 검색</button>
				</div>
				<!-- 리뷰 검색 모달 버튼 끝 -->
			</div>
			<div class="row">&nbsp;</div>


			<!-- 리뷰 검색 모달 -->
			<form class="row gy-2 gx-3 align-items-center" name ="f" action="productView.product" method="post">
				<div class="modal fade" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">리뷰 검색</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
							
								<!-- 선택범주&검색명 -->
								
								<div class="row">
									<div class="col">
										<div class="form-floating">
										
											<select class="form-select" name="search"
												aria-label="Floating label select example">
												<option selected value ="rp_title">리뷰 제목</option>
												<option value="prodName">용품명</option>
											</select> <label for="floatingSelect">선택</label>
										</div>
									</div>
									<div class="col">
										<div class="form-floating mb-3">
											<input type="text" class="form-control" name="searchString"> 
												<label for="floatingInput">검색창</label>
												
										</div>
									</div>
								</div>

								<!-- 버튼 영역 -->
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
									<button type="submit" class="btn btn-primary">찾기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- 리뷰 검색 모달 끝 -->

			<!-- 본문 -->
			<table class="table table-borderless">
			<c:if test="${empty listProdReview }">
			<tr>
				<td>
					<div class="card" style="width: 18rem;">
						<!-- 리뷰리스트 이미지 영역 -->
							<img src="resources/images/carbak4.jpg" class="card-img-top">
							<!-- 리뷰리스트 이미지 영역 끝 -->
							<div class="card-body">
								<h5 class="card-title">리뷰 없음</h5>
								<p class="card-text">
									<label for="disabledRange" class="form-label">없음</label> <input
										type="range" class="form-range" id="disabledRange" disabled>
									조회수|좋아요 개수<br>작성일
								</p>
								<a href="javascript:popup()"><button type="button"
										class="btn btn-primary" data-bs-toggle="modal">없음</button></a>
							</div>
						</div>
					</td>
			</tr>
				</c:if>
				
				<c:forEach var="dto" items="${listProdReview}">
				<tr>
					<c:set var="count" value="0" />
					<td align="right"><c:out value="${pageNum}"/></td>
					<c:set var="pageNum" value="${pageNum-1}"/>
					<td>
						<div class="card" style="width: 18rem;">
						<!-- 리뷰리스트 이미지 영역 -->
							<img src="resources/images/carbak4.jpg" class="card-img-top">
							<!-- 리뷰리스트 이미지 영역 끝 -->
							<div class="card-body">
								<h5 class="card-title">${dto.rp_title}</h5>
								<p class="card-text">
									<label for="disabledRange" class="form-label">${dto.rp_score}|${dto.rp_likeCount}</label> <input
										type="range" class="form-range" id="disabledRange" disabled>
									조회수|좋아요 개수<br>작성일
								</p>
								<a href="javascript:popup()"><button type="button"
										class="btn btn-primary" data-bs-toggle="modal">내용</button></a>
							</div>
						</div>
					</td>
					</tr>
					<c:set var="count" value="${count+1 }"/>
					<c:if test="${count%3==0 }">
					<tr></tr>
					</c:if>
					</c:forEach>
			</table>
			
			<!-- 페이지 넘기기 영역 -->
			  <nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					
					<!-- 페이징 기능 -->
					<c:if test="${rowCount>0}">			
			<c:if test="${startPage>1}">
					<li class="page-item disabled"><a class="page-link" href="productView.product?pageNum=${startPage-1}">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
					[<a class="page-link" href="productView.product?pageNum=${i}"><c:out value="${i}"/></a>]
					</c:forEach>
					
					<c:if test="${endPage<pageCount}">
					<li class="page-item"><a class="page-link" href="productView.product?pageNum=${endPage+1}">Next</a></li>
					</c:if>
		</c:if>
		<!-- 페이징 기능 끝 --> 
				</ul>
			</nav>
			<!-- 페이지 넘기기 영역 끝 -->
			
			<!-- 페이지 이동할 href(리뷰DTO 완성되면 주소 넣을것) -->
			
			<!-- 
			<c:if test="${rowCount>0}">			
			<c:if test="${startPage>1}">
				[<a href="productView.product?pageNum=${startPage-1}">이전</a>]			
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				[<a href="productView.product?pageNum=${i}"><c:out value="${i}"/></a>]	
			</c:forEach>
			<c:if test="${endPage<pageCount}">
				[<a href="productView.product?pageNum=${endPage+1}">다음</a>]			
			</c:if>
		</c:if> 
		-->
			
		</div>

	</div>
</div>

<%@include file="../bottom.jsp"%>