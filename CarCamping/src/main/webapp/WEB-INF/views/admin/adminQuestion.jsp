<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="left.jsp"%>   
<!-- Content Column Grid -->
<div class="col-md-8 themed-grid-col">
	<div class="row">
		<figure class="text-center">
			<blockquote class="blockquote">
				<p>A well-known quote, contained in a blockquote element.</p>
			</blockquote>
			<figcaption class="blockquote-footer">
				Someone famous in <cite title="Source Title">Source Title</cite>
			</figcaption>
		</figure>
	</div>
	<div class="row" align="center">
		<div class="col">
			<p class="fw-bolder">문의사항 목록</p>
		</div>
	</div>
	<div class="row">
		<!-- 드랍 버튼 -->
			<div class="col" align="left">
				<form name="sortForm" action="adminQuestion.admin" method="post" enctype="multipart/form-data">
					<select name="sort">
						<option value="question_sysdate">최신순</option>
						<option value="question_reply">답변 미완료</option>
					</select>
					<input type="submit" value="정렬">
				</form>
			</div>
		<!-- 드랍 버튼 끝 -->
	</div>
	&nbsp;
	<!-- 본문 -->
	<table class="table table-striped">
		<tr>
			<th>문의일시</th>
			<th>회원ID</th>
			<th>제목</th>
			<th>답변</th>
		</tr>
		
		<c:forEach items="${adminListQuestion}" var="dto">
			<tr>
				<td>${dto.question_sysdate}</td>
				<td>${dto.memberDTO.mem_nickName}</td>
				<td>${dto.question_content}</td>
				<td><button type="button" 
						class="btn btn-primary" onclick="location.href='javascript:popup(${dto.question_num})'">
							내용
					</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<script>
		function popup(a){
			var url = "adminViewQuestion.admin?question_num="+a
			var name = "문의 내용"
			var option = "width=300,height=200,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>
	
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
</div>
<!-- End Content Coulmn Grid -->
<%@ include file="../bottom.jsp"%>