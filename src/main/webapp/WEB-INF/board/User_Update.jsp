<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>수정</title>
		<link rel = "stylesheet" href = "/resources/css/bootstrap.css">
	</head>
	<body>
		<script type="text/javascript">
			var msg = "수정되었습니다.\n확인 : 사용자정보로 이동\n취소 : 리스트로 이동";		
			var rtnVal = confirm(msg);
			
			if (!rtnVal) {
				location.href="/list";
			} else {
				var id = "${User_ID}";		
				
				location.href="/User_Detail?id="+id;
			}
		</script>
	</body>
</html>