<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function fn_account(val){
   window.open("<c:url value='productReviewView.product?rp_num="+val+"'/>",  
            "soyoInfoPop" ,"height=1000,width=700,top=100,left=200,scrollbars=yes,resizable=yes");
}
      function popup1() {
         var url = "myPageContactUs.myPage";
         var name = "popup test";
         var option = "width = 600, height = 500, top = 100, left = 200, location = no"
         window.open(url, name, option);
      }
    </script>
<!-- 부트스트랩 영역 -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
   crossorigin="anonymous">

<!-- <script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
   crossorigin="anonymous"></script> -->

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

<link rel="stylesheet"
   href="https://unpkg.com/flickity@2/dist/flickity.min.css">

<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<!-- 부트스트랩 영역 끝 -->

<!-- 용품상세보기 영역 -->
<div class="container-fluid themed-container"
   style="margin-top: 40px; margin-left: 10%;">
   <!-- Row Grid -->
   <div class="row mb-3">
      <!-- List Column Grid -->
      <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
         style="width: 280px; height: 1000px;">
         <a href="/"
            class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
            <svg class="bi me-2" width="40" height="32">
               <use xlink:href="#bootstrap"></use></svg> <span class="fs-4">용품
               상세정보</span>
         </a>

         <!-- 이미지 영역 -->
         <div align="center">
            <h4>
               <img src="${getProduct.prod_viewImage1}" />
            </h4> <br>
               상품명 : ${getProduct.prod_name }<br>
               일일대여 요금 : ${getProduct.prod_price }원<br><br>
               -용품 요약설명-<br> ${getProduct.prod_summary }
         </div>
         <!-- 이미지 영역 끝 -->
<style>
.search-box {
   width: fit-content;
   background-color: 262626;
   border-radius: 8px;
   padding: 25px;
   box-shadow: 0 2px 8px rgb(0 0 0/ 20%);
   box-sizing: border-box;
   margin: 0 auto;
}

.search-box input {
   border-radius: 5px;
   border: 1px solid #1f244d;
   line-height: 40px;
}

.search-box input[type="text"], .search-box input[type="date"] {
   text-indent: 5px;
}

.search-box>div {
   margin-right: 10px;
   font-size: 13px;
}
</style>

         <!-- 여기서는 날짜 보내주기만 하고 저장은 구매할때 저장 -->
         <form name="f_lent" action="myPageCart.myPage" method="post">
            <input type="hidden" name="prod_num" value="${getProduct.prod_num}">
            <c:if test="${not empty mem_num}">
               <input type="hidden" name="mem_num" value="${mem_num}">
            </c:if>
            <c:if test="${empty mem_num}">
               <input type="hidden" name="mem_num" value="0">
            </c:if>
            <div style="width: 100%; padding: 50px 0; background: 262626;">

               <div class="row search-box">
                  <div style="margin-bottom: 10px;">
                     빌린날짜 <input type="date" id="indate1" name="cart_from">
                  </div>
                  <div>
                     반납날짜 <input type="date" id="outdate1" name="cart_to">
                  </div>
                  <br>
                  <div align="center">
                     빌릴 갯수 입력 <input type="number" name="cart_prodCount" "
                        value="1" pattern="[0-9]+" min="1" max="10">
                  </div>
                  <br>
                  
                  <div>
                  대리점 선택
                  <select name="agency_num">
                  <c:forEach items="${getAgency}" var="dto">
                     <option value="${dto.agency_num}">${dto.agency_name}</option>
                     </c:forEach>
                  </select>
                  
                     </div>
                  <br>
                  <div>

                     <!-- ---------------수정할 사항-------------------------- -->
                     <!--  <button style="background-color: #0D6EFD; color: white;"
                        onclick="location.href='javascript:dateCheck()'">대여하기</button>-->
                      <input type="submit" value="대여하기"  style="background-color: #0D6EFD; color: white;">
                     <input type="button" style="background-color: #0D6EFD; color: white;"
                        onclick="location.href='javascript:popup1()'" value="문의하기" >
                  </div>
               </div>

            </div>
         </form>
         <!-- ---------------수정할 사항-------------------------- -->

      </div>
      <!-- 용품 상세보기 영역 끝 -->

      <div class="col-md-8 themed-grid-col">
         <div class="row" align="center">
            <div class="row"></div>
            <h1>용품 리뷰 목록</h1>
            <form name="f" method="post">
               <select name="search">
                  <option selected value="rp_title">리뷰 제목</option>
                  <option value="rp_content">리뷰 내용</option>
               </select> <input type="text" name="searchString">
               <button type="submit">검색하기</button>
            </form>
         </div>
         <div class="row" align="center"
            >

            <!-- 정렬 기능 -->

            <!-- 정렬기능 끝 -->

            <br>
            <!-- 본문 -->
            <c:if test="${empty listBoard}">
               <table class="table table-borderless" >
               <tr>
               <td></td>
               </tr>
                  <tr align = "center">
                     <th >
                        <h1>아직 등록된 리뷰가 없어요!</h1>
                     </th>
                  </tr>
               </table>
            </c:if>
            <table class="table table-borderless">
               <tr>
                  <c:set var="count" value="0" />
                  <c:forEach items="${listBoard}" var="pdto">
                     <td>
                        <div class="card" style="width: 18rem;">
                           <!-- 리뷰리스트 이미지 영역 -->
                           <img src="${pdto.rp_image1}">
                           <!-- 리뷰리스트 이미지 영역 끝 -->
                           <div class="card-body">
                              <h5 class="card-title">${pdto.rp_title}</h5>
                              <p class="card-text">
                                 <label for="disabledRange" class="form-label">평점 :
                                    ${pdto.rp_score}</label> <br>
                                 별점 :    
                                       <c:choose>
                         <c:when test="${pdto.rp_score >= 1 && pdto.rp_score < 2 }">
                                   <label for="rate1">⭐</label>
                         </c:when>
                         <c:when test="${pdto.rp_score >= 2 && pdto.rp_score < 3 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                         </c:when>
                         <c:when test="${pdto.rp_score >= 3 && pdto.rp_score < 4 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                                <label for="rate3">⭐</label>
                         </c:when>
                         <c:when test="${pdto.rp_score >= 4 && pdto.rp_score < 5 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                                <label for="rate3">⭐</label>
                                 <label for="rate4">⭐</label>
                         </c:when>
                         <c:when test="${pdto.rp_score eq 5 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                                <label for="rate3">⭐</label>
                                 <label for="rate4">⭐</label>
                                 <label for="rate5">⭐</label> 
                         </c:when>
                         <c:otherwise>
                          ☆☆☆☆☆
                         </c:otherwise>
                        </c:choose> <br>
                                    <!-- 이부분 별점으로 수정 -->
                                    
                                     조회수 :
                                 ${pdto.rp_readCount}&nbsp;&nbsp; | &nbsp;&nbsp;좋아요 :
                                 ${pdto.rp_likeCount}<br>작성일 : ${pdto.rp_sysdate}
                              </p>
                              <button type="submit"
                                 style="background-color: #0D6EFD; color: white;"
                                 onclick="fn_account(${pdto.rp_num}); return false;">내용</button>
                           </div>
                        </div>
                     </td>
                     <c:set var="count" value="${count+1 }" />
                     <c:if test="${count%3==0 }">
               </tr>
               <tr>
                  </c:if>
                  </c:forEach>
               </tr>
            </table>
         </div>
      </div>
   </div>
</div>
 <div class="col-xs-6 col-xs-offset-3"> 
   <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
         <c:if test="${page-3>1}">
            <li class="page-item"><a class="page-link" href="productView.product?page=${page-1}&prod_num=${getProduct.prod_num}">Previous</a></li>
         </c:if>
      <c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
         <c:if test="${i==page}">
            <li class="page-item"><a class="page-link" href="productView.product?page=${i}&prod_num=${getProduct.prod_num}" style="color:blue;">${i}</a></li>
         </c:if>
         <c:if test="${i!=page}">
            <li class="page-item"><a class="page-link" href="productView.product?page=${i}&prod_num=${getProduct.prod_num}">${i}</a></li>
         </c:if>
      </c:forEach>
         <c:if test="${page+3<pageCount}">
            <li class="page-item"><a class="page-link" href="productView.product?page=${page+1}&prod_num=${getProduct.prod_num}">Next</a></li>
         </c:if>
      </ul>
   </nav>
</div>
</div>


<%@include file="../bottom.jsp"%>