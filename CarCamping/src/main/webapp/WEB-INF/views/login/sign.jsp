<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <!-- Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<<<<<<< HEAD
    
  <script>  
    function checkLogin(){
     if(document.frm.mem_userName.value === "" || isNaN(frm.mem_userName.value) === false){ //isNaN에 의해서 숫자는 처리 불가
          frm.mem_userName.focus(); //request는 생략 가능(java)
          alert("이름을 입력해 주세요");
          return;
     }
     
     if(frm.mem_id.value === "" || frm.mem_id.value.length >= 15) {
          frm.mem_id.focus();
          alert("id는 1글자 이상, 15글자 이하로 입력해 주세요.")
          return;
     }
   
   if(frm.mem_password.value === "" ) {
             frm.mem_password.focus();
             alert("패스워드를 입력해 주세요.")
             return;
        }
     
     //정규 표현식으로 입력자료 검사
     var aa=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // 표준식
          // a부터 z까지 문자 1개 이상일 경우 and 숫자 0,1,2일 경우에만 / [^a-z, 0,1,2] : ^ 붙이면 부정의 뜻 
      if(!frm.email.value.match(aa)){
          alert("이메일을 정확히 입력해 주세요.");
           frm.email.focus();
           return;   
          }
          
			
     frm.action = "sign.login";
     frm.method = "post";
	 frm.enctype="multipart/form-data";
     frm.submit(); //서버에 파일로 전송(servlet, jsp)
     
     
     }

</script>


</head>
<body>
=======
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
           <script>

           $(function(){
               //모달을 전역변수로 선언
               var modalContents = $(".modal-contents");
               var modal = $("#defaultModal");
               
               $('.onlyAlphabetAndNumber').keyup(function(event){
                   if (!(event.keyCode >=37 && event.keyCode<=40)) {
                       var inputVal = $(this).val();
                       $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
                   }
               });
               
               $(".onlyHangul").keyup(function(event){
                   if (!(event.keyCode >=37 && event.keyCode<=40)) {
                       var inputVal = $(this).val();
                       $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                   }
               });
           
               $(".onlyNumber").keyup(function(event){
                   if (!(event.keyCode >=37 && event.keyCode<=40)) {
                       var inputVal = $(this).val();
                       $(this).val(inputVal.replace(/[^0-9]/gi,''));
                   }
               });
               
               //------- 검사하여 상태를 class에 적용
               $('#mem_id').keyup(function(event){
                   
                   var divId = $('#divmem_id');
                   
                   if($('#mem_id').val()==""){
                       divId.removeClass("has-success");
                       divId.addClass("has-error");
                   }else{
                       divId.removeClass("has-error");
                       divId.addClass("has-success");
                   }
               });
               
               $('#mem_email').keyup(function(event){
                   
                   var divEmail = $('#divmem_email');
                   
                   if($('#mem_email').val()==""){
                       divEmail.removeClass("has-success");
                       divEmail.addClass("has-error");
                   }else{
                       divEmail.removeClass("has-error");
                       divEmail.addClass("has-success");
                   }
               });
               
                $('#mem_password').keyup(function(event){
                   
                   var divPassword = $('#divmem_Password');
                   
                   if($('#mem_password').val()==""){
                       divPassword.removeClass("has-success");
                       divPassword.addClass("has-error");
                   }else{
                       divPassword.removeClass("has-error");
                       divPassword.addClass("has-success");
                   }
               });
               
               $('#mem_userName').keyup(function(event){
                   
                   var divName = $('#divmem_userName');
                   
                   if($.trim($('#mem_userName').val())==""){
                       divName.removeClass("has-success");
                       divName.addClass("has-error");
                   }else{
                       divName.removeClass("has-error");
                       divName.addClass("has-success");
                   }
               });
               
               $('#mem_nickname').keyup(function(event){
                   
                   var divNickname = $('#divmem_nickname');
                   
                   if($.trim($('#mem_nickname').val())==""){
                       divNickname.removeClass("has-success");
                       divNickname.addClass("has-error");
                   }else{
                       divNickname.removeClass("has-error");
                       divNickname.addClass("has-success");
                   }
               });
               
               $('#mem_image').keyup(function(event){
                   
                   var divImage = $('#divmem_image');
                   
                   if($.trim($('#mem_image').val())==""){
                       divImage.removeClass("has-success");
                       divImage.addClass("has-error");
                   }else{
                       divImage.removeClass("has-error");
                       divImage.addClass("has-success");
                   }
               });
               
               $('#mem_phone').keyup(function(event){
                   
                   var divPhone = $('#divmem_phone');
                   
                   if($.trim($('#mem_phone').val())==""){
                       divPhone.removeClass("has-success");
                       divPhone.addClass("has-error");
                   }else{
                       divPhone.removeClass("has-error");
                       divPhone.addClass("has-success");
                   }
               });
               
               
               //------- validation 검사
               $( "form" ).submit(function( event ) {
                   
                   var provision = $('#provision');
                   var memberInfo = $('#memberInfo');
                   var divId = $('#divmem_id');
                   var divEmail = $('#divmem_email');
                   var divPassword = $('#divmem_Password');
                   var divName = $('#divmem_userName');
                   var divNickname = $('#divmem_nickname');
                   var divImage = $('#divmem_image');
                   var divPhone = $('#divmem_phone');
                  
                   
                   //회원가입약관
                   if($('#provisionYn:checked').val()=="N"){
                       modalContents.text("회원가입약관에 동의하여 주시기 바랍니다."); //모달 메시지 입력
                       modal.modal('show'); //모달 띄우기
                       
                       provision.removeClass("has-success");
                       provision.addClass("has-error");
                       $('#provisionYn').focus();
                       return false;
                   }else{
                       provision.removeClass("has-error");
                       provision.addClass("has-success");
                   }
                   
                   //개인정보취급방침
                   if($('#memberInfoYn:checked').val()=="N"){
                       modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
                       modal.modal('show');
                       
                       memberInfo.removeClass("has-success");
                       memberInfo.addClass("has-error");
                       $('#memberInfoYn').focus();
                       return false;
                   }else{
                       memberInfo.removeClass("has-error");
                       memberInfo.addClass("has-success");
                   }
                  
                   
                   //아이디 검사
                   if($('#mem_id').val()==""){
                       modalContents.text("아이디를 입력하여 주시기 바랍니다.");
                       modal.modal('show');
                       
                       divmem_Id.removeClass("has-success");
                       divmem_Id.addClass("has-error");
                       $('#mem_id').focus();
                       return false;
                   }else{
                      divmem_Id.removeClass("has-error");
                      divmem_Id.addClass("has-success");
                   }
                   
                 //이메일
                   if($('#mem_email').val()==""){
                       modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                       modal.modal('show');
                       
                       divmem_email.removeClass("has-success");
                       divmem_email.addClass("has-error");
                       $('#mem_email').focus();
                       return;
                   }else{
                       divmem_email.removeClass("has-error");
                       divmem_email.addClass("has-success");
                   }
                   
                   //패스워드 검사
                   if($('#mem_password').val()==""){
                       modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
                       modal.modal('show');
                       
                       divmem_Password.removeClass("has-success");
                       divmem_Password.addClass("has-error");
                       $('#mem_password').focus();
                       return false;
                   }else{
                       divPassword.removeClass("has-error");
                       divPassword.addClass("has-success");
                   }
                   
                   //이름
                   if($('#mem_userName').val()==""){
                       modalContents.text("이름을 입력하여 주시기 바랍니다.");
                       modal.modal('show');
                       
                       divmem_userName.removeClass("has-success");
                       divmem_userName.addClass("has-error");
                       $('#mem_userName').focus();
                       return false;
                   }else{
                      divmem_userName.removeClass("has-error");
                      divmem_userName.addClass("has-success");
                   }
                   
                   //별명
                   if($('#mem_nickname').val()==""){
                       modalContents.text("별명을 입력하여 주시기 바랍니다.");
                       modal.modal('show');
                       
                       divuser_nickname.removeClass("has-success");
                       divuser_nickname.addClass("has-error");
                       $('#user_nickname').focus();
                       return false;
                   }else{
                       divuser_nickname.removeClass("has-error");
                       divuser_nickname.addClass("has-success");
                   }
                 
                   //이미지
                   if($('#mem_image').val()==""){
                       modalContents.text("이미지를 입력하여 주시기 바랍니다.");
                       modal.modal('show');
                       
                       divmem_image.removeClass("has-success");
                       divmem_image.addClass("has-error");
                       $('#mem_image').focus();
                       return false;
                   }else{
                       divmem_image.removeClass("has-error");
                       divmem_image.addClass("has-success");
                   }
                   //휴대폰 번호
                   if($('#mem_phone').val()==""){
                       modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                       modal.modal('show');
                       
                       divmem_phone.removeClass("has-success");
                       divmem_phone.addClass("has-error");
                       $('#mem_phone').focus();
                       return false;
                   }else{
                       divmem_phone.removeClass("has-error");
                       divmem_phone.addClass("has-success");
                   

                   }
                   document.signCheck.submit();
               
               });
               
           });
           
       </script> 

    
>>>>>>> e5e25226e1161b2cd0c5ff4e69f576d63934696b
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
                
 
 
<<<<<<< HEAD
            <form class="form-horizontal" role="form"  name= "frm" >
=======
            <form name = "signCheck" class="form-horizontal" role="form" method="post" action="sign.login" enctype="multipart/form-data">
>>>>>>> e5e25226e1161b2cd0c5ff4e69f576d63934696b
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
<<<<<<< HEAD
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="mem_id" name="mem_id" data-rule-required="true" placeholder="12자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="15">
=======
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="mem_id" name="mem_id" data-rule-required="true" placeholder="12자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="12" onkeydown="inputIdChk()" required>
                        <button type = "button" onclick = "fn_CheckId()" name="CheckId" class="CheckId">중복 확인</button>
                        <input type = "hidden" name="idDuplication" value="idUncheck"/>
>>>>>>> e5e25226e1161b2cd0c5ff4e69f576d63934696b
                    </div>
                </div><div class="form-group" id="divmem_email">
                    <label for="inputmem_email" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" class="form-control" id="mem_email" name="mem_email" data-rule-required="true" placeholder="이메일을 입력해주세요." maxlength="30" required>
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
<<<<<<< HEAD
                        <input type="text" class="form-control " id="mem_userName" name="mem_userName" data-rule-required="true" placeholder="한글 또는 영어로 입력해주세요." maxlength="10">
=======
                        <input type="text" class="form-control " id="mem_userName" name="mem_userName" data-rule-required="true" placeholder="한글 또는 영어로 입력해주세요." maxlength="10" required>
>>>>>>> e5e25226e1161b2cd0c5ff4e69f576d63934696b
                    </div>
                </div>
                <div class="form-group" id="divmem_nickname">
                    <label for="inputmem_nickname" class="col-lg-2 control-label">닉네임</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="mem_nickName" name="mem_nickName" data-rule-required="true" placeholder="닉네임" maxlength="30" required>
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
<<<<<<< HEAD
                        <input type="number" class="form-control onlyNumber" id="mem_phone" name="mem_phone" name="excludeHangul" data-rule-required="true" placeholder="-를 제외하고 입력하세요." maxlength="30">
=======
                        <input type="text" class="form-control onlyNumber" id="mem_phone" name="mem_phone" name="excludeHangul" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11" required>
>>>>>>> e5e25226e1161b2cd0c5ff4e69f576d63934696b
                    </div>
                </div>
                
                <div class="form-group" id="divmem_birthday">
                    <label for="inputmem_birthday" class="col-lg-2 control-label">생년월일</label>
                    <div class="col-lg-10">
<<<<<<< HEAD
                        <input type="number" class="form-control onlyNumber" id="mem_birthday" name="mem_birthday" data-rule-required="true" placeholder="-를 제외하고 6자로 입력하세요." maxlength="11">
=======
                        <input type="text" class="form-control onlyNumber" id="mem_birthday" name="mem_birthday" data-rule-required="true" placeholder="-를 제외하고 6자로 입력하세요." maxlength="6" required>
>>>>>>> e5e25226e1161b2cd0c5ff4e69f576d63934696b
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
                        <button type ="submit" class="btn btn-success" onclick="checkLogin()">회원가입</button>
                    </div>
                </div>
            </form>
<<<<<<< HEAD
        
        
      
                <!--// 본문 들어가는 부분 -->
            <hr/>
          
        </div>
    </body>  
=======
    </div>
</body>  
>>>>>>> e5e25226e1161b2cd0c5ff4e69f576d63934696b
</html>