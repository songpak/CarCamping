   <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="TemplateMo">
<link
   href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
   rel="stylesheet">
   
<!-- 프로필 오프캔버스 -->
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

<title>WithCar HomePage</title>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="resources/css/fontawesome.css">
<link rel="stylesheet" href="resources/css/templatemo-edu-meeting.css">
<link rel="stylesheet" href="resources/css/owl.css">
<link rel="stylesheet" href="resources/css/lightbox.css">
<link rel="stylesheet" href="resources/css/map_region.css">

<!--바케성 0613 배너 css js-->

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<style>
.has-sub>.sub-menu>a{
background: transparent;
}
.has-sub>.sub-menu>li{
border :1px solid black;
}
.has-sub>.sub-menu{.
background: transparent;
padding-left: 0px;
}

</style>

</head>

<body>
   <!-- ***** Header Area Start ***** -->
   <header class="header-area header-sticky" style="background-color : #FFFFFF"><!-- 색깔 바꾸기 -->
      <div class="container" style="height: 90px";>   
         <div class="row" style="height: 90px";>
            <div class="col-12">
               <nav class="main-nav">
                  <!-- ***** Logo Start ***** -->
                  <a href="index.do" class="logo" style="height: 90px;"><img src="resources/images/withcar.png" style="width: 170px;height: 70px;"/></a>
                  <!-- ***** Logo End ***** -->
                  <!-- ***** Menu Start ***** -->
                  <ul class="nav">
                     <li ><a  href="index.do"><svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                       <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
                     </svg></a></li>
                     <c:if test="${empty mbdto}">   
                     <li><a href="login.login">로그인</a></li>
                     <li><a href="sign.login">회원가입</a></li>
                     </c:if>
                     <c:if test="${not empty mbdto}">
                     <li><a href="logout.login">로그아웃</a></li>
                     </c:if>
                     <li class="has-sub"><a href="javascript:void(0)">바로가기</a>
                        <ul class="sub-menu" >
                           <li><a href="goRegion.region"  style="background: transparent;">차박지 메인</a></li>
                           <li><a href="goProduct.product"  style="background: transparent;">용품 대여</a></li>
                        </ul></li>
                     <li class="has-sub"><a href="javascript:void(0)">리뷰쓰기</a>
                     <ul class="sub-menu" >
                           <li><a style="background: transparent; " onclick="location.href='field_review.review'">장소 리뷰</a></li>
                           <li><a style="background: transparent;" onclick="location.href='goods_review.review'">용품 리뷰</a></li>
                        </ul></li>
                     <li class="scroll-to-section">
                        <button class="btn btn-link" data-bs-toggle="offcanvas" href="#offcanvasExample" aria-controls="offcanvasExample"
                        style="background-color: #091835;  color: #ffffff; text-decoration: none;">
                           프로필
                        </button>
                     </li>
                            <div class="offcanvas offcanvas-start" tabindex="-1"
                        id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                        <div class="offcanvas-header">
                           <h5 class="offcanvas-title" id="offcanvasExampleLabel"><b><font color="green">내 메뉴</b></font></h5>
                           <button type="button" class="btn-close text-reset"
                              data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                           <div>
                                      <img src="sik.jpg" class="card-img rounded-circle"
                                  style="width: 150px; height: 150px" />
                              닉네임/프로필사진
                           </div>
                           <div class="list-group">
                              <a href="myPageProfile.myPage"
                                 class="list-group-item list-group-item-action list-group-item-light p-3">      
                                 <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                                 내 정보 </a> 
                              <a href="myPageWriteReview.myPage"
                                 class="list-group-item list-group-item-action list-group-item-light p-3">
                                 <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                                 내가 쓴 리뷰</a> 
                              <a href="myPageLikeReview.myPage?mem_num=${mem_num}"
                                 class="list-group-item list-group-item-action list-group-item-light p-3">
                                 <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                                 내가 좋아한 리뷰</a> 
                              <a href="myPageCart2.myPage"
                                 class="list-group-item list-group-item-action list-group-item-light p-3">
                                 <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                                 장바구니</a> 
                              <a href="myPageRental.myPage"
                                 class="list-group-item list-group-item-action list-group-item-light p-3">
                                 <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                                 대여내역</a>
                              <a href="myPageQuestion.myPage"
                                 class="list-group-item list-group-item-action list-group-item-light p-3">
                                 <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                                 문의하기</a>    
                           </div>
                        </div>
                     </div>
                  </ul>
                  <a class='menu-trigger'> <span>Menu</span>
                  </a>
                  <!-- ***** Menu End ***** -->
               </nav>
            </div>
         </div>
      </div>
   </header>
   
   
   <!-- ***** Header Area End ***** -->