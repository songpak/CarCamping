<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<h5>좋 아 요</h5>
							<button type="button" class="btn btn-danger rounded-pill" style=" padding-top: 0px;padding-bottom: 0px; padding-left: 10px; padding-right: 10px;">
							${rdto.rp_likeCount }
							<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-person-hearts" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M11.5 1.246c.832-.855 2.913.642 0 2.566-2.913-1.924-.832-3.421 0-2.566ZM9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276ZM15 2.165c.555-.57 1.942.428 0 1.711-1.942-1.283-.555-2.281 0-1.71Z"></path></svg>
							</button>
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
</body>
</html>
