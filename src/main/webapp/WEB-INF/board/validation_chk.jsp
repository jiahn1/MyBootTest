<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>확인</title>
	</head>
	<body>
		<script type="text/javascript">
		if (${id_chk} == 0) {
			alert("확인되었습니다.");
			
			document.getElementById("insert").disabled = false;	
		} else {
			alert("아이디가 중복됩니다.\n아이디를 새로입력해주세요.");
			document.getElementById("insert").disabled = true;
			document.getElementById("id").focus();
		}
		</script>
	</body>
</html>