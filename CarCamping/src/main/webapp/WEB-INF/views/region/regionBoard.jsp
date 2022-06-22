<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>

<c:set var="region_num" value="${region_num}"/>


<form class="d-flex" action="goProduct.product" method="post">
<div align="center">
	<table border="1" width="800" bgcolor="white" style=" margin-left: 270px;">

		<tr>
			<td>
			<div class="btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #00205b; border-color: #00205b;">정렬</button>
						<ul class="dropdown-menu" style="margin-right: 13px;">
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li><a class="dropdown-item"
								href="board.region?region_num=${region_num}&mode=listRegionReviewCount&pageNum=1">
								리뷰순</a></li>
							<li><a class="dropdown-item"
								href="board.region?region_num=${region_num}&mode=listRegionLikeCount&pageNum=1">
								좋아요순</a></li>  
							<li><a class="dropdown-item"
								href="board.region?region_num=${region_num}&mode=listRegionscore&pageNum=1">
								별점순</a></li>
								</c:forEach>
							</ul>
				</div>
			</td>
					
			<td>	
			<select name="search2">
				<option>제목</option>
				<option>내용</option>
			</select>
			</td>
			<td>
				<input class="form-control me-2" type="text" name="searchString2" placeholder="검색" aria-label="Search2"> 
			</td>
			<td>
				<input type="submit" value="검색" style="padding-left: 0px; padding-right: 0px; width: 62px;">
			</td>
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
				<th width="15%">${bdto.ccr_reviewCount}</th>
				<th width="10%">${bdto.ccr_likeCount}</th>
				<th width="20%">${bdto.ccr_popular}</th>
				<th width="10%">${bdto.ccr_score}</th>
		</c:forEach>
	</table>
	</div>
	</form>
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