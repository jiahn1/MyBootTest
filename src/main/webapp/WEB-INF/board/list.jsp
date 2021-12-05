<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import ="com.first.demo.controller.BoardController" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>게시판</title>
		<link rel = "stylesheet" href = "/resources/css/bootstrap.css">
	</head>
	<script>
		function button_cick(check_value) {
			if (check_value == "login") {
				var _width = '500';
			    var _height = '600';		    
				var _left = "";
				var _top = Math.ceil(( window.screen.height - _height )/2);
				
				if (window.screenLeft < 0) {
					_left = Math.ceil(( window.screen.width*-1 - _width)/2);
				} else {
					_left = Math.ceil((window.screen.width - _width)/2);
				}
				
				window.open("/login", "a", 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
			} else if (check_value == "insert") {
				
				var btn_name = document.getElementById('login').value;
				
				if (btn_name == "로그인") {
					alert('로그인 후 사용해주세요.');
					document.getElementById("login").focus();
					return;
				} else {
					location.href="/list_add";
				}
			} else if (check_value == "login_out") {
				location.href="/login_out";	
			}
		}
	</script>
	<body>
		<br/><br/><br/>
		<div class = "container">
			<H1 class = "display-3"><strong>게시판 - 김민성</strong></H1>
			<button type="button" class="btn btn-outline-dark" style = "float:right;" id = "login" value = "로그인" onclick = "button_cick('login');">로그인</button>
			<br/><br/>
			<a id ="User"></a>
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
							<td>${board.LEVEL_COUNT}</td>
							<td><a href ="/list_detail?number=${board.NUMBER}">${board.SUBJECT}</a></td>
							<td>${board.WRITER}</td>
							<td>${board.CREATED}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr/>
			
			<button id ="btn_Add" class = "btn btn-outline-dark" style = "float:right;" onclick = "button_cick('insert');">글쓰기</button>
			
			<div class = "text-center">
				<ul class = "pagination justify-content-center">
					<c:forEach items="${list_Count}" var="Count">				
						<c:forEach var="board_count_level" begin ="1" end="${Count.BOARD_COUNT}" varStatus="status">
							<li class="page-item "><a class="page-link" href ="/list?list_count=${status.count}"><c:out value="${status.count}"/></a></li>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id ="User_Info_value" style="display:none;">
			<c:forEach items="${User_Info}" var="User">
				<script>
					if ("${User_Info}" != '[]') {
						document.getElementById("login").innerText = "로그아웃";
						document.getElementById("login").value = "로그아웃";
						document.getElementById("login").setAttribute("onClick", "button_cick('login_out')");
						
						document.getElementById("User").innerText = "${User.WRITER}님 반갑습니다.";
						document.getElementById("User").style= "float:right";
						document.getElementById("User").href= "/User_Detail?id=${User.ID}";
					}
				</script>
			</c:forEach>
		 </div>
	</body>
</html>