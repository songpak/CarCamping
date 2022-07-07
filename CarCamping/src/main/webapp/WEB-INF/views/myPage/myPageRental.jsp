<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<style>
.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}
.list-group-item{
	border:0;
}

</style>  
<!-- Content Column Grid -->
<div class="container" align="center" class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
   <div class="row">
   </div>
   <div class="row" align="center">
      <div class="col">
         <p class="h2"><strong>대여 내역</strong></p>
      </div>
   <div class="row">
      <%-- <!-- 드랍 버튼 -->
         <div class="col" align="left">
            <div class="dropdown">
               <button class="btn btn-secondary dropdown-toggle" type="button"
                  id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
                  정렬</button>
               <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                  <li><button class="dropdown-item" type="button" onclick="location.href='myPageRental.myPage?page=${page}&sort=rental_pay'">최신순</button></li>
                  <li><button class="dropdown-item" type="button" onclick="location.href='myPageRental.myPage?page=${page}&sort=rental_price'">대여금</button></li>
                  
               </ul>
            </div>
         </div>
      <!-- 드랍 버튼 끝 --> --%>
         <div class="col" align="right">
            <!-- 포인트 적립 내역 -->
               <button type="button" class="btn btn-dark" style=" background:#091835;" data-bs-toggle="modal" data-bs-target="#exampleModal">
                 포인트 적립 내역
               </button>
               
               <!-- 포인트 적립 내역 모달 -->
               <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                 <div class="modal-dialog">
                   <div class="modal-content">
                     <div class="modal-header">
                       <h5 class="modal-title" id="exampleModalLabel">포인트 적립내역</h5>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <div class="modal-body" style="overflow:auto;">
                       <table class="table table-striped">
                        <tr>
                           <th>적립일시</th>
                           <th>적립내용</th>
                           <th>적립금</th>
                        </tr>
                        <c:forEach items="${listPointLog}" var="pdto">
                           <tr>
                              <td>${pdto.point_sysdate}</td>
                              <td>
                                 <c:if test="${pdto.point_reason==1}">
                                    첫 리뷰 작성
                                 </c:if>
                                 <c:if test="${pdto.point_reason==2}">
                                    리뷰 작성 승인
                                 </c:if>
                                 <c:if test="${pdto.point_reason==3}">
                                    인기글 리뷰 선정
                                 </c:if>
                                 <c:if test="${pdto.point_reason==5}">
                                    용품 대여 적립
                                 </c:if>
                              </td>
                              <td>${pdto.point_saving}</td>
                           </tr>
                        </c:forEach>
                     </table>
                     </div>
                     <div class="modal-footer">
                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     </div>
                   </div>
                 </div>
               </div>
         </div>
   </div>
   <div class="row">
      &nbsp;
   </div>
</div>
<<<<<<< HEAD
	
	<!-- 본문 -->
	<table class="table table-striped">
		<tr>
			<th>용품명</th>
			<th>대리점명</th>
			<th>대여기간</th>
			<th>대여금</th>
			<th>대여상태</th>
			
		</tr>
		 <c:forEach items="${cartList}" var="mdto">
		<tr>
			<td>${mdto.productDTO.prod_name}</td>
			<td>${mdto.agencyDTO.agency_name}</td>
			<td>${mdto.rental_from} ~ ${mdto.rental_to}</td>
			<td>${mdto.productDTO.prod_price}원</td>
			
			 
		</tr>
		</c:forEach>
		
	</table>

	<!-- 대여내역 보기 모달 -->
 <form class="row gy-2 gx-3 align-items-center">
	<div class="modal fade" id="staticBackdrop-11" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">대여내역</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				대리점 지역&이름
					<div class="row">
						<div class="col">
							<div class="form-floating">
								<select class="form-select" id="floatingSelect"
									aria-label="Floating label select example">
									<option selected>서울/경기도</option>
									<option value="1">강원도</option>
									<option value="2">충청북도</option>
									<option value="3">충청남도</option>
								</select> <label for="floatingSelect">지역</label>
							</div>
						</div>
						<div class="col">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">대리점명</label>
							</div>
						</div>
					</div>
					
				대리점 위치
						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">대리점 위치</label>
							</div>
						</div>
				
				대리점 전화번호
						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">대리점 전화번호 ('-'포함)</label>
							</div>
						</div>
						
				버튼 영역
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	<!-- 대여내역 보기 모달 끝 -->
	
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
=======
<script>
   function popup(a){
      var url = "myPageViewRentalLog.myPage?rental_num="+a
      var name = "대여 정보"
      var option = "width=600,height=800,top=100,left=200,location=no"
      window.open(url,name,option);
   }
</script>
   
   <!-- 본문 -->
   <table class="table table-striped">
      <tr>
         <th>용품명</th>
         <th>대리점명</th>
         <th>결제일시</th>
         <th>대여시작일</th>
         <th>대여종료일<th>
         <th>수량</th>
         <th>대여요금</th>
         <th>포인트사용요금</th>
         <th>반납상태</th>
         <th> </th>
      </tr>
       <c:forEach items="${cartList}" var="mdto">
      <tr>
         <td>${mdto.productDTO.prod_name}</td>
         <td>${mdto.agencyDTO.agency_name}</td>
         <td>${mdto.rental_pay}</td>
         <td>${mdto.rental_from}</td>
         <td>${mdto.rental_to}</td>
         <td>${mdto.rental_productCount}</td>
         <td>${mdto.productDTO.prod_price}원</td>
         <td>${mdto.rental_price}</td>
         <td>${mdto.rental_usePoint}</td>
         
         <c:if test="${mdto.rental_return==0}">
               <td>대기</td>
            </c:if>
            <c:if test="${mdto.rental_return==1}">
               <td>대여중</td>
            </c:if>
            <c:if test="${mdto.rental_return==2}">
               <td>반납완료</td>
            </c:if>
            <c:if test="${mdto.rental_return==3}">
               <td>연장중</td>
            </c:if>
            <c:if test="${mdto.rental_return==4}">
               <td>미납</td>
            </c:if>
            <td><button type="button" class="btn btn-dark" style="width: 100%; background:#091835;"
            onclick="location.href='javascript:popup(${mdto.rental_num})'">정보</button></td>
            
   
      </tr>
      </c:forEach>
      
   </table>
   
   <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
         <c:if test="${page-3>1}">
            <li class="page-item"><a class="page-link" href="adminRental.admin?page=${page-1}&sort=${sort}&search=${search}">Previous</a></li>
         </c:if>
      <c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
         <c:if test="${i==page}">
            <li class="page-item"><a class="page-link" href="adminRental.admin?page=${i}&sort=${sort}&search=${search}" style="color:blue;">${i}</a></li>
         </c:if>
         <c:if test="${i!=page}">
            <li class="page-item"><a class="page-link" href="adminRental.admin?page=${i}&sort=${sort}&search=${search}">${i}</a></li>
         </c:if>
      </c:forEach>
         <c:if test="${page+3<pageCount}">
            <li class="page-item"><a class="page-link" href="adminRental.admin?page=${page+1}&sort=${sort}&search=${search}">Next</a></li>
         </c:if>
      </ul>
   </nav>
   <br><br>
>>>>>>> 5ca2a6bba2e7ee9e942e9b80a7d5913d633300c9
</div>
<!-- End Content Coulmn Grid -->
<%@ include file="../bottom.jsp"%>