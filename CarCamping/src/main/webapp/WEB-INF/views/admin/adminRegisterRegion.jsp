<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div align="center">
		<form name="registerRegion" method="post" action="adminRegisterRegion.admin" enctype="multipart/form-data">
		<table class="table table-success table-striped">
			<tr>
				<th>
					<select name="region_num">
						<c:forEach items="${adminListRegion}" var="dto">
							<option value="${dto.region_num}">${dto.region_name}</option>
						</c:forEach>
					</select>
				</th>
				<td>
					<input type="text" name="ccr_name">
				</td>	
			</tr>
			<tr>
				<th>
					일일대여요금
				</th>
				<td>
					<input type="text" name="ccr_pricePerDay">
				</td>
			</tr>
			<tr>
				<th>
					차량접근
				</th>
				<td>
					<input type="checkbox" name="ccr_car1">승용차
					<input type="checkbox" name="ccr_car2">소형 트레일러
					<input type="checkbox" name="ccr_car3">카라반
					<input type="checkbox" name="ccr_car4">루프탑
					<input type="checkbox" name="ccr_car5">캠핑카
				</td>
			</tr>
			<tr>
				<th>
					바닥종류
				</th>
				<td>
					<input type="checkbox" name="ccr_ground1">맨흙
					<input type="checkbox" name="ccr_ground2">자갈
					<input type="checkbox" name="ccr_ground3">모래
					<input type="checkbox" name="ccr_ground4">데크
					<input type="checkbox" name="ccr_ground5">잔디
				</td>
			</tr>
			<tr>
				<th>
					편의시설
				</th>
				<td>
					<input type="checkbox" name="ccr_amenity1">화장실
					<input type="checkbox" name="ccr_amenity2">샤워실
					<input type="checkbox" name="ccr_amenity3">수도시설
					<input type="checkbox" name="ccr_amenity4">주변상가
					<input type="checkbox" name="ccr_amenity5">하천
				</td>
			</tr>
			<tr>
				<th>
					장소 요약 설명 (30자 이내)
				</th>
				<td>
					<input type="text" name="ccr_summary">
				</td>
			</tr>
			<tr>
				<th>
					장소 세부설명 (1000자 이내)
				</th>
				<td>
					<textarea name="ccr_content"></textarea>
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
				<td align="center" colspan="2">
					<input type="reset" value="취소">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>