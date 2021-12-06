<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>추가</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
</head>
<body>
	<script type="text/javascript">
		
	</script>
	<c:forEach items="${comment_List}" var="List">
			<hr>
			<div class="form-group">
			<label
				style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;"
				for="writer">작성자 - <input id="writer" style="width: 40%;     display:inline"
				type="text" maxlength="200" name="writer" class="form-control"
				value="${List.writer}" readonly></label>
		</div>

		<div class="form-group">
			<label
				style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;"
				for="contents">내용</label>
			<textarea id="contents" class="form-control" rows="3" name="contents"
				readonly>${List.contents}</textarea>
		</div>
		<hr>
	</c:forEach>
</body>
</html>