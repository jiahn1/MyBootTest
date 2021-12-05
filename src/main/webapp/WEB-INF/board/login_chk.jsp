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
			alert("아이디 혹은 비밀번호가 다릅니다.\n다시 입력해주세요.");
		} else {
			alert("로그인되었습니다.");
			
			window.opener.location.href = "/list";
			window.close();
		}
		</script>		
	</body>
</html>