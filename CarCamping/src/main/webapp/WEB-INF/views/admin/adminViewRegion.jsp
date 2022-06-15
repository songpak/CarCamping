<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 수정</title>
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
		<form name="viewRegion" method="post" action="adminUpdateRegion.admin" enctype="multipart/form-data">
		<input type = "hidden" name="ccr_num" value="${cdto.ccr_num}">
		<table class="table table-success table-striped">
			<tr>
				<th>
					장소명
				</th>
				<td>
					${cdto.regionDTO.region_name} <input type="text" name="ccr_name" value="${cdto.ccr_name}">
				</td>	
			</tr>
			<tr>
				<th>
					일일대여요금
				</th>
				<td>
					<input type="text" name="ccr_pricePerDay" value="${cdto.ccr_pricePerDay}">
				</td>
			</tr>
			<tr>
				<th>
					차량접근
				</th>
				<td>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_car,'승용차')}">
							<input type="checkbox" name="ccr_car1" checked>승용차
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_car1">승용차
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_car,'소형 트레일러')}">
							<input type="checkbox" name="ccr_car2" checked>소형 트레일러
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_car2">소형 트레일러
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_car,'카라반')}">
							<input type="checkbox" name="ccr_car3" checked>카라반
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_car3">카라반
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_car,'루프탑')}">
							<input type="checkbox" name="ccr_car4" checked>루프탑
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_car4">루프탑
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_car,'캠핑카')}">
							<input type="checkbox" name="ccr_car5" checked>캠핑카
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_car5">캠핑카
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>
					바닥종류
				</th>
				<td>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_ground,'맨흙')}">
							<input type="checkbox" name="ccr_ground1" checked>맨흙
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_ground1">맨흙
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_ground,'자갈')}">
							<input type="checkbox" name="ccr_ground2" checked>자갈
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_ground2">자갈
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_ground,'모래')}">
							<input type="checkbox" name="ccr_ground3" checked>모래
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_ground3">모래
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_ground,'데크')}">
							<input type="checkbox" name="ccr_ground4" checked>데크
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_ground4">데크
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cdto.ccr_ground,'잔디')}">
							<input type="checkbox" name="ccr_ground5" checked>잔디
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_ground5">잔디
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>
					편의시설
				</th>
				<td>
					<c:choose>
						<c:when test="${cdto.ccr_toilet==0}">
							<input type="checkbox" name="ccr_amenity1" checked>화장실
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_amenity1">화장실
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${cdto.ccr_restroom==0}">
							<input type="checkbox" name="ccr_amenity2" checked>샤워실
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_amenity2">샤워실
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${cdto.ccr_water==0}">
							<input type="checkbox" name="ccr_amenity3" checked>수도시설
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_amenity3">수도시설
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${cdto.ccr_market==0}">
							<input type="checkbox" name="ccr_amenity4" checked>주변상가
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_amenity4">주변상가
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${cdto.ccr_river==0}">
							<input type="checkbox" name="ccr_amenity5" checked>하천
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="ccr_amenity5">하천
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>
					장소 요약 설명 (30자 이내)
				</th>
				<td>
					<input type="text" name="ccr_summary" value="${cdto.ccr_summary}">
				</td>
			</tr>
			<tr>
				<th>
					장소 세부설명 (1000자 이내)
				</th>
				<td>
					<textarea name="ccr_content">${cdto.ccr_content}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					이미지 삽입(2~5개)
				</th>
				<td>
					<input class="form-control" id="formFileMultiple" type="file" multiple accept="image/*" name="ccr_viewImage">
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
				<th>리뷰수</th>
				<td>${cdto.ccr_reviewCount}</td>
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
					<input type="reset" value="취소">
					<button type="button" onclick="location.href='javascript:con()'">등록</button>
					<button type="button" onclick="location.href='javascript:con_delete()'">삭제</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>