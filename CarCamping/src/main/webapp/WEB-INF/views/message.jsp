<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	alert("${msg}")
	location.href="${url}"
<<<<<<< HEAD
	
</script>
=======
	opener.parent.location.reload();
	window.close();
</script>
>>>>>>> 재영(관리자)
