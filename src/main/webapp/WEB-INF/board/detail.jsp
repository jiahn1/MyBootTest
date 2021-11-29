<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
글번호:${detail.number}   작성자:${detail.writer},   제목:${detail.subject}<br><br>
내용:<br><textarea cols="100" rows="20">${detail.contents}</textarea><br><br>
작성일:${detail.created}<br>
<a href="#">글삭제</a> <a href="#">글수정</a>
</body>
</html>