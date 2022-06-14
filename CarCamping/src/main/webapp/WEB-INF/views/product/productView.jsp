<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
        function popup(){
            var url = "productReviewView.product";
            var name = "popup test";
            var option = "width = 800, height = 1000, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        
       
		function popup1() {
			var url = "myPageContactUs.myPage";
			var name = "popup test";
			var option = "width = 600, height = 500, top = 100, left = 200, location = no"
			window.open(url, name, option);
		}
    </script>

<!-- 부트스트랩 영역 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">

<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<!-- 부트스트랩 영역 끝 -->

<html>
<form name="f" action="mall_cgProdList.do" method="post">
	<input type="hidden" name="cname" /> <input type="hidden" name="code" />
</form>
<body>
	<div align="center">
		<table border="1" width="100%" height="100%">
			<tr height="10%" rowspan="2">
				<td align="center"><font size="6">withCar</font></td>
				<td colspan="2" align="center"><a href="">로그인</a>|<a href="">글쓰기</a>
				</td>

			</tr>
			<tr height="80%">
				<td width="20%" valign="top" align="center"><img
					src="resources/images/carbak1.jpg" width="200" height="200" />
					<table>
						<tr>
							<td><script type="text/javascript">
		$("#mForm").submit(function(){
			var indate2 = $("#indate1").val();
			var outdate2 = $("#outdate1").val();
			var date1 = indate2.split('-');
			var in_date = new Date(indate2);
			var date2 = outdate2.split('-');
			var out_date = new Date(outdate2);
			
   			var date = new Date();
   			
	   		if(indate2 != ''){
	       		if(outdate2 != ''){
		    		if(date.getDate() <= in_date.getDate()){
		    			if(in_date.getDate() > out_date.getDate()){
		     				alert('반납날짜보다 빌린날짜가 먼저여야 합니다');
		     				return false;
		     			}
		    		}else {
		    			alert('지난 날짜는 선택 할 수 없습니다.');
		    			return false;
		    		}
	       		}else{
	       			alert('반납날짜를 지정해주세요');
	       			return false;
	       		}
	       	}else{
	       		alert('빌린날짜를 지정해주세요');
	       		return false;
	       	}
		});
	});
</script>
<style>
.search-box {
	width: fit-content;
	background-color: #ffffff;
	border-radius: 8px;
	padding: 25px;
	box-shadow: 0 2px 8px rgb(0 0 0/ 20%);
	box-sizing: border-box;
	margin: 0 auto;
}

.search-box input {
	border-radius: 5px;
	border: 1px solid #1f244d;
	line-height: 40px;
}

.search-box input[type="text"], .search-box input[type="date"] {
	text-indent: 5px;
}

.search-box>div {
	margin-right: 10px;
	font-size: 13px;
}
</style>
								<form name="f" action="myPageCart.myPage" method="post">
									<div style="width: 100%; padding: 50px 0; background: 262626;">
										<div class="row search-box">
											<div style="margin-bottom: 10px;">
												빌린날짜 <input type="date" id="indate1" name="indate"
													value="${indate}">
											</div>
											<div>
												반납날짜 <input type="date" id="outdate1" name="outdate"
													value="${outdate}">
											</div>
											<br> <br> <input type="submit" value="대여하기">
											<input type="button" onclick="location.href='javascript:popup1()'" value="문의하기">
										</div>
									</div>
								</form>
								
						</tr>
					</table></td>
				<td>
					<div align="center"
						style="overflow: scroll; width: 100%; height: 100%">
						<hr color="green" width="100%">
						<h2>리뷰 리스트</h2>

						<form name="f" method="post">
							<select name="search">
								<option selected value="rp_title">리뷰 제목</option>
								<option selected value="rp_content">리뷰 내용</option>
							</select> <input type="text" name="searchString">
							<button type="submit">검색하기</button>
						</form>
						
						<div align="left">
							<button onclick="location.href='productView.product'">전체보기</button>
						</div>
						<hr color="green" width="100%">
						<c:if test="${empty ReList}">
							<b>등록된 리뷰가 없습니다.</b>
							<br>
						</c:if>

						<table border="0" width="100%" align="center">
							<tr>
								<c:set var="count" value="0" />
								<c:forEach items="${ReList}" var="pdto">
									<td align="center"><img src="resources/images/carbak1.jpg"
										width="200" height="200"> <br>제목 : ${pdto.rp_title}<br>
										<font color="red"> <fmt:formatNumber
												value="${pdto.rp_score}" pattern="###,###" />
									</font>점<br> <font color="green">${pdto.rp_readCount}</font>번 조회<br>
										<a href="javascript:popup()"><button type="button"
												class="btn btn-primary" data-bs-toggle="modal">내용보기</button></a>
									</td>
									<c:set var="count" value="${count+1}" />

									<c:if test="${count%3==0}">
							</tr>
							<tr>
							</c:if>
							</c:forEach>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">Copyright © 2022 <a href="#">WITHCAR
						Co.</a> Ltd. All Rights Reserved. <br> Design: <a href="#">WITHCAR
						DESIGN TEAM</a> <br> MADE BY: <a href="#">WITHCAR TEAM</a></td>
			</tr>
		</table>
	</div>
</body>
</html>

