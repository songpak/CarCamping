<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <link href="resources/css/login.css" rel="stylesheet"/> 	
    
   	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="inner_login">
    <div class="login_tistory">

        <form method="post" id="authForm" action="https://www.tistory.com/auth/login">
            <input type="hidden" name="redirectUrl" value="https://blogpack.tistory.com/manage">
            <fieldset>
            <legend class="screen_out">�α��� ���� �Է���</legend>
            <div class="box_login">
                <div class="inp_text">
                <label for="loginId" class="screen_out">���̵�</label>
                <input type="email" id="loginId" name="loginId" placeholder="ID" >
                </div>
                <div class="inp_text">
                <label for="loginPw" class="screen_out">��й�ȣ</label>
                <input type="password" id="loginPw" name="password" placeholder="Password" >
                </div>
            </div>
            <button type="submit" class="btn_login"  disabled>�α���</button>
             <button type="submit" class="btn_login"  style="background-color: #575757;margin-top: 10px;" disabled>ȸ������</button>
            <div class="login_append">
                <div class="inp_chk"> <!-- üũ�� checked �߰� -->
                <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin">
                <label for="keepLogin" class="lab_g">
        <span class="img_top ico_check"></span>
        <span class="txt_lab">�α��� ���� ����</span>
        </label>
                </div>
                <span class="txt_find">
                <a href="findID.login" class="link_find">���̵�</a>
                    / 
                <a href="findPW.login" class="link_find">��й�ȣ ã��</a>
                </span>
            </div>
            
            </fieldset>
        </form>
        
    </div>
</div>
</body>
</html>