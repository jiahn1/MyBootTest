<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>신규가입</title>
		<link rel = "stylesheet" href = "/resources/css/bootstrap.css">
	</head>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		function button_cick(check_value) {
			if (check_value == 'validation') {
				var id = document.getElementById('id').value;
				
				if (id == null || id == 'nul' || id == 'undefined' || id == '') {
					alert("아이디를 입력해주세요.");
															
					document.getElementById("id").focus();
					return;
				}
				
				$("#validation_chk").load('/validation_chk?id='+id);
			}	
		}
	</script>
	<body>
		<br/><br/><br/>
		<div class = "container">
			<H1 class = "display-3"><strong>신규가입</strong></H1>
			<br>
			
			<form action="/User_add" method="post" >
				<div class="form-group">
					<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="subject">아이디</label> 
					<button type="button" class="btn btn-outline-dark" style = "float:right;" id = "validation" value = "중복확인" onclick = "button_cick('validation');">중복확인</button>
					<input id="id" type="text" maxlength="50" name="id" class="form-control" 
				    	placeholder="아이디를 입력해주세요." required>
				</div>
				<br>
				
				<div class="form-group">
					<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="contents">비밀번호</label>
					<input id="pass" type="text" class="form-control" name="pass" maxlength="50"
					placeholder="비밀번호를 입력해주세요" ></input>
				</div>
				<br>
				
				<div class="form-group">
					<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="writer">별명</label>
					<input id="writer" type="text" maxlength="32" name="writer" class="form-control" 
				    	placeholder="닉네임을 입력해주세요." required>
				</div>
				<br>
				
				<div class="form-group">
					<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="writer">질문</label>
					<select name="pass_find" id = "pass_find"  class="form-select">
						<option value="none"> 선택 </option>
						<c:forEach items="${find_code}" var="Find_Code_value">
							<option value="${Find_Code_value.FIND_CODE}">${Find_Code_value.FIND_CODE_NM}</option>
						</c:forEach>
					 </select>
				</div>
				<br>
				
				<div class="form-group">
					<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="writer">질문답변</label>
					<input id="pass_find_nm" type="text" maxlength="200" name="pass_find_nm" class="form-control" 
				    	placeholder="해당하는 질문 답변을 해주세요." required>
				</div>
				<br/><br/><br/>
				
				<a class = "btn btn-outline-dark" href ="/list">뒤로가기</a>
				<button id = "insert" type="submit" class="btn btn-outline-dark" style = "float:right;" disabled>가입하기</button>
			</form>			
		</div>
		<div id ="validation_chk" style="display:none;"> </div>
	</body>
</html>