<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<script>
	function con(){
		var con1 = window.confirm('정말 수정하시겠습니까?')
		if (con1){
			document.viewRegion.submit()
		}
	}
	function con_delete(){
		var con2 = window.confirm('정말 삭제하시겠습니까?')
		if (con2){
			location.href="adminDeleteRegion.admin?ccr_num="+${cdto.ccr_num}
		}
	}
</script>
<body>
	
	<div align="center">
		<form name="viewRegion" method="post" action="adminUpdateRegion.admin" enctype="multipart/form-data"
		class="row g-3 needs-validation" novalidate>
		<input type = "hidden" name="ccr_num" value="${cdto.ccr_num}">
		<table class="table table-sm">
			<tr>
				<td align="center">
					<p class="h3"><strong>${cdto.regionDTO.region_name}</strong></p>
				</td>
				<td>
					<div class="form-floating mb-3">
						<input type="text" name="ccr_name" value="${cdto.ccr_name}" class="form-control" id="validationCustom01" maxlength="15" placeholder="1" required>
						<label for="validationCustom01">장소명</label>
					</div>
				</td>	
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<input type="number" name="ccr_pricePerDay" value="${cdto.ccr_pricePerDay}" class="form-control" id="validationCustom02" min="0" placeholder="1" required>
						<label for="validationCustom02">일일사용요금(원)</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_car,'승용차')}">
							<input type="checkbox" name="ccr_car1" class="btn-check" id="btn-check1" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check1">승용차</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_car1" class="btn-check" id="btn-check1" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check1">승용차</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_car,'소형 트레일러')}">
							<input type="checkbox" name="ccr_car2" class="btn-check" id="btn-check2" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check2">소형 트레일러</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_car2" class="btn-check" id="btn-check2" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check2">소형 트레일러</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_car,'카라반')}">
							<input type="checkbox" name="ccr_car3" class="btn-check" id="btn-check3" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check3">카라반</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_car3" class="btn-check" id="btn-check3" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check3">카라반</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_car,'루프탑')}">
							<input type="checkbox" name="ccr_car4" class="btn-check" id="btn-check4" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check4">루프탑</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_car4" class="btn-check" id="btn-check4" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check4">루프탑</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_car,'캠핑카')}">
							<input type="checkbox" name="ccr_car5" class="btn-check" id="btn-check5" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check5">캠핑카</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_car5" class="btn-check" id="btn-check5" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check5">캠핑카</label>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_ground,'맨흙')}">
							<input type="checkbox" name="ccr_ground1" class="btn-check" id="btn-check6" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check6">맨흙</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_ground1" class="btn-check" id="btn-check6" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check6">맨흙</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_ground,'자갈')}">
							<input type="checkbox" name="ccr_ground2" class="btn-check" id="btn-check7" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check7">자갈</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_ground2" class="btn-check" id="btn-check7" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check7">자갈</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_ground,'모래')}">
							<input type="checkbox" name="ccr_ground3" class="btn-check" id="btn-check8" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check8">모래</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_ground3" class="btn-check" id="btn-check8" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check8">모래</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_ground,'데크')}">
							<input type="checkbox" name="ccr_ground4" class="btn-check" id="btn-check9" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check9">데크</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_ground4" class="btn-check" id="btn-check9" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check9">데크</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_ground,'잔디')}">
							<input type="checkbox" name="ccr_ground5" class="btn-check" id="btn-check10" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check10">잔디</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_ground5" class="btn-check" id="btn-check10" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check10">잔디</label>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:choose>
						<c:when test="${cdto.ccr_toilet==0}">
							<input type="checkbox" name="ccr_amenity1" class="btn-check" id="btn-check11" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check11">화장실</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_amenity1" class="btn-check" id="btn-check11" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check11">화장실</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${cdto.ccr_restroom==0}">
							<input type="checkbox" name="ccr_amenity2" class="btn-check" id="btn-check12" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check12">샤워실</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_amenity2" class="btn-check" id="btn-check12" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check12">샤워실</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${cdto.ccr_water==0}">
							<input type="checkbox" name="ccr_amenity3" class="btn-check" id="btn-check13" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check13">수도시설</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_amenity3" class="btn-check" id="btn-check13" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check13">수도시설</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${cdto.ccr_market==0}">
							<input type="checkbox" name="ccr_amenity4" class="btn-check" id="btn-check14" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check14">주변상가</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_amenity4" class="btn-check" id="btn-check14" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check14">주변상가</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${cdto.ccr_river==0}">
							<input type="checkbox" name="ccr_amenity5" class="btn-check" id="btn-check15" autocomplete="off" checked>
							<label class="btn btn-outline-primary" for="btn-check15">하천</label>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_amenity5" class="btn-check" id="btn-check15" autocomplete="off">
							<label class="btn btn-outline-primary" for="btn-check15">하천</label>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<input type="text" name="ccr_summary" value="${cdto.ccr_summary}" class="form-control" id="validationCustom03" maxlength="20" placeholder="1" required>
						<label for="validationCustom03">장소 요약 설명</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<textarea name="ccr_content" style="resize: none;" class="form-control" id="validationCustom04" maxlength="1000" placeholder="1" required>${cdto.ccr_content}</textarea>
						<label for="validationCustom04">장소 상세 설명</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input class="form-control" id="formFileMultiple" type="file" multiple accept="image/*" name="ccr_viewImage" class="form-control" id="validationCustom05" required>
					<div id="validationCustom05" class="form-text">최소 2개, 최대  5개 이미지 업로드 가능합니다</div>
					<ul id="file-list">
						<li class="no-items"></li>
					</ul>

					<script>
						var filesUpload = document
								.getElementById("formFileMultiple"), fileList = document
								.getElementById("file-list");

						function traverseFiles(files) {
							var li, file, fileInfo;
							fileList.innerHTML = "";

							for (var i = 0, il = files.length; i < il; i++) {
								li = document.createElement("li");
								file = files[i];
								fileInfo = "<div><strong>파일명:</strong> "+ file.name + "</div>";
						
								li.innerHTML = fileInfo;
								fileList.appendChild(li);
							}
							;
						};

						filesUpload.onchange = function() {
							traverseFiles(this.files);
						};
					</script>
				</td>
			</tr>
			<tr>
				<th>좋아요 수</th>
				<td>${cdto.ccr_likeCount}</td>
			</tr>
			<tr>
				<th>장소 평점</th>
				<td>${cdto.ccr_score}</td>
			</tr>
			<tr>
				<th>인기장소</th>
				<c:choose>
					<c:when test="${cdto.ccr_popular==0}">
						<td><input type="checkbox" name="ccr_popular" checked>체크시(예)</td>
					</c:when>
					<c:otherwise>
						<td><input type="checkbox" name="ccr_popular">체크시(예)</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button type="reset" class="btn btn-info">취소</button>
					<button type="button" class="btn btn-primary" onclick="location.href='javascript:con()'">수정</button>
					<button type="button" class="btn btn-primary" onclick="location.href='javascript:con_delete()'">삭제</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()
</script>
</html>