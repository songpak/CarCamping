<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_input.jsp -->
<%@ include file="../top.jsp" %>
 <head>
 <!-- rating -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/rating2.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

<script>
	function field_review(){
		let signIn = "${signIn}";
		if (signIn ==""){
			alert("리뷰 쓰기는 로그인 후 사용하실 수 있습니다.");
			location.href="login.login";
			
		}else{
			location.href="field_review.review";
		}
	}
</script>
</head>
	

 <body> 
  <div class="container">
  				<div class="row">
  					<div class="col-md-12 text-center">
  					<h2 class="section-title">리뷰쓰기</h2>
  					</div>
          <div class="col-md-8 col-md-offset-2">
 	<form name="f" action="prod_input.do" id="review"
                     method="post" enctype="multipart/form-data">

          <label for="goodsRating">제목</label>
           <input class="form-control" id="review_title" name="review_title" type="text" required />
        	<br>

            <label for="goodsRating">장소 한줄리뷰</label>
            <input class="form-control" id="review_summaryContent" name="review_summaryContent" placeholder="ex)화장실이 있어요" type="text" required />
            <br>

         <label for="goodsRating">장소평점</label>
            <div id= "myform">
             <fieldset >
      		 <input type="radio" name="rating1" value="5" id="rate1"><label for="rate1">⭐</label>
       		 <input type="radio" name="rating1" value="4" id="rate2"><label for="rate2">⭐</label>
       		 <input type="radio" name="rating1" value="3" id="rate3"><label for="rate3">⭐</label>
       		 <input type="radio" name="rating1" value="2" id="rate4"><label for="rate4">⭐</label>
      		 <input type="radio" name="rating1" value="1" id="rate5"><label for="rate5">⭐</label>
   			 </fieldset>
   			  </div>
        	<br>

          <label for="goodsRating">장소이미지</label>
           <input type="file" class="form-control" name="review_regionImage1">
         <br>
     
          <label for="goodsRating">리뷰 상세</label>
            <textarea class="form-control" id="content" name="content" placeholder="리뷰 상세" rows="5"></textarea>
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