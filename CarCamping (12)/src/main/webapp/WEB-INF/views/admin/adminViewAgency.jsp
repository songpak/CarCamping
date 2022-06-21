<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대리점 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<script>
	function con(){
		var con1 = window.confirm('정말 수정하시겠습니까?')
		if (con1){
			document.viewAgency.submit()
		}
	}
	function con_delete(){
		var con2 = window.confirm('정말 삭제하시겠습니까?')
		if (con2){
			location.href="adminDeleteAgency.admin?agency_num="+${adto.agency_num}
		}
	}
</script>

<body>
	<div align="center">
		<form name="viewAgency" method="post" action="adminViewAgency.admin" enctype="multipart/form-data"
		class="row g-3 needs-validation" novalidate>
		<input type = "hidden" name="agency_num" value="${adto.agency_num}">
		<table class="table table-sm">
			<tr>
				<td align="center">
					<p class="h3"><strong>${adto.regionDTO.region_name}</strong></p>
				</td>
				<td>
					<div class="form-floating mb-3">
						<input type="text" name="agency_name" value="${adto.agency_name}" class="form-control"
								id="validationCustom01" maxlength="15" placeholder="1" required>
						<label for="validationCustom01">대리점명</label>
					</div>
				</td>	
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating">
						<input type="text" name="agency_location" value="${adto.agency_location}" class="form-control"
								id="validationCustom02" maxlength="30" placeholder="1" required>
						<label for="validationCustom02">대리점 위치</label>	
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating">
						<input type="text" name="agency_phone" value="${adto.agency_phone}" class="form-control"
								id="validationCustom03" maxlength="15" placeholder="1" required>
						<label for="validationCustom03">대리점 번호</label>	
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button type="reset" class="btn btn-primary">취소</button>
					<button type="button" class="btn btn-primary" onclick="location.href='javascript:con()'">수정</button>
					<button type="button" class="btn btn-primary" onclick="location.href='javascript:con_delete()'">삭제</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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