<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html lang="ko">
  	<head>
  		<meta charset="utf-8">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<title>Indigo</title>
  
<body>
<form action="pw_set.login" method="post" id="contact">
	<input type="hidden" name ="num" value="${num }">
		<div class=content >
			<div class="textbox">
			<input type="text" name="email_injeung" placeholder="인증번호를 입력하세요"><label>인증번호 </label>
			<div class="error"> </div>
		</div><br><br>
			<input type="submit" id="check" value="확인">
			</div>
</form>
</body>
</html>