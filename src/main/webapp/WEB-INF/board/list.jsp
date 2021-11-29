<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>게시판</title>
		<link rel = "stylesheet" href = "/resources/css/bootstrap.css">
	</head>
	<body>
		<br/><br/><br/>
		<div class = "container">
			<H1 class = "display-3"><strong>게시판 - 김민성</strong></H1>
			
			<table class ="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="board" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td><a href ="/list_detail?number=${board.number}">${board.subject}</a></td>
							<td>${board.writer}</td>
							<td>${board.created}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr/>
			
			<a class = "btn btn-outline-dark" style = "float:right;" href ="/list_add">글쓰기</a>
			
			<div class = "text-center">
				<ul class = "pagination justify-content-center">
					<c:forEach items="${list_Count}" var="Count">				
						<c:forEach var="board_count_level" begin ="1" end="${Count.board_count}" varStatus="status">
							<li class="page-item "><a class="page-link" href ="#"><c:out value="${status.count}"/></a></li>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
		</div>
	</body>
</html>