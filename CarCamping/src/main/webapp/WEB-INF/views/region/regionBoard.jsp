<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>

<c:set var="region_num" value="${listRegionCount.region_num}"/>

<div align="center">
	<table border="1" width="800" bgcolor="white">
		<tr bgcolor="yellow">
			<td colspan="9" align="center"><a href="writeForm_board.do"></a></td>
		</tr>
		<tr bgcolor="white">

			<th width="15%">지역번호</th>
			<th width="15%">장소</th>
			<th width="10%">리뷰수</th>
			<th width="10%">좋아요</th>
			<th width="20%">인기장소여부</th>
			<th width="10%">평점</th>
		</tr>
		<c:forEach items="${list}" var="bdto">
			<tr>
				<th width="15%">${bdto.ccr_num}</th>
				<th width="15%">${bdto.ccr_name }</th>
				<th width="10%">${bdto.ccr_likeCount}</th>
				<th width="20%">${bdto.ccr_popular}</th>
				<th width="10%">${bdto.ccr_score}</th>
		</c:forEach>
	</table>
         <nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${rowCount>0 }">
						<c:if test="${startPage>1}">
								<li class="page-item">
								<a class="page-link" onclick="location.href='board.region?region_num=${region_num}&pageNum=${startPage-1}'">
									Previous</a>
								</li> 
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li class="page-item">
							<a class="page-link" onclick="location.href='board.region?region_num=${region_num}&pageNum=${i}'">
									<c:out value="${i}" /></a>
							</li>						
 						</c:forEach>
						<c:if test="${endPage < pageCount }">
							<li class="page-item">
							<a class="page-link" onclick="location.href='board.region?region_num=${region_num}&pageNum=${endPage+1}'">
									Next</a>							
							</li>
						</c:if>
					</c:if>	
				</ul>
			</nav>
	<%@include file="../bottom.jsp"%>