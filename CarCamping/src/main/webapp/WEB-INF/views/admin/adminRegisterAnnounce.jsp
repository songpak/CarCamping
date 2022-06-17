<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용품 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div align="center">
		<form name="registerAnnounce" method="post" action="adminRegisterAnnounce.admin" enctype="multipart/form-data">
		<table class="table table-success table-striped">
			<tr>
				<th>
					제목
				</th>
				<td>
					<input type="text" name="aa_title">
				</td>
			</tr>
			<tr>
				<th>
					내용
				</th>
				<td>
					<textarea name="aa_content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
						<input class="form-control" id="formFileMultiple" type="file"
							name="aa_image" multiple accept="image/*">
						<div id="passwordHelpBlock" class="form-text">
							최대 5개 이미지 업로드 가능			
							</div>
						<ul id="file-list">
							<li class="no-items"></li>
						</ul>

						<script>
							var filesUpload = document
									.getElementById("formFileMultiple"), fileList = document
									.getElementById("file-list");

							function traverseFiles(files) {
								var li, file, fileInfo;
								fileList.innerHTML = "";

								for (var i = 0, il = files.length; i < il; i++) {
									li = document.createElement("li");
									file = files[i];
									fileInfo = "<div><strong>파일명:</strong> "
											+ file.name + "</div>";

									li.innerHTML = fileInfo;
									fileList.appendChild(li);
								}
								;
							};

							filesUpload.onchange = function() {
								traverseFiles(this.files);
							};
						</script>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="reset" value="취소">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>