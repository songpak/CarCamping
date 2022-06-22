<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp"%>
<html>
<head>  
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<title>문의목록</title>
	<script>
		function popup(){
			var url = "myPageContactUs.myPage?mem_num=${mem_num}"
			var name = "문의글 작성"
			var option = "width=800,height=400,top=100,left=300,location=no"
			window.open(url,name,option);
		}
		
	</script>
</head>
<body>

	<div class="container" align="center" class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
		<h2>문 의 목 록</h2>

		
		
		<table class="table table-striped table-hover">
		<tr>
			<th scope="col" width="10%" class="text-center">번호</th>
			<th scope="col" width="60%" class="text-center">제목</th>
			<th scope="col" width="10%" class="text-center">작성자</th>
			<th scope="col" width="20%" class="text-center">문의일</th>

		</tr>
				<c:if test="${empty listBoard}">
			<tr>
				<td colspan="4">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>			
		<c:forEach var="dto" items="${listBoard}">
			<tr>
				<td align="center">${dto.question_num}</td>		
				<td align="center"><a href="contentQuestion.myPage?question_num=${dto.question_num}">
						${dto.question_title}
					</a></td>
				<td align="center">${dto.memberDTO.mem_id}</td>
				<td align="center">${dto.question_sysdate}</td>
			</tr>		
			</c:forEach>

		</table>
		 <div class="col-md-offset-9"> 
		<button id="writehBtn" type="button" class="btn btn-dark" onclick="location.href='javascript:popup()'" >문의글 작성</button>
                
		</div>
		
		 <div class="col-xs-6 col-xs-offset-3"> 
	<nav>
	  <ul class="pagination">
	    <li><a href="#"><span aria-hidden="true">←</span><span class="sr-only">Previous</span></a></li>
	    <li><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li><a href="#"><span aria-hidden="true">→</span><span class="sr-only">Next</span></a></li>
	  </ul>
	</nav>
</div>
</div>
		
	
</body>
<%@ include file="../bottom.jsp"%>
</html>