<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../top.jsp" %>
<c:set var="mem_num" value="3" />
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장소 리뷰 쓰기</title>
    <link rel="stylesheet" href="resources/css/rating2.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


</head>
<!-- 유효성 검사 js -->
<script type="text/javascript">
document.getElementById("review_regionContent").scrollTop = document.getElementById("review_regionContent").scrollHeight;

function reviewContentChk(){
	 var fieldReview = document.fieldReview;
	 var fileList = document.getElementById("file-list");
	 
	 if(fieldReview.review_regionContent.value.length<30){
		 alert("리뷰 내용은 30자 이상 입력해주세요 😅");
		 fieldReview.review_regionContent.focus();
		 return false;
	 }else if(!fileList.textContent){
		 alert("이미지 파일을 한 개 이상 첨부해주세요 😅");
		 return false;
	 }
}
</script>



<!-- 기타 js -->
<script type="text/javascript">
var isRun = false; // ajax 동시 호출 막기(ajax가 호출되는 동안 버튼이 클릭돼도 중복으로 실행되는것을 막기위함)

function SelectRegion(){
	alert('${mem_num}');
	 if(isRun == true) {
	        return;
	    }
	 isRun = true;
	//클릭시 로딩 이미지 호출
	  var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
	    loadingHtml += '<div class="loading_box"><img src="<c:url value="/resources/images/loading_image.gif"/>"  /></div></div>'; 
	   $('body').fadeTo( "fast", 0.4 ).append(loadingHtml);
	var selectedRegionNum = $("#review_region option:selected").val(); // region_num 저장
	//alert(selectedRegionNum);
	var ccr_list = []; //region_num에 따른 ccr을 받아올 리스트
	
	//ajax호출
	$.ajax({
		url : "ccr_list.review",/* 컨트롤러 맵핑  */
		type : "post",
		data :  {region_num : selectedRegionNum},
		
		success : function(listsize){
			 $('body').fadeTo( "slow", 1 ).find('#loading').remove();
			$('#review_ccr').empty();
			//alert(listsize);
			$('#review_ccr').html(listsize);
			alert("지역이 변경됐습니다. 장소를 다시 선택해주세요 !");
			isRun  = false;
		},
		error :   function(request, status, error){
            console.log("차박장소 리스트를 불러오는 중 오류 발생 !");
        }
	});	
}


</script>
 <body> 
<form name="fieldReview" onsubmit="return reviewContentChk()" id="fieldReview" method="post" enctype="multipart/form-data">
  <input type="hidden" name="memberDTO.mem_num" value="${mem_num}"/>
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
        	<div style="display: flex; margin-top:10px">
        	
        	<label for="review_region" style="padding-top: 9px;margin-right: 10px;">지역</label>
           		<select class="form-control" id="review_region" name="review_region" onchange="SelectRegion();" required 
           		style="width: 226.22222px; margin-right:90px;">
           		<option value="" selected disabled>지역을 선택해주세요---------</option>
           		<option value="1">서울|경기도</option>
           		<option value="2">강원도</option>
           		<option value="3">충청북도</option>
           		<option value="4">충청남도</option>
           		<option value="5">경상북도</option>
           		<option value="6">경상남도</option>
           		<option value="7">전라북도</option>
           		<option value="8">전라남도</option>
           		<option value="9">제주도</option>
           		</select>
           	
           	<label for="review_ccr" style="padding-top: 9px;margin-right: 10px;">장소</label>
           		<select class="form-control" type="text" name="carCampingRegionDTO.ccr_num"  id="review_ccr" required  style="width: 357px;">
           		
           		</select>
        	</div>
        	<br>
        	<label for="review_title">제목</label>
           		<input class="form-control" id="review_title" name="review_title" type="text" required />
         		<br>
         	<label for="review_summaryContent">장소 한줄리뷰</label>
            	<input class="form-control" id="review_summaryContent" name="review_summaryContent" placeholder="ex)화장실이 있어요" type="text" required />
         		<br>
		 	<label for="review_regionContent">리뷰 상세</label>
            	<textarea class="form-control" id="review_regionContent" name="review_regionContent" placeholder="리뷰 상세" rows="18" required  style="resize:none;"></textarea>
       	 		<br>	

      	</div>
   </div>
</div>
<div style="text-align: center;">
	<!-- <button class="btn btn-warning mb-3" onclick="submitForm();" style="margin-right: 60px;">리뷰 작성</button>  -->
	<input class="btn btn-warning mb-3" value="리뷰 작성" type="submit" style="margin-right: 60px;"/>
 	<button class="btn btn-danger mb-3" type="reset">취소</button>
</div>
</form>

</body>
<%@ include file="../bottom.jsp"%>