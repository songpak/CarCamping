<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../top.jsp" %>
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장소 리뷰 쓰기</title>
    <link rel="stylesheet" href="resources/css/rating2.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style>
.insert {
    padding: 20px 30px;
    display: block;
    width: 600px;
    margin: 5vh auto;
    height: 90vh;
    border: 1px solid #dbdbdb;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.insert .file-list {
    height: 200px;
    overflow: auto;
    border: 1px solid #989898;
    padding: 10px;
}
.insert .file-list .filebox p {
    font-size: 14px;
    margin-top: 10px;
    display: inline-block;
}
.insert .file-list .filebox .delete i{
    color: #ff5353;
    margin-left: 5px;
}

</style>
</head>
	
 <body> 
  	<form name="f" action="field_review.review" id="review" method="post" enctype="multipart/form-data">
  <div class="container">
  		<div class="row">
  			<div class="col-md-12 text-center">
  				<h2 class="section-title">리뷰쓰기</h2>
  				<div id= "myform" >
             	<fieldset name= "review_regionScore">
      		 		<input type="radio" name="rating1" value="5" id="rate1"><label for="rate1">⭐</label>
       		 		<input type="radio" name="rating1" value="4" id="rate2"><label for="rate2">⭐</label>
       		 		<input type="radio" name="rating1" value="3" id="rate3"><label for="rate3">⭐</label>
       		 		<input type="radio" name="rating1" value="2" id="rate4"><label for="rate4">⭐</label>
      		 		<input type="radio" name="rating1" value="1" id="rate5"><label for="rate5">⭐</label>
   			 		</fieldset>
   			 </div> 
  			</div>
        <div class="col-md-8 col-md-offset-2">
        	<label for="review_title">제목</label>
           		<input class="form-control" id="review_title" name="review_title" type="text" required />
         		<br>
         	<label for="review_summaryContent">장소 한줄리뷰</label>
            	<input class="form-control" id="review_summaryContent" name="review_summaryContent" placeholder="ex)화장실이 있어요" type="text" required />
         		<br>
		 	<label for="review_regionContent">리뷰 상세</label>
            	<textarea class="form-control" id="review_regionContent" name="review_regionContent" placeholder="리뷰 상세" rows="10"></textarea>
       	 		<br>	
		 	<label for="review_regionImage">장소이미지</label>
		 		<div class="insert">
		 		<input type="file" onchange="addFile(this);" multiple />
      			<div class="file-list"></div>	         
         		</div>
         		<br>
         	<button class="btn btn-success mb-3" type="submit">리뷰 작성</button>
         	<button class="btn btn-success mb-3" type="reset">취소</button>
      	</div>
   </div>
</div>
 </form>
</body>
<%@ include file="../bottom.jsp"%>