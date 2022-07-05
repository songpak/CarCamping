<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
   crossorigin="anonymous"></script>
<!-- CSS only -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
   href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<link rel="stylesheet" href="resources/css/dropdown.css">
<style type="text/css">
.swiper-container {
   height: 420px;
   border: 5px solid silver; 
   border-radius: 7px;
   box-shadow: 0 0 20px #ccc inset;
}
.swiper-slide {
   text-align: center;
   display: flex;
   align-items: center;
   justify-content: center;
}
.swiper-slide img {
   box-shadow: 0 0 5px #555;
   max-width: 100%;
}
.d-flex .card {
   margin-right: 20px;
}


</style>

<i class="fa-brands fa-searchengin"></i>
<!-- 클래스명은 변경하면 안 됨 -->

<div id="doc" class="gm-t7">
   <div class="gm-b">
      <div id="secondary">
         <div id="leftcolumn">
            <!-- 중앙 정렬을 위해서 d-flex justify-content-center는 지우면 안됩니다 !! -->
            
         </div>

<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style=" margin-left: 255px;margin-right: 255px;"">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/images/banner1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/images/banner2.JPG" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/images/banner_2.PNG" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>            <!-- 이전 버튼 -->
            <!-- 페이징 -->
            <div class="swiper-pagination"></div>
         </div>

        


               <nav class="navbar navbar-expand-lg "Eighthnavbarexample" 
               style="margin-bottom: 0px;background-color: #fff;border-left-width: 100px;margin-left: 213px;margin-right: 213px;margin-top: 10px;">
           

               <div class="container">
                  <a class="navbar-brand text-dark" style="margin-right:570px;"><span>전 체 용 품 목 록</span> </a>
               <!-- 검색 form  #091835-->
               <div class="d-flex" style="width: 500px; height: 40px;">
                  <button type="button" class="btn btn-dark"
                     style="width: 150px; height: 40px; font-size: revert; margin-right: 10px;"
                     onclick="location.href ='goProduct.product'">전체보기</button>
                  <!-- 검색 form -->
                  <form class="d-flex" action="goProduct.product"
                     style="width: 500px; height: 40px;" method="get">
                     <select class="form-control" name="search">
                        <option value="prod_name">용품명</option>
                        <option value="brand_name">브랜드명</option>
                     </select> <input class="form-control" class="form-control me-2" type="text" name="searchString"
                        placeholder="인기용품을 검색해보세요!" aria-label="Search"
                        style="margin-left: 8px;"> <button type="submit" class="btn btn-dark"
                       style="padding-left: 0px; padding-right: 0px; width: 122px;">검색</button>
                     <div class="btn btn-primary dropdown-toggle">

                        <ul class="dropdown-menu">
                          <li><a class="dropdown-item" href="goProduct.product?search=${search}&searchString=${searchString}&mode=listProductNew">최신순 </a></li>
                           <li><a class="dropdown-item"
                              href="goProduct.product?search=${search}&searchString=${searchString }&mode=listProductPop">인기순</a></li>
                          <li> <a class="dropdown-item"
                              href="goProduct.product?search=${search}&searchString=${searchString }&mode=listProductPrice">가격순</a></li>
                        </ul>
                     </div>
                    
                  </form>
				</div>
				         <hr style="border: 0;height: 2px;background-color: #585858d4;">
               </div>
               
         </nav>

          </div>
 
         <c:set var="i" value="0" />
         <c:set var="j" value="4" />
         <table align="center"
            style="border: 1px solid;border-left-width: 0px;border-color: transparent;">
            <c:forEach items="${listProduct}" var="pdto">
               <c:if test="${i%j == 0 }">
                  <tr>
               </c:if>
               <td>
                  <div class="card"
                     style="width: 18rem; margin-right: 30px; margin-bottom: 50px;">
                     <a href="productView.product?prod_num=${pdto.prod_num}"><img
                        src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${pdto.prod_viewImage1}" width="286" height="200"
                        ></a>
                     <div class="card-body">
                        <p class="card-text">

                           <b>${pdto.prod_name}</b><br /> 
                           브랜드 :${pdto.brandCategoryDTO.brand_name}<br /> 
                           평점 :${pdto.prod_reviewScore }<br /> 
                           

                        </p>
                        <br>
                        <p class="card-text">가격 :${pdto.prod_price}</p>
                     </div>
                  </div>
               </td>
               <c:if test="${i%j == j-1 }">
                  </tr>
               </c:if>
               <c:set var="i" value="${i+1 }" />
            </c:forEach>
            <c:if test="${empty listProduct}">
               <div class="card" style="width: 20rem;">
                  <h4>등록된 상품이 없습니다!</h4>
                  <br>
                  <div class="card-body">
                     <p class="card-text">다시 검색해 주세요!</p>
                  </div>
               </div>
            </c:if>
         </table>
      </div>
   </div>
</div>


<nav aria-label="Page navigation example">
   <ul class="pagination justify-content-center">
      <c:if test="${rowCount>0 }">
         <c:if test="${startPage>1}">
            <li class="page-item"><a class="page-link"
               onclick="location.href='goProduct.product?&pageNum=${startPage-1}&mode=${mode}'">
                  Previous</a></li>
         </c:if>
         <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <!-- 1 2  -->
            <li class="page-item"><a class="page-link"
               onclick="location.href='goProduct.product?&pageNum=${i}&mode=${mode}'">
                  <c:out value="${i}" />
            </a></li>
         </c:forEach>
         <c:if test="${endPage < pageCount }">
            <li class="page-item"><a class="page-link"
               onclick="location.href='goProduct.product?&pageNum=${endPage+1}&mode=${mode}'">
                  Next</a></li>
         </c:if>
      </c:if>
   </ul>
</nav>

<%@ include file="../bottom.jsp"%>