<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>사용자정보</title>
		<link rel = "stylesheet" href = "/resources/css/bootstrap.css">
	</head>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		function button_cick(check_value) {
			var msg = "";
			
			if (check_value == 'delete') {
				msg = "탈퇴하시겠습니까?\n\n* 탈퇴시 사용자가 등록한 글이 모두 삭제됩니다.";	
			} else if (check_value == 'update') {
				msg = "수정하시겠습니까?";
			} else if (check_value == 'save') {
				msg = "저장하시겠습니까?";
			}
			
			var rtnVal = confirm(msg);
			
			if (rtnVal) {
				var pass = document.getElementById('pass').value;
				console.log("pass   "+pass);
				if (pass == null || pass == 'nul' || pass == 'undefined' || pass == '') {
					alert("비밀번호를 입력해주세요.");
															
					document.getElementById("pass").focus();
					return;
				} else {
					var pass_real = document.getElementById('real_pass').value
					console.log("pass_real   "+pass_real);
					
					if (pass != pass_real) {
						alert("비밀번호가 틀립니다.\n다시 입력해주세요.");
						
						document.getElementById("pass").focus();
						return;
					} else {
						if (check_value == 'update') { 
							document.getElementById("writer").readOnly = false;
							document.getElementById("pass_find").disabled = false;
							document.getElementById("pass_find_nm").readOnly = false;
							document.getElementById("pass").readOnly = true;
							
							document.getElementById("save_up").innerText = "저장하기";
							document.getElementById("save_up").setAttribute("onClick", "button_cick('save')");
						} else if (check_value == 'delete') {
							var id = document.getElementById('id').value;
							
							location.href="/User_Delete?id="+id;	
						} else if (check_value == 'save') {
							var id = document.getElementById('id').value;
							var Nick_Name = document.getElementById("writer").value;
							var Find_code = document.getElementById("pass_find").value;
							var Find_code_Nm = document.getElementById("pass_find_nm").value;
							
							if (Nick_Name == null || Nick_Name == 'nul' || Nick_Name == 'undefined' || Nick_Name == '') {
								alert("별명을 입력해주세요.");
								
								document.getElementById("writer").focus();
								return;
							} else if (Find_code == "none") {
								alert("질문을 선택해주세요.");
								
								document.getElementById("pass_find").focus();
								return;
							} else if (Find_code_Nm == null || Find_code_Nm == 'nul' || Find_code_Nm == 'undefined' || Find_code_Nm == '') {
								alert("질문답변을 입력해주세요.");
								
								document.getElementById("pass_find_nm").focus();
								return;
							}
							
							location.href="/User_Update?id="+id+"&writer="+Nick_Name+"&Find_code="+Find_code+"&Find_Nm="+Find_code_Nm;
						}	
					}
				}
			} else {
				return;
			}
		}
	</script>
	<body>
		<br/><br/><br/>
		<div class = "container">
		<c:forEach items="${User_Info}" var="User">
				<H1 class = "display-3"><strong>사용자 정보</strong></H1>
				<br>
				
				<form action="/User_add" method="post" >
					<div class="form-group">
						<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="subject">아이디</label> 
						<button type="button" class="btn btn-outline-dark" style = "float:right;" id = "validation" value = "탈퇴하기" onclick = "button_cick('delete');">탈퇴하기</button>
						<input id="id" type="text" maxlength="50" name="id" class="form-control" 
					    	value = "${User.ID}" readonly>
					</div>
					<br>
					
					<div class="form-group">
						<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="contents">비밀번호</label>
						<input id="pass" type="text" class="form-control" name="pass" maxlength="50"
						placeholder="비밀번호를 입력해주세요" required></input>
						<input id ="real_pass" type="hidden" value = "${User.PASSWORD}">
					</div>
					<br>
					
					<div class="form-group">
						<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="writer">별명</label>
						<input id="writer" type="text" maxlength="32" name="writer" class="form-control"  value = "${User.WRITER}"
					    	placeholder="닉네임을 입력해주세요." required readonly>
					</div>
					<br>
					
					<div class="form-group">
						<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="writer">질문</label>
						<select name="pass_find" id = "pass_find"  class="form-select" required disabled>
							<option value="none"> 선택 </option>
							<c:forEach items="${find_code}" var="Find_Code_value" varStatus="status">
								<option id = "${status.count}" value="${Find_Code_value.FIND_CODE}">${Find_Code_value.FIND_CODE_NM}</option>
							</c:forEach>
						 </select>
					</div>
					<br>
					
					<div class="form-group">
						<label style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;" for="writer">질문답변</label>
						<input id="pass_find_nm" type="text" maxlength="200" name="pass_find_nm" class="form-control" value = "${User.FIND_NM}"
					    	placeholder="해당하는 질문 답변을 해주세요." required readonly>
					</div>
					<br/><br/><br/>
					
					<a class = "btn btn-outline-dark" href ="/list">뒤로가기</a>
					<button id = "save_up" type="button" class="btn btn-outline-dark" style = "float:right;" onclick = "button_cick('update');">수정하기</button>
				</form>
			</c:forEach>			
		</div>
		
		<div id ="User_Find_Chk" style="display:none;">
			<script>
				<c:forEach items="${User_Info}" var="User">
					var value = new Array();
					<c:forEach items="${find_code}" var="Find_Code_value" varStatus="status">
						value[${status.index}] = "${Find_Code_value.FIND_CODE}";
					</c:forEach>
					for(var i = 0; i < value.length; i++)
						if (value[i] == "${User.FIND_CODE}") {
							document.getElementById(i+1).selected = "selected";
						}
				</c:forEach>
			</script>
		 </div>
	</body>
</html>