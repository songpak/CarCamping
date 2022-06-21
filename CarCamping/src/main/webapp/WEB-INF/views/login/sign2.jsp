<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<<<<<<< HEAD:CarCamping/src/main/webapp/WEB-INF/views/login/sign2.jsp
=======
>>>>>>> 혜성(리뷰)
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <!-- Bootstrap -->
<<<<<<< HEAD
=======
<<<<<<<< HEAD:CarCamping/src/main/webapp/WEB-INF/views/login/sign.jsp
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
========
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>>>>>>>> 정민(로그인):CarCamping (12)/src/main/webapp/WEB-INF/views/login/sign2.jsp
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD

<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>

=======
>>>>>>> 신웅(장소)
<script type="text/javascript">
var right = 0;
function regChk(){
   var signCheck = document.signCheck;
<<<<<<< HEAD
   
=======
   var signCheck = document.signCheck;
   var mem_id = document.signCheck.mem_id.value;
   var regx = /^[a-zA-Z0-9]*$/;
>>>>>>> 신웅(장소)
   if(signCheck.agree.checked==""){
         alert("약관에 동의해주시기 바랍니다.");
         return false;
      }
<<<<<<< HEAD
   if (signCheck.mem_summary.value==""){
		alert("자기소개 요약을 입력하셔야 합니다.")
		signCheck.mem_summary.focus() 
		return false;
	}
   if (signCheck.mem_introduce.value==""){
		alert("자기소개를 입력하셔야 합니다.")
		signCheck.mem_introduce.focus() 
		return false;
	}
=======
   if(mem_id.length==0 || mem_id==null){
     alert("아이디를 입력하십시오");
     return false;
    }
   if (!regx.test(mem_id)){
     alert("아이디는 영어, 숫자만 입력가능합니다.");
     document.signCheck.mem_id.focus();
     return false;
   }
   if(signCheck.idDuplication.value != "idCheck"){
       alert("아이디 중복체크를 해주세요.");
        return false;
     }
>>>>>>> 신웅(장소)
   var mem_password = document.signCheck.mem_password.value;
   var num = mem_password.search(/[0-9]/g);
   var eng = mem_password.search(/[a-z]/ig);
   var spe = mem_password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
<<<<<<< HEAD
   if(mem_password.length < 6 || mem_password.length > 20){
      alert("비밀번호를 6자리 ~ 20자리 이내로 입력해주세요.");
       return false;
    }else if(mem_password.search(/\s/) != -1){
      alert("비밀번호는 공백 없이 입력해 주세요.");
      signCheck.mem_password.focus();
      return false;   
    }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
     alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해 주세요.");
     signCheck.mem_password.focus();
=======
   
   if(mem_password.length<6 || mem_password==null){
      alert("비밀번호를 입력하십시오(6글자 이상)");
       return false;
       
    }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
     alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
>>>>>>> 신웅(장소)
     return false;
    }
   if(right==0){
       alert("비밀번호가 동일하지 않습니다.");
<<<<<<< HEAD
       signCheck.mem_password.focus();
       return false;
    }
   if(signCheck.idDuplication.value != "idCheck"){
      alert("아이디 중복체크를 해주세요.");
      return false;
           }
=======
       return false;
    }
>>>>>>> 신웅(장소)

    if(signCheck.emailDuplication.value != "emailCheck"){
         alert("이메일 중복체크를 해주세요.");
         return false;
            }
    if(signCheck.nickDuplication.value != "nickCheck"){
      alert("닉네임 중복체크를 해주세요.");
      return false;
   }
<<<<<<< HEAD
   var nameRegExp = /^[가-힣|a-zA-Z]+$/;
    var mem_userName = signCheck.mem_userName.value;
    if (!nameRegExp.test(mem_userName)){
         alert("이름이 올바르지 않습니다.");
         signCheck.mem_userName.focus();
=======
   var nameRegExp = /^[가-힣a-zA-Z]+$/;
    var mem_userName = signCheck.mem_userName.value;
    if (!nameRegExp.test(mem_userName)){
         alert("이름이 올바르지 않습니다.");
>>>>>>> 신웅(장소)
         return false;
   }
   var telRegExp = /^01+[016789]+[0-9]{7,8}$/;
   var mem_phone = signCheck.mem_phone.value;
   if(!telRegExp.test(mem_phone)){
          alert("전화번호 형식이 올바르지 않습니다.");
          signCheck.mem_phone.value ="";
          signCheck.mem_phone.focus();
          return false;
    } 
   var birthRegExp = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;
   var mem_birthday = signCheck.mem_birthday.value;
   if(!birthRegExp.test(mem_birthday)){
      alert("생일 형식에 맞게 입력해 주세요.");
         signCheck.mem_birthday.value ="";
         signCheck.mem_birthday.focus();
         return false; 
      }
   var fileName = $("#mem_image").val();           
   var ext = fileName.slice(fileName.lastIndexOf(".") + 1).toLowerCase();
   if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
      alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");   
<<<<<<< HEAD
      signCheck.mem_image.focus();
      return false;
   }
   if($("#emailDoubleChk").val() == false){
	   alert("인증번호가 일치하지 않습니다!");
	   return false;
   }
=======
      return false;
   }
>>>>>>> 신웅(장소)
          document.signCheck.submit()
}       
           </script>
           
<!-- 아이디체크 -->
           <script>
           function inputIdChk(){
              var signCheck = document.signCheck;
              var CheckId = document.signCheck.CheckId;
              document.signCheck.idDuplication.value="idUncheck";
              CheckId.disabled=false;
              CheckId.style.opaclty=1;
              CheckId.style.cursor= "pointer";        
           } 
           function fn_CheckId(){
<<<<<<< HEAD
           var signCheck = document.signCheck;
           var mem_id = signCheck.mem_id.value;
              var regx = /^[a-zA-Z0-9]*$/;
              if(!mem_email){
                alert("아이디를 입력해주세요");
              $("#mem_id").focus();
              return false;
                 }
            if (!regx.test(mem_id)){
               alert("아이디는 영어, 숫자만 입력가능합니다.");
               document.signCheck.mem_id.focus();
               return false;
                    }   
                 window.open("checkId.login?mem_id="+mem_id,"","width=500,height=300");
              }
       
           
           </script>
           
=======
              var signCheck = document.signCheck;
              var mem_id = signCheck.mem_id.value;
              if(mem_id.length==0||mem_id==""){
                 alert("아이디를 입력해 주세요.");
                 signCheck.mem_id.focus();
              }else{
                 window.open("checkId.login?mem_id="+mem_id,"","width=500,height=300");
              }
           }
           
           </script>
           
 <!-- 닉네임 체크 -->  
               <script>
           function inputNickChk(){
              var signCheck = document.signCheck;
              var CheckNick = document.signCheck.CheckNick;
              document.signCheck.nickDuplication.value="nickUncheck";
              CheckNick.disabled=false;
              CheckNick.style.opaclty=1;
              CheckNick.style.cursor= "pointer";        
           } 
           function fn_CheckNick(){
              var signCheck = document.signCheck;
              var mem_nickName = signCheck.mem_nickName.value;
              if(mem_nickName.length==0||mem_nickName==""){
                 alert("닉네임을 입력해 주세요.");
                 signCheck.mem_nickName.focus();
              }else{
                 window.open("checkNick.login?mem_nickName="+mem_nickName,"","width=500,height=300");
              }
           }
           
           </script>
    
>>>>>>> 신웅(장소)
 <!-- 이메일 체크 -->        
          <script>
           function inputEmailChk(){
              var signCheck = document.signCheck;
              var CheckEmail = document.signCheck.CheckEmail;
              document.signCheck.emailDuplication.value="emailUncheck";
              CheckEmail.disabled=false;
              CheckEmail.style.opaclty=1;
              CheckEmail.style.cursor= "pointer";        
           } 
           function fn_CheckEmail(){
              var signCheck = document.signCheck;
              var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
              var mem_email = signCheck.mem_email.value;
               if(!mem_email){
                   alert("이메일을 입력해주세요");
                 $("#mem_email").focus();
                 return false;
               }
    
               if(!email_rule.test(mem_email)){
                   alert("이메일을 형식에 맞게 입력해주세요.");
                 return false;
               }
                 window.open("checkEmail.login?mem_email="+mem_email,"","width=500,height=300");
              }
           
           
<<<<<<< HEAD
           </script>             
           
 <!-- 닉네임 체크 -->  
               <script>
           function inputNickChk(){
              var signCheck = document.signCheck;
              var CheckNick = document.signCheck.CheckNick;
              document.signCheck.nickDuplication.value="nickUncheck";
              CheckNick.disabled=false;
              CheckNick.style.opaclty=1;
              CheckNick.style.cursor= "pointer";        
           } 
           function fn_CheckNick(){
              var signCheck = document.signCheck;
              var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
              var mem_nickName = signCheck.mem_nickName.value;
              if(mem_nickName.length==0||mem_nickName==""){
                 alert("닉네임을 입력해 주세요.");
                 signCheck.mem_nickName.focus();
                 return false;
              }
              if( regExp.test(mem_nickName) ){
                 alert("특수문자는 입력하실수 없습니다.");
                 return false;
              }
                 window.open("checkNick.login?mem_nickName="+mem_nickName,"","width=500,height=300");
                 
           }
         
           </script>
    
        
=======
           </script>          
>>>>>>> 신웅(장소)

<!-- 비밀번호 확인 -->
    <script>
    function passchk(){
       var signCheck = document.signCheck;
        var mem_password = document.signCheck.mem_password.value;
        var mem_password2 = document.signCheck.mem_password2.value;
        if (mem_password2.length == 0 || mem_password2 == null) {
         document.signCheck.chk.value = "비밀번호를 입력하세요";
         right=0;
        } else if (mem_password != mem_password2) {
         document.signCheck.chk.value = "비밀번호가 다릅니다.";
         right=0;
        } else {   
         document.signCheck.chk.value = "비밀번호가 동일합니다.";
         right=1;
        }
        return;
       }
<<<<<<< HEAD
 
   </script>
<!-- 인증번호  -->
<script>
var code = "";
function CertifyEamil_fn(button_id){
	id = button_id;
	if(id=="CertifyEmail"){
		var mem_email = $("#mem_email").val();
		$.ajax({
		type:"GET",
		url:"CertifyEmail.login?mem_email=" + mem_email,
		cache : false,
		success:function(data){     		
			alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
			$("#CertifyEmailNum").attr("disabled",false);
			code = data;	          
		     }
		  });
	}else if(id=="CertifyEmail_OK"){
		if($("#CertifyEmailNum").val() == code){
			$(".successEmailChk").text("인증번호가 일치합니다.");
			$(".successEmailChk").css("color","green");
			$("#emailDoubleChk").val("true");
			$("#CertifyEmailNum").attr("disabled",true);
			//$("#sm_email").attr("disabled",true);
		}else{
			$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successEmailChk").css("color","red");
			$("#emailDoubleChk").val("false");
			$("#CertifyEmailNum").attr("autofocus",true);
		}
	}
/* 	$("#CertifyEmail").click(function(){
		alert("!");
		var mem_email = $("#mem_email").val();
		$.ajax({
		type:"GET",
		url:"CertifyEmail.login?mem_email=" + mem_email,
		cache : false,
		success:function(data){     		
			alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
			$("#CertifyEmailNum").attr("disabled",false);
			code = data;	          
		     }
		  });
	});	 */
/* 	$("#CertifyEmail_OK").click(function(){

		if($("#CertifyEmailNum").val() == code){
			$(".successEmailChk").text("인증번호가 일치합니다.");
			$(".successEmailChk").css("color","green");
			$("#emailDoubleChk").val("true");
			$("#CertifyEmailNum").attr("disabled",true);
			//$("#sm_email").attr("disabled",true);
		}else{
			$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successEmailChk").css("color","red");
			$("#emailDoubleChk").val("false");
			$("#CertifyEmailNum").attr("autofocus",true);
		}
	}); */
	
}




</script>

=======
    </script>
>>>>>>> 신웅(장소)

<title>회원가입</title>

 <!-- Bootstrap -->
>>>>>>> 정민(로그인):CarCamping (12)/src/main/webapp/WEB-INF/views/login/sign2.jsp
=======
>>>>>>> 혜성(리뷰)
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<<<<<<< HEAD
<<<<<<< HEAD:CarCamping/src/main/webapp/WEB-INF/views/login/sign2.jsp
=======
<<<<<<<< HEAD:CarCamping/src/main/webapp/WEB-INF/views/login/sign.jsp
</head>
<body>
<form name="signCheck" action="sign.login" method="post" enctype="multipart/form-data">

<table border=1  style="margin-left: auto; margin-right: auto;">
<tr>
<<<<<<< HEAD
 <td colspan="4" align=center bgcolor="#0B2161">
 <font size=5 color="white">회원가입</font>
 </td>
</tr>
 <tr height="200"><td>회원가입 약관 </td><td colspan="3">
=======
 <td colspan="2" align=center bgcolor="#83BD75">
 <b><font size=5>회원가입</font></b>
 </td>
</tr>
 <tr height="200"><td>회원가입 약관 </td><td>
>>>>>>> 신웅(장소)
 <textarea class="outer" style="width: 90%; height:100px; resize: none;"cols="100" readonly>
  제 1 조 (목적)
1. 본 약관은 해당 사이트가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 해당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (약관의 효력과 변경)
1. 해당 사이트는 귀하가 본 약관 내용에 동의하는 경우 해당 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.
2. 해당 사이트는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 해당 사이트 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.
이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.
제 3 조 (약관 외 준칙)
1. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.
제 4 조 (용어의 정의)
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. 이용자 : 본 약관에 따라 해당 사이트가 제공하는 서비스를 받는 자.
2. 가입 : 해당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위.
3. 회원 : 해당 사이트에 개인 정보를 제공하여 회원 등록을 한 자로서 해당 사이트가 제공하는 서비스를 이용할 수 있는 자.
4. 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합.
5. 탈퇴 : 회원이 이용계약을 종료시키는 행위.
제 2 장 서비스 제공 및 이용
제 5 조 (이용계약의 성립)
1. 이용계약은 신청자가 온라인으로 해당 사이트에서 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다.
2. 해당 사이트는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.
① 다른 사람의 명의를 사용하여 신청하였을 때
② 이용계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때
③ 다른 사람의 해당 사이트 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때
④ 해당 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우
⑤ 기타 해당 사이트가 정한 이용신청요건이 미비 되었을 때
제 6 조 (회원정보 사용에 대한 동의)
1. 회원의 개인정보는 공공기관의 개인정보보호에 관한 법률에 의해 보호됩니다.
2. 해당 사이트의 회원 정보는 다음과 같이 사용, 관리, 보호됩니다.
① 개인정보의 사용 : 해당 사이트는 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다.
단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 해당 사이트에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.
② 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다.
③ 개인정보의 보호 : 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의 ID와 비밀번호에 의해 관리되고 있습니다.
따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 안되며, 작업 종료 시에는 반드시 로그아웃 해 주시기 바랍니다.
3. 회원이 본 약관에 따라 이용신청을 하는 것은, 해당 사이트가 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주됩니다.
제 7 조 (사용자의 정보 보안)
1. 가입 신청자가 해당 사이트 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.
2. ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용 되었다는 사실을 발견한 경우에는 즉시 해당 사이트에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다. 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 해당 사이트는 책임을 부담하지 아니합니다.
제 8 조 (서비스의 중지)
1. 해당 사이트는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다.
제 9 조 (서비스의 변경 및 해지)
1. 해당 사이트는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다. 의한 손해에 대하여 책임을 부담하지 아니합니다.
제 10 조 (게시물의 저작권)
1. 귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다.
2. 해당 사이트는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며, 게시판운영 원칙에 따라 사전 통지 없이 삭제할 수 있습니다.
3. 귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다.
제 3 장 의무 및 책임
제 11 조 (해당 사이트의 의무)
1. 해당 사이트는 회원의 개인 신상 정보를 본인의 승낙없이 타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.
제 12 조 (회원의 의무)
1. 회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 귀하에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
2. 회원은 해당 사이트의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.
제 4 장 기타
제 13 조 (양도금지)
1. 회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.
제 14 조 (손해배상)
1. 해당 사이트는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 해당 사이트가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.
제 15 조 (면책조항)
1. 해당 사이트는 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. 해당 사이트는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다. 금전적 거래등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.
제 16 조 (재판관할)
1. 해당 사이트와 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.</textarea><br>
<input type="radio" name ="agree">약관에 동의합니다.
<<<<<<< HEAD
<tr><td>아이디  </td><td colspan="3"> 
=======
<tr><td>아이디  </td><td> 
>>>>>>> 신웅(장소)
   <input type="text" class="form-control onlyAlphabetAndNumber" id="mem_id" name="mem_id" data-rule-required="true" placeholder="12자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="12" onkeydown="inputIdChk()" required>
     <button type = "button" onclick = "fn_CheckId()" name="CheckId" class="CheckId">중복 체크</button>
                        <input type = "hidden" id = "idDuplication" name="idDuplication" value="idUncheck"/></td>
</tr>
<<<<<<< HEAD
<tr>
<td>이메일 </td>
<td>
   <input class="form-control" type="text" name="mem_email" id="mem_email" title="이메일" placeholder="이메일" onkeydown="inputEmailChk()" required /> 
   <button type = "button" onclick = "fn_CheckEmail()" name="CheckEmail" class="CheckEmail">중복 체크</button>
   <button type = "button" name="CertifyEmail" id="CertifyEmail" onclick="CertifyEamil_fn(this.id);"disabled>인증번호 전송</button>
   <input type = "hidden" id = "emailDuplication" name="emailDuplication" value="emailUncheck"/>
   
</td>
<td>인증번호</td>
<td style="width: 260px;">
	<input class="form-control" type="text" id="CertifyEmailNum" title="인증번호" placeholder="인증번호" size="10" disabled />
	<button type = "button" name="CertifyEmail_OK" id="CertifyEmail_OK" onclick="CertifyEamil_fn(this.id);" disabled>인증번호 확인</button>
	<span class="point successEmailChk" style="display: block;font-size: 13px;">이메일 입력후 인증번호 전송을 눌러주세요.</span>
	<input type="hidden" id="emailDoubleChk"/>
</td>
</tr>
   
<tr><td>비밀번호  </td><td colspan="3"><input class="form-control" type="password" name="mem_password" required></td></tr>
<tr><td>비밀번호 확인  </td><td colspan="3"><input class="form-control" type="password" name="mem_password2" onblur="passchk()" required>

   <input type="text" style="border-width: 0px" size="20" name="chk" value="비밀번호를 입력하세요" readonly="readonly">
   <br><br></td></tr>

<tr><td>이름  </td><td colspan="3"><input class="form-control" type="text" name="mem_userName" required></td></tr>
<tr><td>닉네임  </td>
<td colspan="3">
=======
<tr><td>이메일 </td>
<td>
   <input class="form-control" type="text" name="mem_email" id="mem_email" value="" title="이메일" placeholder="이메일" onkeydown="inputEmailChk()" required /> 
                    <button type = "button" onclick = "fn_CheckEmail()" name="CheckEmail" class="CheckEmail">중복 체크</button>
                        <input type = "hidden" id = "emailDuplication" name="emailDuplication" value="emailUncheck"/></td></tr>
   
<tr><td>비밀번호  </td><td><input class="form-control" type="password" name="mem_password" required></td></tr>
<tr><td>비밀번호 확인  </td><td><input class="form-control" type="password" name="mem_password2" onblur="passchk()" required>
&nbsp;
   <input type="text" style="border-width: 0px" size="20" name="chk" value="비밀번호를 입력하세요" readonly="readonly">
   <br><br></td></tr>

<tr><td>이름  </td><td><input class="form-control" type="text" name="mem_userName" required></td></tr>
<tr><td>닉네임  </td>
<td>
>>>>>>> 신웅(장소)
<input type="text" class="form-control" id="mem_nickName" name="mem_nickName" data-rule-required="true" placeholder="닉네임" maxlength="30" onkeydown="inputNickChk()" required>
                       <button type = "button" onclick = "fn_CheckNick()" name="CheckNick" class="CheckNick">중복 체크</button>
                        <input type = "hidden" id = "nickDuplication" name="nickDuplication" value="nickUncheck"/>
                        </td>
                        </tr>
<<<<<<< HEAD
<tr><td>프로필 사진  </td><td colspan="3"><input class="form-control" type="file" id="mem_image" name="mem_image"  required></td></tr>
<tr><td>전화번호  </td><td colspan="3">
<input class="form-control" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  id="mem_phone" name="mem_phone" placeholder="전화번호는 -를 빼고 입력해 주세요" maxlength="11" required /> 
                       </td>
                       </tr>
<tr><td>생년월일  </td><td colspan="3">
=======
<tr><td>프로필 사진  </td><td><input class="form-control" type="file" id="mem_image" name="mem_image"  required></td></tr>
<tr><td>전화번호  </td><td>
<input class="form-control" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  id="mem_phone" name="mem_phone" placeholder="전화번호는 -를 빼고 입력해 주세요" maxlength="11" required /> 
                       </td>
                       </tr>
<tr><td>생년월일  </td><td>
>>>>>>> 신웅(장소)
   <input class="form-control" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="mem_birthday" name="mem_birthday"  placeholder="생년월일을 6자리로 입력해 주세요 ex:990101" maxlength="6" required /> 
                   </td>
                   </tr>
<tr>
  <td>성별</td>
<<<<<<< HEAD
  <td colspan="3">
=======
  <td>
>>>>>>> 신웅(장소)
   <input type="radio" name="mem_gender" value="0" checked/>남자
   <input type="radio" name="mem_gender" value="1"/> 여자
  </td> 
 </tr>
 <tr height="100">
        <td>관심지역</td>
<<<<<<< HEAD
        <td colspan="3"><select name="region_num">
=======
        <td><select name="region_num">
>>>>>>> 신웅(장소)
                            <option value="1">서울/경기도</option>
                            <option value="2">강원도</option>
                            <option value="3">충청북도</option>
                            <option value="4">충청남도</option>
                            <option value="5">전라북도</option>
                            <option value="6">전라남도</option>
                            <option value="7">경상북도</option>
                            <option value="8">경상남도</option>
                            <option value="9">제주도</option>
                </select>
        </td>
    </tr>
<<<<<<< HEAD
<tr><td>자기소개 요약 : </td><td colspan="3"><input class="form-control" type="text" name="mem_summary" required></td></tr>
<tr><td>자기소개 : </td><td colspan="3">
<textarea style="resize:none;" class="form-control" id="mem_introduce" name="mem_introduce" data-rule-required="true" placeholder="자기소개를 적어주세요" rows="5" required></textarea>
</td></tr>
<tr>
  <td>이메일 수신여부</td>
  <td colspan="3">
=======
<tr><td>자기소개 요약 : </td><td><input class="form-control" type="text" name="mem_summary"  required></td></tr>
<tr><td>자기소개 : </td><td>
<textarea class="form-control" id="mem_introduce" name="mem_introduce" data-rule-required="true" placeholder="자기소개를 적어주세요" rows="5" required></textarea>
</td></tr>
<tr>
  <td>이메일 수신여부</td>
  <td>
>>>>>>> 신웅(장소)
   <input type="radio" name="mem_accept_email" value="0" checked/>동의합니다
   <input type="radio" name="mem_accept_email" value="1"/>동의하지 않습니다
  </td> 
 </tr>
 <tr>
  <td>SMS 수신여부</td>
<<<<<<< HEAD
  <td colspan="3">
=======
  <td>
>>>>>>> 신웅(장소)
   <input type="radio" name="mem_accept_phone" value="0" checked/>동의합니다
   <input type="radio" name="mem_accept_phone" value="1"/> 동의하지 않습니다
  </td> 
 </tr>
 <tr>
  <td>개인정보 제공 동의 여부</td>
<<<<<<< HEAD
  <td colspan="3">
=======
  <td>
>>>>>>> 신웅(장소)
   <input type="radio" name="mem_accept_privacy" value="0" checked/>동의합니다
   <input type="radio" name="mem_accept_privacy" value="1"/> 동의하지 않습니다
  </td> 
 </tr>
 <tr>
<<<<<<< HEAD
  <td colspan="4" align=center>
   <input type="button" onclick="regChk();" value="회원가입">
=======
  <td colspan="2" align=center>
   <input type="button" onclick="regChk();" value="회원가입"> <!-- 회원가입을 하면 sign.login으로 넘어가게된다. -->
>>>>>>> 신웅(장소)
   <input type="reset" value="다시 작성">

 
  </td>
 </tr>
</table>
</form>

</body>
========
>>>>>>> 정민(로그인):CarCamping (12)/src/main/webapp/WEB-INF/views/login/sign2.jsp
=======
>>>>>>> 혜성(리뷰)
		
</head>

 <!-- 이메일 합치기 -->         
           <script> 
           var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
           var email_id =$("#email_id").val();
           var email_domain =$("#email_domain").val();
           var mem_email ="";
          
          
           if(!email_id){
               alert("이메일을 입력해주세요");
             $("#email_id").focus();
             return false;
           }
           if(!email_domain){
               alert("도메인을 입력해주세요");
             $("#email_domain").focus();
             return false;
           }
           mem_email = email_id+"@"+email_domain;
           $("#mail").val(mem_email);  
           
           if(!email_rule.test(mem_email)){
               alert("이메일을 형식에 맞게 입력해주세요.");
             return false;
           }
           
           function setEmailDomain(domain){
                 $("#email_domain").val(domain);
             }
             
           
           </script>
           
 <!-- 생년월일 합치기 -->            
           <script>
           var year =$("#birth_year").val();
           var month =$("#birth_month").val();
           var day =$("#birth_day").val();
           var mem_birthday ="";
           
           if(!month){
               alert("월을 입력해주세요");
             $("#birth_month").focus();
             return false;
           }
           if(!day){
               alert("일을 입력해주세요");
             $("#birth_day").focus();
             return false;
           }
           mem_birthday = year+month+day;
           $("#mem_birthday").val(mem_birthday);  
           
            
           </script>
           
  <!-- 전화번호 합치기 -->           
           <script>
           var ph1 =$("#ph1").val();
           var ph2 =$("#ph2").val();
           var ph3 =$("#ph3").val();
           var mem_phone ="";
           
           if(!ph2){
               alert("전화번호를 입력해주세요");
             $("#ph2").focus();
             return false;
           }
           if(!ph3){
               alert("전화번호를 입력해주세요");
             $("#ph3").focus();
             return false;
           }
           mem_phone = ph1_ph2+ph3;
           $("#mem_phone").val(mem_birthday);  
           
            
           </script>
           
<!-- 아이디체크 -->
           <script>
           function inputIdChk(){
           	var signCheck = document.signCheck;
           	var CheckId = document.signCheck.CheckId;
           	document.signCheck.idDuplication.value="idUncheck";
           	CheckId.disabled=false;
           	CheckId.style.opaclty=1;
           	CheckId.style.cursor= "pointer";        
           } 
           function fn_CheckId(){
        	   var signCheck = document.signCheck;
        	   var mem_id = signCheck.mem_id.value;
        	   if(mem_id.length==0||mem_id==""){
        		   alert("아이디를 입력해 주세요.");
        		   signCheck.mem_id.focus();
        	   }else{
        		   window.open("checkId.login?mem_id="+mem_id,"","width=500,height=300");
        	   }
           }
           
           </script>
           
 <!-- 닉네임 체크 -->  
 	           <script>
           function inputNickChk(){
           	var signCheck = document.signCheck;
           	var CheckNick = document.signCheck.CheckNick;
           	document.signCheck.nickDuplication.value="nickUncheck";
           	CheckNick.disabled=false;
           	CheckNick.style.opaclty=1;
           	CheckNick.style.cursor= "pointer";        
           } 
           function fn_CheckNick(){
        	   var signCheck = document.signCheck;
        	   var mem_nickName = signCheck.mem_nickName.value;
        	   if(mem_nickName.length==0||mem_nickName==""){
        		   alert("닉네임을 입력해 주세요.");
        		   signCheck.mem_nickName.focus();
        	   }else{
        		   window.open("checkNick.login?mem_nickName="+mem_nickName,"","width=500,height=300");
        	   }
           }
           
           </script>
 	
 <!-- 이메일 체크 -->        
 		      <script>
           function inputEmailChk(){
           	var signCheck = document.signCheck;
           	var CheckNick = document.signCheck.CheckEmail;
           	document.signCheck.emailDuplication.value="emailUncheck";
           	CheckEmail.disabled=false;
           	CheckEmail.style.opaclty=1;
           	CheckEmail.style.cursor= "pointer";        
           } 
           function fn_CheckEmail(){
        	   var signCheck = document.signCheck;
        	   var mem_email = signCheck.mem_email.value;
        	   if(mem_email.length==0||mem_email==""){
        		   alert("이메일을 입력해 주세요.");
        		   signCheck.mem_email.focus();
        	   }else{
        		   window.open("checkEmail.login?mem_email="+mem_email,"","width=500,height=300");
        	   }
           }
           
           </script>          
           
<!-- 비밀번호 조건설정 -->

	<script>
        function check_pw(){
            var mem_password = document.getElementById('mem_password').value;
 
            if(mem_password.length < 6 || mem_password.length > 16){
                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
                document.getElementById('pw').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
           
            if(document.getElementById('mem_password').value !='' && document.getElementById('mem_password2').value!=''){
                if(document.getElementById('mem_password').value==document.getElementById('mem_password2').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                }
            }
        }
    </script>
	

    </head>
    <body>
    
    
      <div class="container"><!-- 좌우측의 공간 확보 -->
            <!-- 헤더 들어가는 부분 -->
            
            <div class="row">
                <p></p>
                <div class="col-md-12">
                    <small>
                    <a href="#"><font color="green"><h3>회원가입</h3></font></a>
                    </small>
                </div>
            </div>
            <!--// 헤더 들어가는 부분 -->
           
            <hr/>
            <!-- 본문 들어가는 부분 -->
                
 
 
            <form name = "signCheck" class="form-horizontal" role="form" method="post" action="sign.login" enctype="multipart/form-data">

                <div class="form-group">
                    <label for="provision" class="col-lg-2 control-label">회원가입약관</label>
                    <div class="col-lg-10" id="provision">
                        <textarea class="form-control" rows="8" style="resize:none">약관동의
                        제 1 장 총칙 

제1조 - 목 적
 본 약관은 ㈜위드카가 제공하는 모든 서비스의 이용조건 및 절차, 기타 필요한 사항을 규정함을 목적으로 한다.

제2조 - 약관의 효력
 본 약관은 전기통신사업법 제31조, 동법 시행규칙 제21조의 2에 따라 공시절차를 거친 후 서비스를 통하여 이를 공지하거나 전자우편 기타의 방법으로 회원에게 통지함으로써 효력을 발생합니다. 

제3조 - 약관의 변경
 회사는 회사 사정상 혹은 서비스상 중요 사유가 있을 때 약관을 변경할 수있으며, 변경된 약관은 제2조와 같은 방법으로 효력을 발생합니다.

제4조 - 약관 외 준칙 
 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법 등 기타 대한민국의 관련 법령과 상관습에 따릅니다.

제 2 장 회원 가입 및 탈퇴 

제1조 - 회원 가입
 (1) 가입신청자 온라인으로 등록절차를 거쳐서 '동의함' 버튼을 누르면 이 약관에 합법적으로 동의하는 것으로 간주합니다.
 (2) 회사는 다음 각 호에 해당하지 않는 한 신청자를 회원으로 등록합니다.
- 등록내용에 허위, 기재누락, 오기가 있는 경우
- 회원으로 등록하는 것이 회사의 기술상 또는 업무 수행상 현저히 지장이 있는 경우
- 사회의 안녕과 질서 그리고 미풍양속을 저해할 목적으로 신청한 경우.

제2조 - 회원 탈퇴
 회원은 회사에 언제든지 자신의 회원 등록을 말소해 줄 것(이용자 탈퇴)을 요청 할 수 있으며 회사는 위 
 요청을 받은 즉시 해당 이용자의 회원 등록 말소를 위한 절차를 밟습니다 
 (1) 회원이 사망한 때는 회원자격을 상실합니다. 
 (2) 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 사전 통지없이 회원 자격을 상실시키거나 또는 기간을 정하 여 서비스 이용을 중지할 수 있습니다. 
- 등록 신청 시에 허위 내용을 등록한 경우 
- 본 약관을 위반한 경우 
- 공공질서 및 미풍양속에 반하는 경우 
- 범죄적 행위에 관련되는 경우 
- 서비스에 위해를 가하는 등 서비스의 건전한 이용을 저해한 경우 
- 기타 회원으로서의 자격을 지속시키는 것이 부적절하다고 판단되는 경우 

제 3 장 서비스 제공 및 이용 

제1조 - 서비스의 내용
 회사는 필요한 경우 서비스의 내용을 추가 또는 변경할 수 있으며, 회사는 추가 또는 변경내용을 회원에게 통지하여야 합니다.

제2조 - 서비스 이용시간
 (1) 서비스는 회사의 업무상 또는 기술상 장야, 기타 특별한 사유가 없는 한 연중 무휴, 1일 24시간 이용할 수 있습니다.
 (2) 회사는 제공하는 서비스 중 일부에 대한 이용시간을 별도로 정할 수 있으며, 이 경우 관련 사항을 사전에 회원에게 공지 또는 통지합니다.

제3조 - 정보의 제공 및 광고의 게재
 (1) 회사는 서비스를 운용함에 있어서 각종 정보를 서비스에 게재하는 방법등으로 회원에게 제공할 수 있습니다.
 (2) 회사는 광고 수익을 기반으로 본 서비스를 제공하고 있습니다. 서비스를 이용하고자 하는 이용자는 이 광고 게재에 대해 동의하는 것으로 간주됩니다.

제4조 - 서비스 제공의 중지
 회사는 언제든지 본 서비스 (전체 혹은 그 일부)를 일시 또는 영구적으로 수정하거나 중단할 수 있습니다. 
귀하는 서비스의 수정, 중단 또는 중지에 대해 회원 또는 제3자에 대하여 어떠한 책임도 지지 않습니다.

제 4 장 의무사항

제1조 - 회사의 의무
 (1) 회사는 본 약관이 정하는 바에 따라 지속적이고, 안정적인 서비스를 제공하 기 위해서 노력합니다. 
 (2) 회사는 서비스 제공과 관련해서 알고 있는 회원의 신상정보를 본인의 승낙 없이 제 3자에게 누설, 배포하지 않습니다. 
 (3) 회사는 회원 전체 또는 일부의 개인정보에 관한 통계 자료를 작성하여 회사의 내부 마케팅 자료 또는 영업을 위한 통계 자료로 활용할 수 있습니다.
 (4) 회사는 회원으로부터 제출되는 의견 및 불만사항이 정당하다고 판단하는 경우 우선적으로 그 사항을 처리하여야 합니다.
 (5) 종이카드 서비스는 우편으로 제공되기 때문에 배달과정에서의 우편배달 사고에 대해서는 회사가 책임을 지지 않습니다.

제2조 - 회원의 의무
 (1) 회원은 본 약관을 준수 하여야 합니다.
 (2) 사용상의 과실 혹은 사용자명 및 비밀번호의 부주의한 관리로 3자의 부정사용 등 피해가 발생한 경우 모든 책임은 이를 야기한 회원에게 있습니다 
 (3) 전기통신법 제53조와 전기통신사업법 시행령 16조(불온통신), 통신사업 제53조3항에 의거, 본 서비스를 이용하여 음란물이나 불온한 내용을 전송함으로써 발생하는 모든 법적인 책임은 '아이디 이용자'에게 있습니다
 (4) 자신의 ID가 부정하게 사용된 경우 회원은 반드시 회사에 그 사실을 신고하여야 합니다.    

                        </textarea>
                        <div class="radio">
                            <label>
                                <input type="radio" id="provisionY" name="provisionYn" value="Y"  checked>
                                동의합니다.
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" id="provisionN" name="provisionYn" value="N">
                                동의하지 않습니다.
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="memberInfo" class="col-lg-2 control-label">개인정보취급방침</label>
                    <div class="col-lg-10" id="memberInfo">
                        <textarea class="form-control" rows="8" style="resize:none">개인정보의 항목 및 수집방법
개인정보취급방침

위드카는 고객님의 개인정보보호를 매우 중요시하며, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』및 『개인정보보호의 기술적 관리적 보호조치 기준』을 준수하고 있습니다. 또한 ‘개인정보취급방침’을 통하여 고객님께서 제공하시는 개인정보가 어떤 용도와 방식으로 이용되고 있으며 개인정보를 효과적이고 적극적으로 보호하기 위해 항상 노력하고 있음에 대해 알려드립니다.

● 개인정보 수집·이용 안내

1. 개인정보의 수집·이용 목적

–이용자에게 보다 나은 서비스를 제공하기 위해 홈페이지의 개선과 보완을 취한 통계분석

–이용자와 웹사이트간의 원활한 의사소통, 보안 침해 대응 등에 이용 될 수 있음

–이러한 정보는 법령의 규정에 따라 제출될 수 있음을 유념하시기 바랍니다

2.. 개인정보 수집 항목

· 본사는 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.

· 본사의 홈페이지에 가입 시 수집되는 개인정보는 다음과 같습니다.

*필수사항

–이름:회원의 식별

–휴대폰 번호:공지사항 안내, 문의답변

–이메일:공지사항안내, 문의답변

*선택사항

–맞춤서비스, 마케팅 자료로 활용

• 홈페이지를 이용할 경우 자동으로 수집·저장되는 개인정보 및 그 거부에 관한 사항은 다음과 같습니다.

*수집항목

–쿠키(cookie)

–이용자의 인터넷서버 도메인

–경유 웹사이트 주소

-OS종류

–웹브라우저 종류 및 버전

※ 개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항

고객님께서는 쿠키 설치에 대한 선택권을 가지고 있습니다. 웹 브라우저 상단의 “도구 > 인터넷옵션 > 개인정보 > 고급”에서 모든 쿠키를 다 받아들이거나, 쿠키가 설치될 때 통지를 보내도록 하거나, 아니면 모든 쿠키를 거부할 수 있습니다. 단, 고객님께서 쿠키 설치를 거부하였을 경우 서비스 이용에 불편이 있거나, 서비스 제공에 어려움이 있을 수 있습니다. 쿠키는 브라우저의 종료 시나 로그아웃 시 만료됩니다.

3. 개인정보의 보유 및 이용기간

· 본사는 고객님의 서비스 가입일로부터 고객님께 서비스를 제공하는 기간 동안에 한하여 고객님의 개인정보를 보유 및 이용하게 됩니다. 회원 탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집/이용목적을 달성하거나 보유/이용기간이 종료한 경우, 사업폐지 등의 사유발생시 당해 개인정보를 지체없이 파기합니다.

· 단, 요금의 정산, 소송이나 분쟁 등 기타 필요한 경우를 대비하여 일정기간 보유하여야 할 필요가 있을 경우 개인정보는 일정기간 보유합니다.

4. 개인정보의 파기 절차 및 방법

· 본사는 수집한 개인정보의 이용목적이 달성된 후에는 보관기간 및 이용기간에 따라 해당 정보를 지체없이 파기합니다. 파기절차, 방법, 시점은 다음과 같습니다.

파기절차 및 시점

· 고객이 서비스 가입 등을 위해 기재한 개인정보는 서비스 해지 등 이용목적이 달성된 후 내부 방침 및 기타 관련 법령에 의한 방침에 의해 삭제되거나 파기합니다.

파기방법

· 가입신청서 등 서면양식에 기재하거나, 종이에 출력된 개인정보는 분쇄기로 분쇄 또는 소각하여 파기하고, 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

● 개인정보 수집 및 활용에 대한 동의

· 본사는 고객님께서 개인정보 취급방침 또는 이용약관의 내용에 대해 ‘동의한다‘ 또는 ‘동의하지 않는다‘ 버튼을 클릭할 수 있는 절차를 마련하고 있으며, ‘동의한다‘버튼을 클릭하면 개인정보 수집 및 활용에 대해 동의한 것으로 봅니다.

● 개인정보 취급 업무의 위탁

1.개인정보의 제3자 제공

· 본사는 개인정보보호정책 등에서 고지하거나 동의한 범위를 초과하여 회원의 개인정보를 이용하거나 제 3자에게 제공 또는 공개하지 않습니다. 다만, 법률의 규정에 의한 정보 제공의 경우나 기타 법령이 허용한 범위 내에서는 예외로 합니다.

■ 이용자 권리와 그 행사 방법

개인정보의 열람, 정정, 동의 철회(회원탈퇴)

· 고객님은 언제든지 등록되어 있는 고객님의 개인정보를 열람하거나 정정하실 수 있습니다. 개인정보 열람 및 정정을 하고자 할 경우에는 ‘회원정보변경‘을 클릭하여 직접 열람 또는 정정하실 수 있습니다.

· 본사는 고객이 개인정보에 대한 열람?증명 또는 정정을 요구하는 경우에는 고객의 요구에 성실하게 대응하고, 해당 개인정보에 오류가 있거나 보존기간을 경과한 것이 판명되는 등 정정ㆍ삭제를 할 필요가 있다고 인정되는 경우에는 지체 없이 정정?삭제를 합니다.

· 또한 회원가입 등을 통해 개인정보의 수집, 이용, 제공에 대해 동의하신 내용을 언제든지 철회하실 수 있습니다. 동의 철회(회원탈퇴)를 하고자 할 경우에는 ‘회원탈퇴‘를 클릭하여 직접 신청하실 수 있습니다.

■ 개인정보보호를 위한 기술 및 관리적 보호조치

· 본사는 고객님의 개인정보를 보호하기 위해 기술적 대책과 관리적 대책을 마련하고 있으며, 이를 적용하고 있습니다.

기술적 보호조치

· 본사는 고객님의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적 대책을 강구하고 있습니다.

– 고객님의 개인정보는 비밀번호에 의해 보호되며 파일 및 전송데이터를 암호화하거나 파일 잠금기능 (Lock)을 사용하여 중요한 데이터는 별도의 보안기능을 통해 보호되고 있습니다.

– 본사는 백신프로그램을 이용하여 컴퓨터 바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다. 백신프로그램은 주기적으로 업데이트되며 갑작스런 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공함으로써 개인정보가 침해되는 것을 방지하고 있습니다.

– 본사는 암호알고리즘을 이용하여 네트워크 상의 개인정보를 안전하게 전송할 수 있는 보안장치(SSL)를 채택하고 있습니다.

– 해킹 등 외부침입에 대비하여 각 서버마다 침입차단시스템 및 취약점 분석시스템 등을 이용하여 보안에 만전을 기하고 있습니다.

관리적 보호조치

· 본사는 고객의 개인정보에 대한 접근 및 관리에 필요한 절차 등을 마련하여 소속 직원으로 하여금 이를 숙지하고 준수하도록 하고 있으며, 고객님의 개인정보에 대한 접근권한을 최소한의 인원으로 제한하고 있습니다. 그 최소한의 인원에 해당하는 자는 다음과 같습니다.

– 이용자를 직접 상대로 하여 마케팅 업무를 수행하는 자

– 개인정보관리책임자 및 담당자 등 개인정보관리업무를 수행하는 자

– 기타 업무상 개인정보의 취급이 불가피한 자

· 본사는 컴퓨터를 이용하여 고객의 개인정보를 처리하는 경우 개인정보에 대한 접근권한을 가진 담당자를 지정하여 ID 및 비밀번호를 부여하고, 해당 비밀번호를 정기적으로 갱신하고 있습니다.

· 개인정보를 취급하는 직원을 대상으로 새로운 보안 기술 습득 및 개인정보보호 의무 등에 관해 정기적인 사내 교육 및 외부 위탁교육을 실시하고 있습니다.

· 신규직원 채용 시 정보보호서약서 또는 개인정보보호서약서에 서명함으로 직원에 의한 정보유출을 사전에 방지하고 개인정보 취급방침에 대한 이행사항 및 직원의 준수여부를 감사하기 위한 내부절차를 마련하여 지속적으로 시행하고 있습니다.

· 직원 입사 및 퇴직 시 비밀유지서약서에 서명함으로 고객의 개인정보를 취급하였던 자가 직무상 알게 된 개인정보를 훼손ㆍ침해 또는 누설하지 않도록 하고 있습니다.

· 개인정보 관련 취급자의 업무 인수인계는 보안이 유지된 상태에서 철저하게 이뤄지고 있으며 입사 및 퇴사 후 개인정보 사고에 대한 책임을 명확히 하고 있습니다.

· 전산실 및 자료 보관실 등을 특별 보호구역으로 설정하여 출입을 통제하고 있습니다.

■ 홈페이지 이용자의 주의사항

· 링크사이트/웹 페이지

– 본 사가 운영하는 여러 웹페이지에 포함된 링크 또는 배너를 클릭하여 다른 사이트 또는 웹페이지로 옮겨갈 경우 개인정보취급방침은 그 사이트 운영기관이 게시한 방침이 적용되므로 새로 방문한 사이트의 방침을 확인하시기 바랍니다.

· 웹사이트 이용 중 다른 사람의 개인정보 취득

– 본 사의 웹사이트에서 이메일 주소 등 식별할 수 있는 개인정보를 취득 또는 배포하여서는 아니 됩니다.

· 이용자의 책임사항

– 홈페이지를 이용하여 타인의 권익을 침해하거나 허위사실을 유포하여 관련 단체에 피해를 준 경우 모든 책임은 그 문서의 게시자에게 있으며, 당사자의 개인 정보는 [정보통신망 이용촉진 및 정보보호 등에 관한 법률]에 따라 보호받지 못할 수도 있습니다.

※ 유의사항

– 이용자가 홈페이지에 기재한 사항은 다른 사람들이 조회 또는 열람할 수도 있습니다.

– 이용자가 기재한 사항은 관련 법규에 근거하여 필요한 다른 사람과 공유될 수 있으며, 관련법령의 시행과 정책개발의 자료로도 사용될 수 있습니다.

– 또한, 이러한 정보는 타기관과 공유되거나, 필요에 의하여 제공될 수도 있습니다.

– 보안을 위해 기술적/관리적 노력을 하고 있으나, 만약의 침해사고 시 문제가 될 수 있는 민감한 정보의 기재는 피하여 주시기 바랍니다.

■ 의견 수렴 및 불만처리

· 본사는 개인정보와 관련하여 고객의 의견을 매우 소중하게 생각합니다. 고객님께서 본사의 서비스를 이용하시며 발생하는 불만 또는 문의사항은 전화, 전자우편 또는 인터넷 홈페이지의 상담창구를 통하여 접수, 처리하고 있습니다. 기타 불만에 대한 내용은 다음 메일주소(omslee352@naver.com)로 보내주시면 신속/정확한 답변을 드리겠습니다.

· 기타 개인정보 침해에 관한 상담이 필요한 경우에는 한국인터넷진흥원 개인정보침해신고센터, 경찰청 사이버테러대응센터 등으로 문의하실 수 있습니다.

개인정보침해신고센터

– 전화 : 118

– URL : http://www.118.or.kr

경찰청 사이버테러대응센터

– 전화 : 02-393-911

– URL : http://www.netan.go.kr/

■ 개인정보관리책임자 및 담당자

· 본사는 고객님의 정보를 안전하게 이용할 수 있도록 최선을 다하고 있으며 개인정보 관련 문의사항에 신속하고 성실하게 답변해드리고 있습니다. 개인정보를 보호하는데 있어 고객님께 고지한 사항들에 반하는 사고가 발생할 시에 개인정보관리책임자가 모든 책임을 집니다. 고객님의 개인정보를 취급하는 책임자 및 담당자는 다음과 같습니다.

1. 개인정보관리책임자

이름 : 

소속 : 위드카

연락처 : 02-5555-5555

e-mail : dd@naver.com
                        </textarea>
                        <div class="radio">
                            <label>
                                <input type="radio" id="memberInfoYn" name="memberInfoYn" value="Y" checked>
                                동의합니다.
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" id="memberInfoYn" name="memberInfoYn" value="N">
                                동의하지 않습니다.
                            </label>
                        </div> 
                    </div>
                </div>
                <div class="form-group" id="divmem_Id">
                    <label for="inputmem_Id" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="mem_id" name="mem_id" data-rule-required="true" placeholder="12자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="12" onkeydown="inputIdChk()" required>
                        <button type = "button" onclick = "fn_CheckId()" name="CheckId" class="CheckId">중복 확인</button>
                        <input type = "hidden" id = "idDuplication" name="idDuplication" value="idUncheck"/>
                    </div>
                </div>
                <div class="form-group" id="divmem_email">
                    <label for="inputmem_email" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                    	<input type="text" id="email_id" class="form_w200" value="" title="이메일 아이디" placeholder="이메일" maxlength="18" /> @ 
						<input type="text" id="email_domain" class="form_w200" value="" title="이메일 도메인" placeholder="이메일 도메인" maxlength="18"/> 
                    	<select class="select" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;" >
						    <option value="">-선택-</option>
						    <option value="naver.com">naver.com</option>
						    <option value="gmail.com">gmail.com</option>
						    <option value="hanmail.net">hanmail.net</option>
						    <option value="hotmail.com">hotmail.com</option>
						    <option value="nate.com">nate.com</option>
						</select>
                    <button type = "button" onclick = "fn_ChekEmail()" name="CheckEmail" class="CheckEmail">중복 확인</button>
                        <input type = "hidden" id = "emailDuplication" name="emailDuplication" value="emailUncheck"/>
                    </div>
                </div>
                <div class="form-group" id="divmem_password">
                    <label for="inputmem_password" class="col-lg-2 control-label">비밀번호</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="mem_password" name="mem_password" data-rule-required="true" placeholder="영,문,특수기호 조합 8자이상" maxlength="15" required>
                    </div>
                </div>
                 <div class="form-group" id="divmem_userName">
                    <label for="inputmem_userName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control " id="mem_userName" name="mem_userName" data-rule-required="true" placeholder="한글 또는 영어로 입력해주세요." maxlength="10" required>

                    </div>
                </div>
                <div class="form-group" id="divmem_nickname">
                    <label for="inputmem_nickname" class="col-lg-2 control-label">닉네임</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="mem_nickName" name="mem_nickName" data-rule-required="true" placeholder="닉네임" maxlength="30" required>
                    	<button type = "button" onclick = "fn_CheckNick()" name="CheckNick" class="CheckNick">중복 확인</button>
                        <input type = "hidden" id = "nickDuplication" name="nickDuplication" value="nickUncheck"/>
                    
                    </div>
                </div>
                <div class="form-group" id="divmem_image">
                    <label for="inputmem_image" class="col-lg-2 control-label">프로필 사진</label>
                    <div class="col-lg-10">
                        <input type="file" id="mem_image" name="mem_image" data-rule-required="true" maxlength="30" required>
                    </div>
                </div>
                <div class="form-group" id="divmem_phone">
                    <label for="inputmem_Nickname" class="col-lg-2 control-label">전화번호</label>
                    <div class="col-lg-10">
							<select name="ph1"  data-rule-required="true" required>
						       <option value="010">010</option>
						       <option value="011">011</option>
						       <option value="016">016</option>
						       <option value="017">017</option>
						       <option value="019">019</option>
						        <option value="02">02</option>
						       <option value="051">051</option>
						       <option value="053">053</option>
						       <option value="0132">032</option>
						       <option value="062">062</option>		       
						        <option value="042">042</option>
						       <option value="052">052</option>
						       <option value="044">044</option>
						       <option value="031">031</option>
						       <option value="033">033</option>
						        <option value="043">043</option>
						       <option value="041">041</option>
						       <option value="063">063</option>
						       <option value="061">061</option>
						       <option value="054">054</option>
						       <option value="055">055</option>
						       <option value="064">064</option>
						     </select>
     						- <input type="number" name="ph2" size="5" min="000" max="9999"> 
     						- <input type="number" name="ph3" size="5" min="0000" max="9999"><br><br>
                    </div>
                </div>
                
                <div class="form-group" id="divmem_birthday">
                    <label for="inputmem_birthday" class="col-lg-2 control-label">생년월일</label>
                    <div class="col-lg-10">
					생년월일 : <select id ="birth_year" data-rule-required="true">
					    <c:forEach var="year" begin="1960" end="2022" >
					        <option>${year}</option>
					    </c:forEach>
					    </select>년
					    <input type='number' name="birth_month" id="month" min="1" max="12">월
					    <input type='number' name="birth_day" id="month" min="1" max="31">일
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputmem_gender" class="col-lg-2 control-label">성별</label>
                    <div class="col-lg-10">
                        <select class="form-control" id="mem_gender" name="mem_gender">
                            <option value="0">남</option>
                            <option value="1">여</option>
                        </select>
                    </div>
                </div>
                    <div class="form-group">
                    <label for="inputregionDTO" class="col-lg-2 control-label">관심지역</label>
                    <div class="col-lg-10">
                        <select class="form-control" name="region_num">
                            <option value="1">서울/경기도</option>
                            <option value="2">강원도</option>
                            <option value="3">충청북도</option>
                            <option value="4">충청남도</option>
                            <option value="5">전라북도</option>
                            <option value="6">전라남도</option>
                            <option value="7">경상북도</option>
                            <option value="8">경상남도</option>
                            <option value="9">제주도</option>
                        </select>
             
                    </div>
                </div>
                <div class="form-group" id="divmem_summary" >
                    <label for="inputmem_summary" class="col-lg-2 control-label">자기소개 요약</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control " id="mem_summary" name="mem_summary" data-rule-required="true" placeholder="자기소개를 한줄요약으로 적어주세요." maxlength="20" required>
                    </div>
                </div>
                <div class="form-group" id="divmem_introduce">
                    <label for="inputmem_introduce" class="col-lg-2 control-label">자기소개</label>
                    <div class="col-lg-10">
                        <textarea class="form-control" id="mem_introduce" name="mem_introduce" data-rule-required="true" placeholder="자기소개를 적어주세요" rows="5" required></textarea>
                    </div>
                </div>
                <div class="form-group" id="divmem_accept_email">
                    <label for="inputmem_accept_email" class="col-lg-2 control-label">이메일 수신여부</label>
                    <div class="col-lg-10" name="mem_accept_eamil" >
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_eamil" name="mem_accept_eamil" value="0" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_email" name="mem_accept_eamil" value="1"> 동의하지 않습니다.
                        </label>
                    </div>
                </div>
                <div class="form-group" id="divmem_accept_phone">
                    <label for="inputmem_accept_phone" class="col-lg-2 control-label">SMS 수신여부</label>
                    <div class="col-lg-10">
                        <label class="radio-inline" name="mem_accept_phone">
                            <input type="radio" id="mem_accept_phone" name="mem_accept_phone" value="0" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_phone" name="mem_accept_phone" value="1"> 동의하지 않습니다.
                        </label>
                    </div>
                </div>
                <div class="form-group" id="divmem_accept_privacy">
                    <label for="inputmem_accept_privacy" class="col-lg-2 control-label">개인정보 제공 동의 여부</label>
                    <div class="col-lg-10" id="mem_accept_privacy">
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_privacy" name="mem_accept_privacy" value="0" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_privacy" name="mem_accept_privacy" value="1"> 동의하지 않습니다.
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button  class="btn btn-success" onclick="checkLogin()">회원가입</button>
                    </div>
                </div>
            </form>

        
        
      
                <!--// 본문 들어가는 부분 -->
            <hr/>
        </div>
</body>  
<<<<<<< HEAD
<<<<<<< HEAD:CarCamping/src/main/webapp/WEB-INF/views/login/sign2.jsp
=======
>>>>>>>> 정민(로그인):CarCamping (12)/src/main/webapp/WEB-INF/views/login/sign2.jsp
>>>>>>> 정민(로그인):CarCamping (12)/src/main/webapp/WEB-INF/views/login/sign2.jsp
=======
>>>>>>> 혜성(리뷰)
</html>