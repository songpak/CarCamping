<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>

<c:set var="region_num" value="${region_num}"/>

<style>
form{

    padding-right: 12%;
    padding-left: 12%;

}
form > table {
 display : contents;
 text-align : center;
}

tr.regionRow:hover { background-color: #00205b75; }
</style>
<div style="display: flex; float: right;">
		<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #00205b; border-color: #00205b;">정렬</button>
				<ul class="dropdown-menu" style="margin-right: 13px;">
					<li><a class="dropdown-item" href="board.region?region_num=${region_num}&mode=listRegionReviewCount&pageNum=1">리뷰순</a></li>
					<li><a class="dropdown-item" href="board.region?region_num=${region_num}&mode=listRegionLikeCount&pageNum=1">좋아요순</a></li>  
					<li><a class="dropdown-item" href="board.region?region_num=${region_num}&mode=listRegionscore&pageNum=1">별점순</a></li>
				</ul>
		</div>
		<select name="search2">
			<option>제목</option>
		</select>
		<input class="form-control me-2" type="text" name="searchString2" placeholder="검색" aria-label="Search2" style="width:900px;"> 
		<input type="submit" value="검색" style="padding-left: 0px; padding-right: 0px; width: 62px;">		
</div>


	<table  class="table table-striped-columns" width="800" bgcolor="white"  style="text-align: center;">
		<tr bgcolor="white">
			<th width="15%">장소</th>
			<th width="15%">요약설명</th>
			<th width="10%">리뷰수</th>
			<th width="10%">좋아요</th>
			<th width="20%">인기장소여부</th>
			<th width="10%">평점</th>
		</tr>  
		<c:forEach items="${list}" var="bdto">
			<tr onclick="location.href='regionView.region?ccr_num=${bdto.ccr_num}'" class="regionRow" > 
				<th width="15%">${bdto.ccr_name}</th>
				<th width="15%">${bdto.ccr_summary }</th>
				<th width="15%">${bdto.ccr_reviewCount}</th>
				<th width="10%">${bdto.ccr_likeCount}</th>
				<c:if test="${ bdto.ccr_popular == 0}">
				 	<th width="20%">인기장소🔥</th>
				</c:if>
				<c:if test="${ bdto.ccr_popular ==1}">
				 	<th width="20%">일반장소</th>
				</c:if>
				<th width="10%">${bdto.ccr_score}</th>
		</c:forEach>
	</table>
	

         <nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${rowCount>0 }">
						<c:if test="${startPage>1}">
								<li class="page-item">
								<a class="page-link" onclick="location.href='board.region?region_num=${region_num}&pageNum=${startPage-1}&mode=${mode }'">
									Previous</a>
								</li> 
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li class="page-item">
							<a class="page-link" onclick="location.href='board.region?region_num=${region_num}&pageNum=${i}&mode=${mode}'">
									<c:out value="${i}" /></a>
							</li>						
 						</c:forEach>
						<c:if test="${endPage < pageCount }">
							<li class="page-item">
							<a class="page-link" onclick="location.href='board.region?region_num=${region_num}&pageNum=${endPage+1}&mode=${mode }'">
									Next</a>							
							</li>
						</c:if>
					</c:if>	
				</ul>
			</nav>
	<%@include file="../bottom.jsp"%>