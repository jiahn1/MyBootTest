<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
	<form method="post" action="insertProc">
	<br>
	글제목 : <input type="text" name="subject"><br>
	작성자 : <input type="text" name="writer"><br>
	글내용 : <textarea rows="10" cols="30" name="contents"></textarea><br>
	비밀번호 : <input type="text" name="password"><br>
	<input type="submit" value="글작성">
	</form>
</body>
</html>