<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<c:forEach items="${list}" var="board">
	
${board.created}, ${board.subject}, 	${board.writer}, 	${board.contents} <a href="delete?number=${board.number }">삭제</a><br>
	
	</c:forEach>
	<%-- ${list } --%>		
		
</body>
</html>