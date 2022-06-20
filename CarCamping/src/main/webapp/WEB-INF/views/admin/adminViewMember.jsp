<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<script>
	function con(){
		var con1 = window.confirm('정말 수정하시겠습니까?')
		if (con1){
			document.viewMember.submit()
		}
	}
</script>

<body>
	<div align="center">
		<form name="viewMember" method="post" action="adminViewMember.admin" enctype="multipart/form-data">
		<input type = "hidden" name="mem_num" value="${mdto.mem_num}">
		<table class="table table-sm">
			<tr>
				<th>프로필 이미지</th>
				<td><img src="${upPath}/images/member/${mdto.mem_image}"></td>
			</tr>
			<tr>
				<th>
					ID
				</th>
				<td>
					${mdto.mem_id}
				</td>	
			</tr>
			<tr>
				<th>
					EMAIL
				</th>
				<td>
					${mdto.mem_email}
				</td>
			</tr>
			<tr>
				<th>
					이름
				</th>
				<td>
					${mdto.mem_userName}
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${mdto.mem_nickName}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${mdto.mem_phone}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${mdto.mem_birthday}</td>
			</tr>
			<tr>
				<th>성별</th>
				<c:if test="${mdto.mem_gender==0}">
					<td>남자</td>
				</c:if>
				<c:if test="${mdto.mem_gender==1}">
					<td>여자</td>
				</c:if>
			</tr>
			<tr>
				<th>관심지역</th>
				<td>${mdto.regionDTO.region_name}</td>
			</tr>
			<tr>
				<th>회원 포인트</th>
				<td>${mdto.mem_point}</td>
			</tr>
			<tr>
				<th>회원 등록일</th>
				<td>${mdto.mem_sysdate}</td>
			</tr>
			<tr>
				<th>자기 소개 요약</th>
				<td>${mdto.mem_summary}</td>
			</tr>
			<tr>
				<th>자기 소개</th>
				<td>${mdto.mem_introduce}</td>
			</tr>
			<tr>
				<th>이메일 수신여부</th>
				<c:if test="${mdto.mem_accept_email==0}">
					<td>예</td>
				</c:if>
				<c:if test="${mdto.mem_accept_email==1}">
					<td>아니오</td>
				</c:if>
			</tr>
			<tr>
				<th>문자 수신여부</th>
				<c:if test="${mdto.mem_accept_phone==0}">
					<td>예</td>
				</c:if>
				<c:if test="${mdto.mem_accept_phone==1}">
					<td>아니오</td>
				</c:if>
			</tr>
			<tr>
				<th>개인정보 제공 동의 수신여부</th>
				<c:if test="${mdto.mem_accept_privacy==0}">
					<td>예</td>
				</c:if>
				<c:if test="${mdto.mem_accept_privacy==1}">
					<td>아니오</td>
				</c:if>
			</tr>
			<tr>
				<th>첫 리뷰 작성여부</th>
				<c:if test="${mdto.mem_firstReview==0}">
					<td>예</td>
				</c:if>
				<c:if test="${mdto.mem_firstReview==1}">
					<td>아니오</td>
				</c:if>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<c:if test="${mdto.mem_denied==0}">
						<input type="checkbox" name="denied" checked>
					</c:if>
					<c:if test="${mdto.mem_denied==1}">
						<input type="checkbox" name="denied">
					</c:if>
					<button type="button" class="btn btn-primary" onclick="location.href='javascript:con()'">체크시 제한</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>