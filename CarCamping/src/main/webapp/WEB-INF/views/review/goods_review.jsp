<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_input.jsp -->
<%@ include file="../top.jsp" %>
 <head>
 <!-- rating -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>용품 리뷰 쓰기</title>
    <link rel="stylesheet" href="resources/css/rating2.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
</head>
	

 <body> 
  <div class="container">
  				<div class="row">
  					<div class="col-md-12 text-center">
  					<h2 class="section-title">리뷰쓰기</h2>
  					</div>
          <div class="col-md-8 col-md-offset-2">
 	<form name="f" action="goods_review.review" id="review"
                     method="post" enctype="multipart/form-data">

          <label for="rp_title">제목</label>
           <input class="form-control" id="review_title" name="rp_title" type="text" required />
        	<br>

            <label for="rp_summaryContent">용품 한줄리뷰</label>
            <input class="form-control" id="rp_summaryContent" name="rp_summaryContent" placeholder="ex).." type="text" required />
            <br>

         <label for="rpRating">용품평점</label>
            <div id= "myform">
             <fieldset name= "rp_score">
      		 <input type="radio" name="rating1" value="5" id="rate1"><label for="rate1">⭐</label>
       		 <input type="radio" name="rating1" value="4" id="rate2"><label for="rate2">⭐</label>
       		 <input type="radio" name="rating1" value="3" id="rate3"><label for="rate3">⭐</label>
       		 <input type="radio" name="rating1" value="2" id="rate4"><label for="rate4">⭐</label>
      		 <input type="radio" name="rating1" value="1" id="rate5"><label for="rate5">⭐</label>
   			 </fieldset>
   			  </div>
        	<br>

          <label for="rp_image">용품이미지</label>
           <input type="file" class="form-control" name="rp_image1">
           <input type="file" class="form-control" name="rp_image2">
           <input type="file" class="form-control" name="rp_image3">
           <input type="file" class="form-control" name="rp_image4">
           <input type="file" class="form-control" name="rp_image5">
         <br>
     
          <label for="goodsRating">리뷰 상세</label>
            <textarea class="form-control" id="content" name="rp_content" placeholder="리뷰 상세" rows="5"></textarea>
           <br>
              <button class="btn btn-success mb-3" type="submit">리뷰 작성</button>
               <button class="btn btn-success mb-3" type="reset">취소</button>
     <br>
        </form>
      </div>
   </div>
</div>
</body>
<%@ include file="../bottom.jsp"%>