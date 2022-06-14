<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                     
                    <form action="MemberUpdateProc.jsp" method="post">
                     
                    <table class="table table-striped">
                      <tr>
                        <td>이름</td>
                        <td>""</td>
                      </tr>
                      
                       <tr>
                        <td>아이디</td>
                        <td>""</td>
                      </tr>
                          
                      <tr>
                        <td>이메일</td>
                        <td>
                        <input type="email" value="" name="email" class="form-control">
                        </td>
                      </tr>
                       
                      <tr>
                        <td>생년월일</td>
                        <td>
                        <input type="tel" value="" name="tel" class="form-control">
                        </td>
                      </tr>
                     
                      <tr>
                        <td>성별</td>
                        <td>
                        <input type="tel" value="" name="tel" class="form-control">
                        </td>
                      </tr>
                      
                      <tr>
                        <td>관심지역</td>
                        <td>
                        <input type="tel" value="" name="tel" class="form-control">
                        </td>
                      </tr>
                      
                      <tr>
                        <td>회원 포인트</td>
                        <td>
                        <input type="tel" value="" name="tel" class="form-control">
                        </td>
                      </tr>
                      
                       <tr>
                        <td>회원 등록일</td>
                        <td>
                        <input type="tel" value="" name="tel" class="form-control">
                        </td>
                      </tr>
                      
                      <tr>
                        <td>자기소개</td>
                        <td>
                        <input type="tel" value="" name="tel" class="form-control">
                        </td>
                      </tr>
                      
                       <tr>
                        <td>이메일 수신 여부</td>
                        <td>
                           <div class="col-lg-10">
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_phone" name="smsReceiveYn" value="Y" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_phone" name="smsReceiveYn" value="N"> 동의하지 않습니다.
                        </label>
                    </div>

                        </td>
                      </tr>
                      
                      <tr>
                        <td>문자 수신 여부</td>
                        <td>
                             <div class="col-lg-10">
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_phone" name="smsReceiveYn" value="Y" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_phone" name="smsReceiveYn" value="N"> 동의하지 않습니다.
                        </label>
                    </div>
                        </td>
                      </tr>
                      
                       <tr>
                        <td>정보 공개 여부</td>
                        <td>
                        <div class="col-lg-10">
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_phone" name="smsReceiveYn" value="Y" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_phone" name="smsReceiveYn" value="N"> 동의하지 않습니다.
                        </label>
                    </div>
                        </td>
                      </tr>
                       
                      <tr>
                        <td>패스워드</td>
                        <td>
                        <input type="password" value="" name="pass1" class="form-control">
                        </td>
                      </tr>

                    <tr>
                        <td colspan="2" class="text-center">
                         <input type="hidden" name="id" value="">
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