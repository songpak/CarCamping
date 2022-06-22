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
    display: block;
    width: 100%;   
    border: 1px solid #dbdbdb;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.insert .file-list {
    height: 120px;
    overflow: auto;
    border: 1px solid #989898;
    padding: 10px;
}
.insert .file-list .filebox p {
    font-size: 14px;
    margin-top: 5px;
    display: inline-block;
}
.insert .file-list .filebox .delete i{
    color: #ff5353;
    margin-left: 5px;
}

</style>
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
	 alert(fileList.textContent);
	 alert("!");
	 return false;
}
</script>

<!-- 파일 첨부 관련 js  -->
<script type="text/javascript">
var fileNo = 0;
var filesArr = new Array();

function addFile(obj){
    var maxFileCnt = 5;// 첨부파일 최대 개수
    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;// 추가로 첨부가능한 개수
    var curFileCnt = obj.files.length;// 현재 선택된 첨부파일 개수
    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) { //최대개수를 넘기면
        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    } else { // 아니면 
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
                htmlData += '	<p class="name">' + file.name + '</p>';
                htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');">💣</a>';
                htmlData += '</div>';
                $('.file-list').append(htmlData);
                fileNo++;
            } else {
                continue;
            }
        }
    }
    document.querySelector("input[type=file]").value = "";
}
    /* 첨부파일 삭제 */
    function deleteFile(num) {
        document.querySelector("#file" + num).remove();
        filesArr[num].is_delete = true;
    }

    /* 폼 전송 */
    function submitForm() {
        // 폼데이터 담기
        var form = document.querySelector("#fieldReview");
        var formData = new FormData(form);
        for (var i = 0; i < filesArr.length; i++) {
            if (!filesArr[i].is_delete) {// 삭제되지 않은 파일만 폼데이터에 담기
                formData.append("attach_file", filesArr[i]);
            }
        }
        $.ajax({
            method: 'POST',
            url: '/register', // 컨트롤러 맵핑 !!
            dataType: 'json',
            data: formData,
            async: true,
            timeout: 30000,
            cache: false,
            headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
            success: function () {
                alert("파일업로드 성공");
            },
            error: function (xhr, desc, err) {
                alert('에러가 발생 하였습니다.');
                return;
            }
        })
    }

/* 첨부파일 검증 */
function validation(obj){
    const fileTypes = ['image/gif', 'image/jpeg', 'image/png'];
    if (obj.name.length > 100) {
        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
        return false;
    } else if (obj.size > (30 * 1024 * 1024)) {
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
</script>

<!-- 기타 js -->
<script type="text/javascript">

function SelectRegion(){
	var selectedRegionNum = $("#review_region option:selected").val(); // region_num 저장
	alert(selectedRegionNum);
	var ccr_list = []; //region_num에 따른 ccr을 받아올 리스트
	
	//ajax호출
	$.ajax({
		url : "ccr_list.review",/* 컨트롤러 맵핑  */
		type : "post",
		data :  {region_num : selectedRegionNum},
		success : function(listsize){
			alert(listsize);
		},
		error :   function(request, status, error){
            console.log("차박장소 리스트를 불러오는 중 오류 발생 !");
        }
	});
	
}


</script>
 <body> 
<form name="fieldReview" onsubmit="return reviewContentChk()" id="fieldReview" method="post" enctype="multipart/form-data">
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
           		<option value="1" name="1">서울|경기도</option>
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
           		<input class="form-control" type="text" list="review_ccrList" id="review_ccr" required  style="width: 357px;"/>
           		<datalist id="review_ccrList">
           		<option value="1">1</option>
           		<option value="2">2</option>
           		<option value="3">3</option>
           		<option value="4">4</option>
           		<option value="5">5</option>
           		<option value="6">6</option>
           		<option value="7">7</option>
           		<option value="8">8</option>
           		<option value="9">9</option>
           		</datalist>	
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
		 	<label for="review_regionImage">장소이미지</label>
		 		<div class="insert">
		 		<input type="file" onchange="addFile(this);" multiple />
      			<div class="file-list" id="file-list"></div>	         
         		</div>
         		<br>

      	</div>
   </div>
</div>
<div style="text-align: center;">
	<input class="btn btn-warning mb-3" type="submit" value="리뷰 작성" style="margin-right: 60px;"/>
 	<button class="btn btn-danger mb-3" type="reset">취소</button>
</div>
</form>

</body>
<%@ include file="../bottom.jsp"%>