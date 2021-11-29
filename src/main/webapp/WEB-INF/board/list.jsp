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
	<table border="1">
		<tr>
		<td>날짜</td><td>제목</td><td>글쓴이</td><td>내용</td>
		</tr>
		<c:forEach items="${list}" var="board">
			<tr><td>${board.created}</td><td>${board.subject}</td><td>${board.writer}</td><td>${board.contents}</td></tr>
		</c:forEach>
	</table>
	<a href="insert">글작성</a>
</body>
</html>