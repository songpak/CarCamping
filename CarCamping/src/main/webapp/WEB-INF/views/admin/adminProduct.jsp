<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="left.jsp"%>   
<!-- Content Column Grid -->
<div class="col-md-8 themed-grid-col">
	<div class="row" align="center">
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
		<p class="fw-bolder">차박 용품 목록</p>
	</div>
	<div class="row">
		<!-- 검색 버튼 -->
		<div class="col">
			<form name="search" action="adminProduct.admin" enctype="multipart/form-data" method="post">
				용품명 : 
				<input type="text" name="search">
				<input type="submit" value="검색">
			</form>
		</div>

		<div class="col" align="right">
			<!-- 용품 등록 버튼 -->
			<button type="button" class="btn btn-primary" onclick="location.href='javascript:popup()'">
			용품 등록</button>
			<!-- 용품 등록 버튼 끝 -->
		</div>
	</div>
	<script>
		function popup(){
			var url = "adminRegisterProduct.admin"
			var name = "용품 등록"
			var option = "width=470,height=700,top=100,left=200,location=no,resizable=no"
			window.open(url,name,option);
		}
		function view(a){
			var url = "adminViewProduct.admin?prod_num="+a
			var name = "용품 보기"
			var option = "width=470,height=700,top=100,left=200,location=no,resizable=no"
			window.open(url,name,option);
			}
	</script>
	
	&nbsp;
	<!-- 본문 -->
	<table class="table table-borderless">
		<tr>
			<c:set var="count" value="0"/>
			<c:forEach items="${adminListProduct}" var="dto">
			<td>
				<div class="card" style="width: 18rem;">
					<img src="${upPath}/images/product/${dto.prod_viewImage1}" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">${dto.prod_name}</h5>
						<p class="card-text">
					<div class="starpoint_wrap">
  						<div class="starpoint_box">
						   <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
						   <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
						   <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
						   <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
						   <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
						   <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
						   <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
						   <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
						   <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
						   <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
						   <input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_2" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_4" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_6" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_8" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_10" class="star_radio">
    						<span class="starpoint_bg">
    						</span>
  						</div>
					</div>
					<br>
							${dto.prod_summary} 
						</p>
						<button type="button" class="btn btn-success"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop-1"
							onclick="location.href='javascript:view(${dto.prod_num})'">
							보기</button>
					</div>
				</div>
			</td>
				<c:set var="count" value="${count+1}"/>
				<c:if test="${count%4==0}">
				</tr><tr>
				</c:if>
			</c:forEach>
		</tr>
	</table>

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

<!-- End Content Column Grid -->
<%@ include file="../bottom.jsp"%>