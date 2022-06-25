<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<script type="text/javascript">

/* var doubleSubmitFlag = false;
    function doubleSubmitCheck(){
        if(doubleSubmitFlag){
            return doubleSubmitFlag;
        }else{
            doubleSubmitFlag = true;
            return false;
        }
    } */

function fn_account(val){
	   /*  if(doubleSubmitCheck()) return; */
	location.href="likeButton.product?rp_num="+val;
}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>용품대여 리뷰</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="resources/css/review_styles.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.1.3/dist/lux/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css"
	integrity="sha384-eoTu3+HydHRBIjnCVwsFyCpUDZHZSFKEJD0mc3ZqSBSb6YhZzRHeiomAUWCstIWo"
	crossorigin="anonymous">
	
<style>
	#viewCount .btn-dark[disabled]{
		color: #fff;
   		background-color: #1a1a1a;
    	border-color: #1a1a1a;
	}
	textarea {
    resize: none;
  }
</style>
</head>
<body>
	<div id="wrapper">
		<!-- Begin Header -->
		<div align="center" id="header">
			<div class="card border-primary mb-3"
				style="width: 700px; height: 930px">
				<div class="card-header">
				
				<c:forEach items="${getRv}" var="rdto">
					<h2 style="margin-bottom: 0px;">${rdto.rp_title }</h2>
					</c:forEach>
					
				</div>
				<div class="card-body">
				
				<c:forEach items="${getRv}" var="rdto">
					<img src="${rdto.rp_image1 }" class="card-img rounded-circle"
						style="width: 150px; height: 150px" />
					<ul class="list-group">
						<li class="list-group-item d-flex justify-content-between align-items-center">
						
						<!------------------------------- 좋아요 기능--------------------------- -->
							<h5>좋 아 요</h5>
							<button type="submit" onclick="fn_account(${rdto.rp_num}); return false;" class="btn btn-danger rounded-pill" style=" padding-top: 0px;padding-bottom: 0px; padding-left: 10px; padding-right: 10px;">
							${rdto.rp_likeCount }
							<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-person-hearts" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M11.5 1.246c.832-.855 2.913.642 0 2.566-2.913-1.924-.832-3.421 0-2.566ZM9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276ZM15 2.165c.555-.57 1.942.428 0 1.711-1.942-1.283-.555-2.281 0-1.71Z"></path></svg>
							</button>
						<!------------------------------- 좋아요 기능--------------------------- -->
						</li>
						<li id="viewCount" class="list-group-item d-flex justify-content-between align-items-center">
							<h5>조 회 수</h5>
							<button  type="button" class="btn btn-dark rounded-pill" style="padding-top: 0px;padding-bottom: 0px; padding-left: 10px; padding-right: 10px;">
							${rdto.rp_readCount }
							</button>
						</li>
						<li class="list-group-item d-flex justify-content-between align-items-center">
							<h5>별점 ${rdto.rp_score}</h5>
							
							<div class="container" style="width: 424px;margin-left: 0px;margin-right: 0px;padding-right: 0px;padding-left: 0px;">
								<div class="row">
									<div id="myform">
										<fieldset style="float:right;">
										<c:choose>
				 				<c:when test="${rdto.rp_score >= 1 && rdto.rp_score < 2 }">
				  							<label for="rate1">⭐</label>
				 				</c:when>
				 				<c:when test="${rdto.rp_score >= 2 && rdto.rp_score < 3 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				 				</c:when>
								 <c:when test="${rdto.rp_score >= 3 && rdto.rp_score < 4 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				 				</c:when>
				 				<c:when test="${rdto.rp_score >= 4 && rdto.rp_score < 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						 <label for="rate4">⭐</label>
				 				</c:when>
				 				<c:when test="${rdto.rp_score eq 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						 <label for="rate4">⭐</label>
				  						 <label for="rate5">⭐</label> 
				 				</c:when>
								 <c:otherwise>
								  아직 별점이 없습니다.
								 </c:otherwise>
								</c:choose>
										</fieldset>
									</div>
								</div>
							</div>
						</li>
					</ul>
					</c:forEach>
					
					<p></p>
					<div class="progress">
						<div
							class="progress-bar progress-bar-striped progress-bar-animated"
							role="progressbar" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100" style="width: 100%;"></div>
					</div>
					<div align="center" id="leftcolumn"
						style="width: 666px; margin-top: 20px;">
						<div class="slider-gr">
						
						<c:forEach items="${getRv}" var="rdto">
							<input type="radio" name="slide" id="slide1" checked /> <input
								type="radio" name="slide" id="slide2" /> <input type="radio"
								name="slide" id="slide3" /> <input type="radio" name="slide"
								id="slide4" />
							<ul id="imgholder" class="imgs">
								<li><img style="width: 100%; height: 100%;" src="${rdto.rp_image1 }" /></li>
								<li><img style="width: 100%; height: 100%;" src="${rdto.rp_image2 }" /></li>
								<li><img style="width: 100%; height: 100%;" src="${rdto.rp_image3 }" /></li>
								<li><img style="width: 100%; height: 100%;" src="${rdto.rp_image4 }" /></li>
							</ul>
							</c:forEach>
							
							<div class="bullets">
								<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
								<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
							</div>
						</div>
						<p></p>
						<div class="progress">
							<div
								class="progress-bar progress-bar-striped progress-bar-animated"
								role="progressbar" aria-valuenow="75" aria-valuemin="0"
								aria-valuemax="100" style="width: 100%;"></div>
						</div>
						<div class="form-group">
							<p></p>
							<blockquote class="blockquote">
							
								<p class="mb-0">REVIEW</p>
							</blockquote>
							
							<c:forEach items="${getRv}" var="rdto">
							<textarea class="form-control  border border-5 border-dark"
								id="exampleTextarea" rows="3" readonly>${rdto.rp_content }</textarea>
								</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <script>
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
						url: "updateReviewLike.region", //컨트롤러 맵핑
		                type: "POST",
		                data: { //사용자가 데이터를 정의한다	
		                	mem_id: '${mem_id}',
		                	review_num: ${review_num}
		                },         
		                success: function (res) { //아래 function에서 data를 사용하기 위해서 파라미터로 정의한 데이터 data를 넘겨주어야한다.
					       	// $('#test').text(data); // 바꾸고 싶은 태그의 아이디를 이용해서 태그에 접근하여 맵핑된 컨트롤러가 리턴한 스트링값으로 바꾼다.
					       	 $('body').fadeTo( "slow", 1 ).find('#loading').remove();
		                	$("#likeCount").text(res+"💖");
		                	if(like_color == 'rgb(255, 255, 255)'){
		                		 alert("회원님의 좋아요가 성공적으로 등록되었습니다 !!😍"); 
		                		$("#likeCount").css("background-color","#bb2d3b");//#bb2d3b  rgb(187, 45, 59)
		               		}else if(like_color == 'rgb(187, 45, 59)'){          
		               			alert("회원님의 좋아요가 취소되었습니다 !!😢"); 
		               			$("#likeCount").css("background-color","white");
		               		}   
		                	isRun  = false;
		                }
					});
			}	
		}
		
		
		document.getElementById("reviewTextarea").scrollTop = document.getElementById("reviewTextarea").scrollHeight;
		
		</script> -->
</body>
</html>
