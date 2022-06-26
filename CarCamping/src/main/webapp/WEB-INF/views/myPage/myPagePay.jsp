<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%@ include file="../top.jsp"%>
<!-- mypage에서 회원탈퇴 페이지 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<div class="container" align="center"
	class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
	<h2 class="text-left">
		<b>기본 정보</b>
	</h2>


	<c:forEach items="${cartList}" var="mdto">
		<table class="table table-bordered">
			<tr>
				<th scope="col" width="30%" class="text-center">상점명</th>
				<td width="70%">WithCar(${mdto.agencyDTO.agency_name})</td>
			</tr>

			<tr>
				<th scope="col" width="30%" class="text-center">용품명</th>
				<td width="200" width="70%">${mdto.productDTO.prod_name }</td>

			</tr>
			<tr>
				<th scope="col" width="30%" class="text-center">대여기간</th>
				<td width="200" width="70%">${mdto.cart_from }~ ${mdto.cart_to }</td>

			</tr>
			<tr>
				<th scope="col" width="30%" class="text-center">물품갯수</th>
				<td width="200" width="70%">${mdto.cart_prodCount}개</td>

			</tr>
			<tr>
				<th scope="col" width="30%" class="text-center">결제금액</th>
				<td width="200" width="70%" class="text-danger">${mdto.productDTO.prod_price}원</td>
			</tr>
		</table>
	</c:forEach>
	<div style="float: right">
		<c:set var="cartTotalPrice" value="0" />
		<c:forEach items="${cartList}" var="mdto">
			<c:set var="cartTotalPrice"
				value="${cartTotalPrice + mdto.productDTO.prod_price * mdto.cart_prodCount}" />
		</c:forEach>
		<h3>총 결제금액</h3>
		<h1>${cartTotalPrice}원</h1>
	</div>

	<h2 class="text-left">
		<b>결제 정보</b>
	</h2>
	<table class="table table-bordered">
		<tr>
			<th scope="col" id="div1" width="30%" class="text-center"
				style="padding-top: 30px;">카드결제</th>
			<td width="70%"><input type="radio" name="신한" />신한 &nbsp; <input
				type="radio" name="비씨" />비씨 &nbsp; <input type="radio" name="KB국민" />KB국민
				&nbsp; <input type="radio" name="현대" />현대<br> <input
				type="radio" name="삼성" />삼성 &nbsp; <input type="radio" name="롯데" />롯데
				&nbsp; <input type="radio" name="NH채움" />NH채움 &nbsp; <input
				type="radio" name="외환" />외환<br> <input type="radio" name="하나SK" />하나
				&nbsp; <input type="radio" name="우리" />우리</td>
		</tr>

		<tr>
			<th scope="col" width="30%" class="text-center">할부개월</th>
			<td width="70%"><select name="할부개월">
					<option value="일시불">일시불</option>
					<option value="2개월">2개월</option>
					<option value="3개월">3개월</option>
					<option value="4개월">4개월</option>
					<option value="5개월">5개월</option>
					<option value="6개월">6개월</option>
					<option value="7개월">7개월</option>
					<option value="8개월">8개월</option>
					<option value="9개월">9개월</option>
					<option value="10개월">10개월</option>
					<option value="11개월">11개월</option>
					<option value="12개월">12개월</option>
			</select></td>

		</tr>
		<tr>
			<th align="center" scope="col" width="30%" class="text-center">카드번호</th>
			<td width="70%"><input type="text" name="카드번호"
				placeholder="예)1234567890123456"
				style="width: 300px; height: 30px; font-size: 13px;"></td>
		</tr>
		<tr>
			<th scope="col" width="30%" class="text-center">CVC 입력</th>
			<td width="70%"><input type="password" name="CVC"
				placeholder="***" style="width: 100px; height: 25px;"></td>
		</tr>
		<tr>
			<th scope="col" width="30%" class="text-center">유효기간 입력</th>
			<td width="70%">월 (Month) <input type="password" name="월"
				placeholder="**" style="width: 70px; height: 25px;"> 년
				(Year) <input type="password" name="년" placeholder="**"
				style="width: 70px; height: 25px;">
			</td>
		</tr>
	</table>
	<form action="myPageCheckOut.myPage" method="post">
	  <c:forEach items="${cartList}" var="mdto">
	  <input type="hidden" name= "cart_prodCount" value="${mdto.cart_prodCount}">
      <input type="hidden" name= "prod_num" value="${mdto.productDTO.prod_num }">
      <input type="hidden" name= "mem_num" value="${mdto.memberDTO.mem_num }">
      <input type="hidden" name= "prod_name" value="${mdto.productDTO.prod_name }">
        <input type="hidden" name= "agency_num" value="${mdto.agencyDTO.agency_num }">
      <input type="hidden" name= "cart_from" value="${mdto.cart_from }">
      <input type="hidden" name= "cart_to" value="${mdto.cart_to }">
        <input type="hidden" name= "rental_price" value="${cartTotalPrice}">
	  </c:forEach> 
		<button class="btn btn-lg btn-dark btn-block text-uppercase"
			type="submit" >
			결제하기</button>
	 </form> 
</div>

<%@ include file="../bottom.jsp"%>