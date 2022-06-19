<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
</head>
<body>
<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h3 class="card-title text-center"><font color="green"><b>Log in</b></font></h3>
            <form class="form-signin" method="post" action="login.login">
              <div class="form-label-group">
            <nobr>
         <c:if test="${empty cookie.saveId}">         
               <input type="checkbox" name="saveId">
         </c:if>
         <c:if test="${not empty cookie.saveId}">
               <input type="checkbox" name="saveId" checked>
         </c:if>               
               <font face="굴림" size="2">아이디 기억하기</font>
            </nobr>
            
              <c:if test="${empty cookie.saveId}">
                <input type="text" id="id" name="mem_id" class="form-control" placeholder="ID" required autofocus>
                 </c:if></div>
            <c:if test="${not empty cookie.saveId}">
            <input type="text" name="mem_id" tabindex="1" value="${cookie.saveId.value}">
         </c:if>            
         <div class="row">
         <p>
         <p>
         </div>
         
         
              <div class="form-label-group">
                <input type="password" id="pwd" name="mem_password" class="form-control" placeholder="Password" required>
              </div>
              
              <hr>
              
              <div class="form-label-group">
              <c:if test="${check == 1 }">
                <label>${message}</label>
              </c:if>
              </div>

              <button class="btn btn-lg btn-success btn-block text-uppercase" type="submit">로그인</button>
              <hr class="my-4">
             <a href="javascript:void(0)" onclick="findID()">아이디 찾기</a>/ 
              <a href="javascript:void(0)" onclick="findPW()">비밀번호 찾기</a>
              <button class="btn btn-lg btn-success btn-block text-uppercase" onclick="location='sign.login'">회원가입</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <script type="text/javascript">
  function findID(){
      var url="findID.login";
      
      window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=400");
   }
  
  function findPW(){
     var url="findPW.login";
     
     window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=400");
  }
  </script>