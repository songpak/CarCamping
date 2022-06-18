<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내용</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<script>
	function con(){
		var con1 = window.confirm('답글을 작성하시겠습니까?')
		if (con1){
			document.viewQuestion.submit()
		}
	}
</script>

<body>
	<div align="center">
		<form name="viewQuestion" method="post" action="adminViewQuestion.admin" enctype="multipart/form-data">
		<input type = "hidden" name="question_num" value="${qdto.question_num}">
		<table class="table table-success table-striped">
			<tr>
				<th>
					제목
				</th>
				<td>
					${qdto.question_title}
				</td>	
			</tr>
			<tr>
				<th>작성자</th>
				<td>${qdto.memberDTO.mem_nickName}</td>
			</tr>
			<tr>
				<th>문의 일시</th>
				<td>${qdto.question_sysdate}</td>
			</tr>
			<tr>
				<td colspan="2">
					${qdto.question_content}
				</td>
			</tr>
			<c:if test="${not empty qdto.question_replySysdate}">
				<tr>
					<th>답변 작성 일시</th>
					<td>${qdto.question_replySysdate}</td> 
				</tr>
			</c:if>
			<tr>
				<td colspan="2"><textarea name="question_reply">${qdto.question_reply}</textarea></td>
			<tr>
				<td align="center" colspan="2">
					<input type="reset" value="취소">
					<button type="button" onclick="location.href='javascript:con()'">답변</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>