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

<!-- 클래스명은 변경하면 안 됨 -->

<div id="doc" class="gm-t7">
   <div class="gm-b">
      <div id="secondary">
         <div id="leftcolumn">
            <!-- 중앙 정렬을 위해서 d-flex justify-content-center는 지우면 안됩니다 !! -->
            <nav class="navbar d-flex justify-content-center"
               style="margin-bottom: 5px;">
               <h2>🔥 인기 용품을 지금 바로 만나보세요 🔥</h2>
            </nav>


         </div>
         <div class="swiper-container">
            <div class="swiper-wrapper">
               <c:forEach items="${popList}" var="proddto">
                  <div class="swiper-slide">
                     <a href="productView.product?prod_num=${proddto.prod_num}"> 
                     <img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${proddto.prod_viewImage1}"> <br> ${proddto.prod_name}
                     </a>
                     
                  </div>
               </c:forEach>


            </div>
            <!-- 네비게이션 -->
            <div class="swiper-button-next"></div>
            <!-- 다음 버튼 (오른쪽에 있는 버튼) -->
            <div class="swiper-button-prev"></div>
            <!-- 이전 버튼 -->
            <!-- 페이징 -->
            <div class="swiper-pagination"></div>
         </div>

         <script>
            new Swiper('.swiper-container', {

               slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
               spaceBetween : 30, // 슬라이드간 간격
               slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

               // 그룹수가 맞지 않을 경우 빈칸으로 메우기
               // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
               loopFillGroupWithBlank : true,

               loop : true, // 무한 반복

               pagination : { // 페이징
                  el : '.swiper-pagination',
                  clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
               },
               navigation : { // 네비게이션
                  nextEl : '.swiper-button-next', // 다음 버튼 클래스명
                  prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
               },
            });
         </script>

         <nav class="navbar bg-light rounded-pill"
            style="margin-top: 20px; margin-bottom: 10px;">
            <div class="container-fluid">
               <h1 class="navbar-brand">용품 </h1>
              <!-- 검색 form  #091835-->   
               <form class="d-flex" action="goProduct.product" style="width: 600px; height: 40px;" method="get">
               <button type="button"  style="width: 130px; height: 40px; font-size: revert; "onclick = "location.href ='goProduct.product'">전체보기</button>      
               <h1 class="navbar-brand">
                  			인 기 용 품
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                     fill="currentColor" class="bi bi-hand-thumbs-up"
                     viewBox="0 0 16 16">
  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
</svg> 
               </h1>
               <!-- 검색 form -->
                <button type="button"  style="width: 100px; height: 40px;"onclick = "location.href ='goProduct.product'">전체보기</button>
               <form class="d-flex" action="goProduct.product" style="width: 500px; height: 40px;" method="get">
                  <select name="search">
                     <option value="prod_name">용품명</option>
                     <option value="brand_name">브랜드명</option>
                  </select> <input class="form-control me-2" type="text" name="searchString" placeholder="인기용품을 검색해보세요!" aria-label="Search">
                      <input type="submit" value="검색" style="padding-left: 0px;padding-right: 0px;width: 122px;">
                  <div class="dropdown">
                     <button type="button" class="dropbtn" data-bs-toggle="dropdown"
                        aria-expanded="false" style="width: 66px; height: 40px;">정렬</button>
                     <div class="dropdown-content">
                        <a
                           href="goProduct.product?search=${search}&searchString=${searchString}&mode=listProductNew">최신순</a>
                        <a
                           href="goProduct.product?search=${search}&searchString=${searchString }&mode=listProductPop">인기순</a>
                        <a
                           href="goProduct.product?search=${search}&searchString=${searchString }&mode=listProductPrice">가격순</a>
                     </div>
                  </div>
               </form>
            </div>
         </nav>

         <c:set var="i" value="0" />
         <c:set var="j" value="4" />
         <table align="center" style="border: 1px solid;border-left-width: 100px; border-color: transparent;">
            <c:forEach items="${listProduct}" var="pdto">
               <c:if test="${i%j == 0 }">
                  <tr>
               </c:if>
               <td>
                  <div class="card" style="width: 18rem;margin-right: 100px;margin-bottom: 50px;">
                     <a href="productView.product?prod_num=${pdto.prod_num}"><img
                        src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${pdto.prod_viewImage1}"></a>
                     <div class="card-body">
                        <p class="card-text">

			                           용품명 :${pdto.prod_name}<br/>
			                           브랜드명 :${pdto.brandCategoryDTO.brand_name}<br/>
			                           평점 : ${pdto.prod_reviewScore }

			                           용품명 :${pdto.prod_name}<br>
			                            브랜드명 :${pdto.brandCategoryDTO.brand_name}

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
                        <li class="page-item">
                        <a class="page-link" onclick="location.href='goProduct.product?&pageNum=${startPage-1}&mode=${mode}'">
                           Previous</a>
                        </li> 
                  </c:if>
                  <c:forEach var="i" begin="${startPage}" end="${endPage}"><!-- 1 2  -->
                     <li class="page-item">
                     <a class="page-link" onclick="location.href='goProduct.product?&pageNum=${i}&mode=${mode}'">
                           <c:out value="${i}" /></a>
                     </li>                  
                   </c:forEach>
                  <c:if test="${endPage < pageCount }">
                     <li class="page-item">
                     <a class="page-link" onclick="location.href='goProduct.product?&pageNum=${endPage+1}&mode=${mode}'">
                           Next</a>                     
                     </li>
                  </c:if>
               </c:if>   
            </ul>
         </nav> 

<%@ include file="../bottom.jsp"%>