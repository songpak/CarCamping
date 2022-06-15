<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="left.jsp"%>
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
		<div class="col">
			<p class="fw-bolder">카테고리 목록</p>
		</div>
		<div class="row">
			<!-- 정렬&지역 드랍 버튼 -->
			<div class="col">
				<form name="sortCategory" method="post" action="adminCategory.admin">
					<select name="category">
							<option value="BrandCategory">브랜드</option>
							<option value="ProductCategory">상품</option>
					</select>
					<input type="submit" value="정렬">
				</form>
			</div>

			<!-- 카테고리 등록 버튼 -->
			<div class="col" align="right">
				<button type="button" class="btn btn-primary" onclick="location.href='javascript:popup()'">
				카테고리 등록</button>
			</div>
			<!-- 카테고리 버튼 끝 -->
		</div>
	</div>
	<script>
		function popup(){
			var url = "adminInsertCategory.admin"
			var name = "카테고리 등록"
			var option = "width=300,height=200,top=100,left=200,location=no"
			window.open(url,name,option);
		}
		function con_deleteBrand(a){
			var con2 = window.confirm('정말 삭제하시겠습니까?')
			if (con2){
				location.href="adminDeleteBrand.admin?brand_num="+a
			}
		}
		function con_deleteProduct(a){
			var con2 = window.confirm('정말 삭제하시겠습니까?')
			if (con2){
				location.href="adminDeleteProductCategory.admin?pc_num="+a
			}
		}
	</script>
	&nbsp;
	<!-- 본문 -->
	<div class="row">
		<div class="col">
			<table class="table table-striped" style="overflow:scroll">
				<tr>
					<th colspan="2">브랜드 카테고리</th>
				</tr>
				<tr>
					<th>카테고리명</th>
					<th>수정</th>
				</tr>
				<c:forEach items="${adminListBrand}" var="dto">
					<tr>
						<td>${dto.brand_name}</td>
						<td>
							<button type="button" class="btn btn-primary"
								onclick="location.href='javascript:con_deleteBrand(${dto.brand_num})'">
								삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col">
			<table class="table table-striped" style="overflow:scroll">
				<tr>
					<th colspan="2">용품 카테고리</th>
				</tr>
				<tr>
					<th>카테고리명</th>
					<th>수정</th>
				</tr>
				<c:forEach items="${adminListProductCategory}" var="dto">
					<tr>
						<td>${dto.pc_name}</td>
						<td>
							<button type="button" class="btn btn-primary"
								onclick="location.href='javascript:con_deleteProduct(${dto.pc_num})'">
								삭제</button>
						</td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>
</div>
<%@ include file="../bottom.jsp"%>