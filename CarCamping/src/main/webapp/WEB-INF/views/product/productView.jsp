<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
1. 로그인 했을떄 안했을때 넘어가는 페이지 분리
2.리스트 다음페이지로 넘기기
3.리뷰 검색
4.대여날짜 넘기기
5.정렬
※일단 페이지 내에서 할 수 있는 기능부터 구현할것!!
 -->

<script>
function fn_account(val){
	window.open("<c:url value='productReviewView.product?rp_num="+val+"'/>",  
				"soyoInfoPop" ,"height=1000,width=700,top=100,left=200,scrollbars=yes,resizable=yes");
}
        
		function popup1() {
			var url = "myPageContactUs.myPage";
			var name = "popup test";
			var option = "width = 600, height = 500, top = 100, left = 200, location = no"
			window.open(url, name, option);
		}
		
		
    </script>

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
			</a>

			<!-- 이미지 영역 -->
			<div align="center">
				<h4>
					<img src="${getProduct.prod_viewImage1}" />
				</h4>
			</div>
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

			<!-- 여기서는 날짜 보내주기만 하고 저장은 구매할때 저장 -->
			<form name="f" action="myPageCart.myPage" method="post">
			<input type="hidden" name="prod_num" value="${getProduct.prod_num}">
				<div style="width: 100%; padding: 50px 0; background: 262626;">
				
					<div class="row search-box">
						<div style="margin-bottom: 10px;">
							빌린날짜 <input type="date" id="indate1" name="indate" ">
						</div>
						<div>
							반납날짜 <input type="date" id="outdate1" name="outdate">
						</div>
						<br>
						<div align="center">
						빌릴 갯수 입력
						 <input type="text" name="cart_prodCount" 
						  size="7" value="1" pattern="[0-9]+">
						</div>
						<br>
						<div>
						 <input type="submit" value="대여하기"> 
						<input	type="button" onclick="location.href='javascript:popup1()'" value="문의하기">
						</div>
					</div>
					
				</div>
			</form>


		</div>
		<!-- 용품 상세보기 영역 끝 -->

		<div class="col-md-8 themed-grid-col">
			<div class="row" align="center">
				<div class="row"></div>
				<h2>용품 리뷰 목록</h2>
			</div>
			<div class="row" align="center"
				style="overflow: scroll; width: 100%; height: 94%">
				
				<!-- 정렬 기능 -->

				<!-- 정렬기능 끝 -->
				
				<form name="f" method="post">
					<select name="search">
						<option selected value="rp_title">리뷰 제목</option>
						<option value="rp_content">리뷰 내용</option>
					</select> <input type="text" name="searchString">
					<button type="submit">검색하기</button>
				</form>
				<br>
				<!-- 본문 -->
				<c:if test="${empty ReList}">
					<table class="table table-borderless">
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
											등록된 리뷰가 없어요!!!<br>작성일
										</p>
										<a href="javascript:popup()"><button type="button"
												class="btn btn-primary" data-bs-toggle="modal">없음</button></a>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</c:if>
				<table class="table table-borderless">
					<tr>
						<c:set var="count" value="0" />
						<c:forEach items="${ReList}" var="pdto">
							<td>
								<div class="card" style="width: 18rem;">
									<!-- 리뷰리스트 이미지 영역 -->
									<img src="${pdto.rp_image1}">
									<!-- 리뷰리스트 이미지 영역 끝 -->
									<div class="card-body">
										<h5 class="card-title">${pdto.rp_title}</h5>
										<p class="card-text">
											<label for="disabledRange" class="form-label">평점 :
												${pdto.rp_score}</label> <input type="range" class="form-range"
												id="disabledRange" disabled> 조회수 :
											${pdto.rp_readCount}&nbsp;&nbsp; | &nbsp;&nbsp;좋아요 :
											${pdto.rp_likeCount}<br>작성일 : ${pdto.rp_sysdate}
										</p>
										<button type="submit"
											style="background-color: #0D6EFD; color: white;"
											onclick="fn_account(${pdto.rp_num}); return false;">내용</button>

									</div>
								</div>
							</td>
							<c:set var="count" value="${count+1 }" />
							<c:if test="${count%3==0 }">
					</tr>
					<tr>
						</c:if>
						</c:forEach>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>


<%@include file="../bottom.jsp"%>