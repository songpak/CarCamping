<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대리점 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div align="center">
		<form name="registerAgency" method="post" action="adminRegisterAgency.admin" enctype="multipart/form-data">
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
					<input type="text" name="agency_name">
				</td>	
			</tr>
			<tr>
				<th>
					위치
				</th>
				<td>
					<input type="text" name="agency_location">
				</td>
			</tr>
			<tr>
				<th>
					전화번호
				</th>
				<td>
					<input type="text" name="agency_phone">
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