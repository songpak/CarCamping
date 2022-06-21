<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대리점 등록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div align="center">
		<form name="registerAgency" method="post"
			action="adminRegisterAgency.admin" enctype="multipart/form-data"
			class="row g-3 needs-validation" novalidate>
			<table class="table table-sm">
				<tr>
					<td>
						<div class="form-floating">
							<select name="region_num" class="form-select" id="floatingSelect">
								<c:forEach items="${adminListRegion}" var="dto">
									<option value="${dto.region_num}">${dto.region_name}</option>
								</c:forEach>
							</select> <label for="floatingSelect">지역</label>
						</div>
					<td>
						<div class="form-floating mb-3">
							<input type="text" name="agency_name" class="form-control"
								id="validationCustom01" maxlength="15" placeholder="1" required>
							<label for="validationCustom01">대리점명</label>
							<div id="validationCustom01" class="form-text">예) 서울 강북점</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="form-floating">
							<input type="text" name="agency_location" class="form-control"
								id="validationCustom02" maxlength="30" placeholder="1" required> <label
								for="validationCustom02">대리점 위치</label>
						</div>
						<div id="validationCustom02" class="form-text">예) 서울시 노원구
							한글비석로66..</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="form-floating">
							<input type="tel" name="agency_phone" class="form-control"
								id="validationCustom03" maxlength="15" placeholder="1"
								required> <label for="validationCustom03">대리점 번호</label>
						</div>
						<div id="validationCustom03" class="form-text">예)
							02-933-9933</div>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<button class="btn btn-primary" type="reset">취소</button>
						<button class="btn btn-primary" type="submit">등록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()
</script>
</html>