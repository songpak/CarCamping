<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<script>
	function con(){
		document.insertCategory.submit()
	}
</script>
<body>
	<div align="center">
		<form name="insertCategory" method="post" action="adminInsertCategory.admin" enctype="multipart/form-data">
		<table class="table table-success table-striped">
			<tr>
				<th>
					<select name="category">
						<option value="brand">브랜드</option>
						<option value="product">상품</option>
					</select>
				</th>
				<td>
					<input type="text" name="name">
				</td>	
			</tr>
			<tr>
				<td colspan="2">
					<input type="reset" value="취소">
					<button type="button" onclick="location.href='javascript:con()'">등록</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>