<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<%@ include file="../top.jsp" %>
<head>
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="col-sm-2"></div>
                <div class="col-sm-9">

                    <h2 class="text-center">정보 수정</h2>
                     
                    <form action="myPageProfile.myPage" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="mem_num" value="${getMember.mem_num}"/>
                     

                
                    <h2 class="text-center">정보 상세</h2>
                    <form action="myPageProfileEdit.mypage" method="post">

                    <h2 class="text-center">정보 수정</h2>
                     
                    <form name="f" action="myPageProfile.myPage" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="mem_num" value="${getMember.mem_num}"/>
                     

                    <table class="table table-striped">
                   
                      <tr>
                        <td>이름</td>
                        <td><input type="text" name="mem_userName" class="box" 
														value="${getMember.mem_userName}" class="form-control" disabled></td>
                      </tr>
                       <tr>
                        <td>아이디</td>

                        <td><input type="text" name="mem_id" class="box" value="${getMember.mem_id}" class="form-control" disabled></td>

                        <c:forEach items="${getMember}" var="mdto">
                        <td>${mdto.mem_id}</td>
                        </c:forEach>

                        <td><input type="text" name="mem_id" class="box" value="${getMember.mem_id}" class="form-control" disabled></td>

                      </tr>
                           
                      <tr>
                        <td>이메일</td>
                        <td>
                        <input type="text" value="${getMember.mem_email}" name="mem_email" class="form-control" disabled>
                        </td>
                      </tr>
                       <tr>
                        <td>프로필 사진</td>
                        <td>
                        <img src="${uploadPath}/${getMember.mem_image}" width="150" height="150">
							<input type="file" name="mem_image">
							<input type="hidden" name="mem_image2" value="${getMember.mem_image}">
                        </td>
                      </tr>
                      <tr>
                        <td>전화번호</td>
                        <td>
                        <input type="text" value="${getMember.mem_phone}" name="mem_phone" class="form-control">
                        </td>
                      </tr>
                      <tr>
                        <td>생년월일</td>
                        <td>
                        <input type="text" value="${getMember.mem_birthday}" name="mem_birthday" class="form-control">
                        </td>
                      </tr>
                     
                      <tr>
                        <td>성별</td>
                        <td>

						<input type="radio" name="mem_gender" value="0" ${getMember.mem_gender.equals("0") ? "checked":""}/> 남자
						<input type="radio" name="mem_gender" value="0" ${getMember.mem_gender.equals("1") ? "checked":""}/> 여자

                        <input type="text" value="${getMember.mem_gender}" name="mem_gender" class="form-control">

                        </td>
                      </tr>
                      
                    	<tr>
                        <td>관심지역</td>
                        <td>
                   
                        <select name="region_num">


						<c:forTokens items="서울/경기도,강원도,충청북도,충청남도,전라북도,전라남도,경상북도,경상남도,제주도" delims="," var="region_num">

						<c:if test="${region_num == getProduct.region_num}">
							<option value="${region_num}" selected>${fn:toUpperCase(region_num)}</option>
						</c:if> 
						<c:if test="${region_num != getProduct.region_num}">
						<option value="${region_num}">${fn:toUpperCase(region_num)}</option>
							</c:if>
						</c:forTokens>
						</select>	
                        </td>
                      </tr>
                      
                      <tr>
                        <td>회원 포인트</td>
                        <td>
                        <input type="text" value="${getMember.mem_point}" name="mem_point" class="form-control" disabled>
                        </td>
                      </tr>
                      <tr>
                        <td>자기소개 요약</td>
                        <td>
                        <input type="text" value="${getMember.mem_summary}" name="mem_summary" class="form-control">
                        </td>
                      </tr>
                      <tr>
                        <td>자기소개</td>
                        <td>
                        <input type="text" value="${getMember.mem_introduce}" name="mem_introduce" class="form-control">
                        </td>
                      </tr>
                       <tr>
                        <td>이메일 수신 여부</td>
                        <td>
                           <div class="col-lg-10">
                        <label class="radio-inline">

                            <input type="radio" id="mem_accept_email" name="mem_accept_email" value="0" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_email" name="mem_accept_email" value="1"> 동의하지 않습니다.

                        </label>
                    </div>

                        </td>
                      </tr>
                      
                      <tr>
                        <td>문자 수신 여부</td>
                        <td>
                             <div class="col-lg-10">
                        <label class="radio-inline">

                            <input type="radio" id="mem_accept_phone" name="mem_accept_phone" value="0" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_phone" name="mem_accept_phone" value="1"> 동의하지 않습니다.
                            
                        </label>
                    </div>
                        </td>
                      </tr>
                      
                       <tr>
                        <td>정보 공개 여부</td>
                        <td>
                        <div class="col-lg-10">
                        <label class="radio-inline">

                            <input type="radio" id="mem_accept_privacy" name="mem_accept_privacy" value="0" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_privacy" name="mem_accept_privacy" value="1"> 동의하지 않습니다.
                        </label>
                    </div>
                        </td>
                      </tr>
                       
                      <tr>
                        <td>패스워드</td>
                        <td>

                        <input type="text" value="${getMember.mem_password}" name="mem_password" class="form-control">

                        <input type="password" value="${getMember.mem_password}" name="mem_password" class="form-control">

                        </td>
                      </tr>

                    <tr>
                        <td colspan="2" class="text-center">
                         <input type="submit" value="수정" class="btn btn-success">
                         </td>    
                    </tr>
                           
                    </table>
                </form>   
                </div>
        </div>
    </div>
</div>
</body>
 <%@ include file="../bottom.jsp" %>
</html>