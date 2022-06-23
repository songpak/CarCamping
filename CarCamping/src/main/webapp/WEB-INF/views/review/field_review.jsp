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
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js" defer></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


</head>

<!-- 유효성 검사 js -->
<script type="text/javascript">
document.getElementById("review_regionContent").scrollTop = document.getElementById("review_regionContent").scrollHeight;

function reviewContentChk(){
	/*  var fieldReview = document.fieldReview;
	 var fileList = document.getElementById("review_ImageList");
	 
	 if(fieldReview.review_regionContent.value.length<30){
		 alert("리뷰 내용은 30자 이상 입력해주세요 😅");
		 fieldReview.review_regionContent.focus();
		 return false;
	 }else if(!fileList.textContent){
		 alert("이미지 파일을 한 개 이상 첨부해주세요 😅");
		 return false;
	 } */
	return false;
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
		
		success : function(list){
			 $('body').fadeTo( "slow", 1 ).find('#loading').remove();
			$('#review_ccr').empty();
			//alert(listsize);
			$('#review_ccr').append(list);
			//$('#review_ccr').select2();
			alert("지역이 변경됐습니다. 장소를 다시 선택해주세요 !");
			$('#review_ccr').select2();
			isRun  = false;
		},
		error :   function(request, status, error){
            console.log("차박장소 리스트를 불러오는 중 오류 발생 !");
        }
	});
	
}


</script>
<style>
.select2-container .select2-selection--single .select2-selection__rendered {
	padding-top: 2.5px;
}
.select2-container .select2-selection--single {
    height: 35px;
}

.insert {
    padding: 20px 30px;
    display: block;
    width: 600px;
    margin: ;
    height: 100px;
    border: 1px solid #dbdbdb;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.insert .review_ImageList {
    height: 50px;
    overflow: auto;
    border: 1px solid #989898;
    padding: 10px;
}
.insert .review_ImageList .filebox p {
    font-size: 14px;
    margin-top: 10px;
    display: inline-block;
}
.insert .review_ImageList .filebox .delete i{
    color: #ff5353;
    margin-left: 5px;
}


</style>
<form name="fieldReview" onsubmit="return reviewContentChk()" id="fieldReview" method="post" enctype="multipart/form-data">

  <input type="hidden" name="memberDTO.mem_num" value="${mem_num}"/>
  <div class="container">
  		<div class="row">
  			<div class="col-md-12 text-center">
  				<h2 class="section-title">리뷰쓰기</h2>
  				<div id= "myform" >
             	<fieldset name= "review_regionScore">
      		 		<input type="radio" name="review_regionScore" value="5" id="rate1"><label for="rate1">⭐</label>
       		 		<input type="radio" name="review_regionScore" value="4" id="rate2"><label for="rate2">⭐</label>
       		 		<input type="radio" name="review_regionScore" value="3" id="rate3"><label for="rate3">⭐</label>
       		 		<input type="radio" name="review_regionScore" value="2" id="rate4"><label for="rate4">⭐</label>
      		 		<input type="radio" name="review_regionScore" value="1" id="rate5"><label for="rate5">⭐</label>
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
           		<select class="form-control" name="carCampingRegionDTO.ccr_num"  id="review_ccr" required  style="width: 357px;">
           			<option value="" selected disabled>------------지역을 먼저 선택해주세요------------</option>
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
			<div class="insert">
      			<input type="file"  onchange="addFile(this);" multiple />
        		<div class="review_ImageList"></div>
			</div>
      	</div>
   </div>
</div>
<div style="text-align: center;">
	 <button class="btn btn-warning mb-3" onclick="submitForm();" style="margin-right: 60px;">리뷰 작성</button> 
	<!-- <input class="btn btn-warning mb-3" value="리뷰 작성" type="submit" style="margin-right: 60px;"/> -->
 	<button class="btn btn-danger mb-3" type="reset">취소</button>
</div>
</form>

<script>

var fileNo = 0;
var filesArr = new Array();

/* 첨부파일 추가 */
function addFile(obj){
    var maxFileCnt = 5;   // 첨부파일 최대 개수
    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    } else {
        for (const file of obj.files) {
            // 첨부파일 검증
            if (validation(file)) {
                // 파일 배열에 담기
                var reader = new FileReader();
                reader.onload = function () {
                    filesArr.push(file);
                };
                reader.readAsDataURL(file);

                // 목록 추가
                let htmlData = '';
                htmlData += '<div id="file' + fileNo + '" class="filebox">';
                htmlData += '   <p class="name">' + file.name + '</p>';
                htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
                htmlData += '</div>';
                $('.review_ImageList').append(htmlData);
                fileNo++;
            } else {
                continue;
            }
        }
    }
    // 초기화
   	document.querySelector("input[type=file]").value = "";
}

/* 첨부파일 검증 */
function validation(obj){
    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
    if (obj.name.length > 100) {
        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
        return false;
    } else if (obj.size > (100 * 1024 * 1024)) {
        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
        return false;
    } else if (obj.name.lastIndexOf('.') == -1) {
        alert("확장자가 없는 파일은 제외되었습니다.");
        return false;
    } else if (!fileTypes.includes(obj.type)) {
        alert("첨부가 불가능한 파일은 제외되었습니다.");
        return false;
    } else {
        return true;
    }
}

/* 첨부파일 삭제 */
function deleteFile(num) {
    document.querySelector("#file" + num).remove();
    filesArr[num].is_delete = true;
    alert(filesArr.length);
}

/* 폼 전송 */
function submitForm() {
    // 폼데이터 담기
    var form = document.querySelector("#fieldReview");
    var formData = new FormData(form);
    for (var i = 0; i < filesArr.length; i++) {
        // 삭제되지 않은 파일만 폼데이터에 담기
        if (!filesArr[i].is_delete) {
            formData.append("review_regionImage", filesArr[i]);
           	
        }
    }
   	/* formData.getAll('review_regionImage'); 
    for (let values of formData.values()) {
        console.log(values); // 이미지 객체의 정보
      } */
      
      for (let key of formData.keys()) {
   	   console.log(key);
   }
      for (let value of formData.values()) {
          console.log(value);
    }	
      $.ajax({
   	      type: "POST",
   	   	  enctype: "multipart/form-data",
   	      url: "/field_review.review",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      success: function (data) {
   	    	if(JSON.parse(data)['result'] == "OK"){
   	    		alert("파일업로드 성공");
			} else
				alert("서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
   	      },
   	      error: function (xhr, status, error) {
   	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
   	     return false;
   	      }
   	    });
    
}
</script>

<%@ include file="../bottom.jsp"%>