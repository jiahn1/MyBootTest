<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>게시판_추가</title>
		<link rel = "stylesheet" href = "/resources/css/bootstrap.css">
	</head>
	<body>
		<br/><br/><br/>
		<div class = "container">
			<H1 class = "display-3"><strong>게시판 작성</strong></H1>
			<br>
			<c:forEach items="${User_Info}" var="User">
				<form action="/insert" method="post" >
					<div class="form-group">
						<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="subject">제목</label>
						<input id="subject" type="text" maxlength="200" name="subject" class="form-control" 
					    	placeholder="제목을 입력해주세요." required>
					</div>
					<br>
					
					<div class="form-group">
						<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="contents">내용</label>
						<textarea id="contents" class="form-control" rows="10" name="contents" 
						placeholder="내용을 입력해주세요" ></textarea>
					</div>
					<br>
					
					<div class="form-group">
						<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="writer">작성자</label>
						<input id="writer" type="text" maxlength="32" name="writer" class="form-control" 
						value = "${User.WRITER}" readonly>
					</div>
					<input type="hidden" id="id" name="id" value="${User.ID}">
					<br/><br/><br/>
					
					<a class = "btn btn-outline-dark" href ="/list">뒤로가기</a>
					<button type="submit" class="btn btn-outline-dark" style = "float:right;">제출하기</button>
				</form>
			</c:forEach>			
		</div>
	</body>
</html>