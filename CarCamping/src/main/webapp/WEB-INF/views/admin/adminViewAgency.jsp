<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대리점 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<script>
	function con(){
		var con1 = window.confirm('정말 수정하시겠습니까?')
		if (con1){
			document.viewAgency.submit()
		}
	}
	function con_delete(){
		var con2 = window.confirm('정말 삭제하시겠습니까?')
		if (con2){
			location.href="adminDeleteAgency.admin?agency_num="+${adto.agency_num}
		}
	}
</script>

<body>
	<div align="center">
		<form name="viewAgency" method="post" action="adminViewAgency.admin" enctype="multipart/form-data">
		<input type = "hidden" name="agency_num" value="${adto.agency_num}">
		<table class="table table-success table-striped">
			<tr>
				<th>
					대리점명
				</th>
				<td>
					<input type="text" name="agency_name" value="${adto.agency_name}">
				</td>	
			</tr>
			<tr>
				<th>
					위치
				</th>
				<td>
					<input type="text" name="agency_location" value="${adto.agency_location}">
				</td>
			</tr>
			<tr>
				<th>
					전화번호
				</th>
				<td>
					<input type="text" name="agency_phone" value="${adto.agency_phone}">
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="reset" value="취소">
					<button type="button" onclick="location.href='javascript:con()'">수정</button>
					<button type="button" onclick="location.href='javascript:con_delete()'">삭제</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>