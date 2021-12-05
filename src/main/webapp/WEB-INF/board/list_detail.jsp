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
	<script>
		function button_cick(check_value) {
			var msg = "";
			
			if (check_value == 'delete') {
				msg = "삭제하시겠습니까?";	
			} else if (check_value == 'update') {
				msg = "수정하시겠습니까?";
			} else if (check_value == 'save') {
				msg = "저장하시겠습니까?";
			}
			
			var rtnVal = confirm(msg);
			
			if (rtnVal) {
				if (check_value == 'update') { 
					document.getElementById("subject").readOnly = false;
					document.getElementById("contents").readOnly = false;
					
					document.getElementById("save_up").innerText = "저장하기";
					document.getElementById("save_up").setAttribute("onClick", "button_cick('save')");
				} else if (check_value == 'delete') {
					var number = document.getElementById('number').value;
					console.log("number   "+number);
					location.href="/delete?number="+number;
				} else if (check_value == 'save') {
					var number = document.getElementById('number').value;
					var subject =  document.getElementById("subject").value;
					var contents =  document.getElementById("contents").value;
					var writer =  document.getElementById("writer").value;
					
					if (subject == null || subject == 'nul' || subject == 'undefined' || subject == '') {
						alert("제목을 선택해주세요.");
						
						document.getElementById("subject").focus();
						
						return;
					} 
					
					location.href="/update?number="+number+"&subject="+subject+"&contents="+contents+"&writer="+writer;
				}
			} else {
				return;
			}
		}
	</script>
	<body>
		<br/><br/><br/>
		<div class = "container">			
			<c:forEach items="${list_detail}" var="board">
				<H1 class = "display-3"><strong>게시판 - ${board.SUBJECT}</strong></H1>
				<br>
			
				<form action="#" method="post" >
					<input id ="number" type="hidden" value = "${board.NUMBER}">
					<button id ="btn_del" type="button" class="btn btn-outline-dark" style = "float:right;" onclick = "button_cick('delete');">삭제하기</button>
					
					<div class="form-group">
						<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="subject">제목</label>
						<input id="subject" type="text" maxlength="200" name="subject" class="form-control" 
						       value = "${board.SUBJECT}" readonly>
					</div>
					<br>
					
					<div class="form-group">
						<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="contents">내용</label>
						<textarea id="contents" class="form-control" rows="10" name="contents" 
						readonly>${board.CONTENTS}</textarea>
					</div>
					<br>
					
					<div class="form-group">
						<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="writer">작성자</label>
						<input id="writer" type="text" maxlength="32" name="writer" class="form-control" 
					    	value = "${board.WRITER}" readonly>
					</div>
					<br/><br/><br/>
					
					<a class = "btn btn-outline-dark" href ="/list">뒤로가기</a>
					<button id = "save_up" type="button" class="btn btn-outline-dark" style = "float:right;" onclick = "button_cick('update');">수정하기</button>
				</form>
				<script>
					if ("${User_Info}" == '[]' || "${board.ID}" != "${User_ID}") {
						document.getElementById("btn_del").hidden = "hidden";
						document.getElementById("save_up").hidden = "hidden";
					}
				</script>	
			</c:forEach>
		</div>
	</body>
</html>