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
<form action="pw_new.me" method="POST" class="content" id="contact"> 
	<div class="textbox">
		<input id="pw" name="pw" type="password"><label>새비밀번호</label>
		<div class="error">
 				Invalid password
		</div> 
	</div>
	<div class="textbox">
		<input id="pw2" type="password" onchange="isSame();"><label>새비밀번호 확인</label>
		<div class="error">
				Invalid password
		</div>
	</div>
	<span id=same></span>
	<br><br>
	<input type="submit" id="check" value="비밀번호변경">
	<input type="hidden" name="mem_email" value="${mem_email}">
</form>
</body>
</html>