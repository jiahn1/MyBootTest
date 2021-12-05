<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>로그인</title>
		<link rel = "stylesheet" href = "/resources/css/bootstrap.css">
	</head>
	<style>
		*{
		  margin: 0px;
		  padding: 0px;
		  text-decoration: none;
		  font-family:sans-serif;
		
		}
		
		body {
		  background-image: #34495e;
		}
		
		.loginForm {
		  position:absolute;
		  width:300px;
		  height:400px;
		  padding: 30px, 20px;
		  background-color:#FFFFFF;
		  text-align:center;
		  top:50%;
		  left:50%;
		  transform: translate(-50%,-50%);
		  border-radius: 15px;
		}
		
		.loginForm h2{
		  text-align: center;
		  margin: 30px;
		}
		
		.idForm{
		  border-bottom: 2px solid #adadad;
		  margin: 30px;
		  padding: 10px 10px;
		}
		
		.passForm{
		  border-bottom: 2px solid #adadad;
		  margin: 30px;
		  padding: 10px 10px;
		}
		
		.id {
		  width: 100%;
		  border:none;
		  outline:none;
		  color: #636e72;
		  font-size:16px;
		  height:25px;
		  background: none;
		}
		
		.pw {
		  width: 100%;
		  border:none;
		  outline:none;
		  color: #636e72;
		  font-size:16px;
		  height:25px;
		  background: none;
		}
		
		.btn {
		  position:relative;
		  left:40%;
		  transform: translateX(-50%);
		  margin-bottom: 40px;
		  width:80%;
		  height:40px;
		  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
		  background-position: left;
		  background-size: 200%;
		  color:white;
		  font-weight: bold;
		  border:none;
		  cursor:pointer;
		  transition: 0.4s;
		  display:inline;
		}
		
		.btn:hover {
		  background-position: right;
		}
		
		.bottomText {
		  text-align: center;
		}
	
	</style>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		function button_cick(check_value) {
			if (check_value == 'login') {
				var id = document.getElementById('id').value;
				var pass = document.getElementById('pass').value;
				
				if (id == null || id == 'nul' || id == 'undefined' || id == '') {
					alert("아이디를 입력해주세요.");
															
					document.getElementById("id").focus();
					return;
				} else if (pass == null || pass == 'nul' || pass == 'undefined' || pass == '') {
					alert("비밀번호를 입력해주세요.");
															
					document.getElementById("pass").focus();
					return;
				}
				
				$("#LoginCheck").load('/login_chk?id='+id+'&pass='+pass);
				
			} else if (check_value == 'user_add') {
				var msg = "회원가입을 하시겠습니까?"
				var rtnVal = confirm(msg);
				
				if (rtnVal) {
					window.opener.location.href="/login_add";
					window.close();
				}
			}
		}
	</script>

	<body>
		<div id="Login">
			<div class ="loginForm">
				<h2>Login</h2>
				<div class="idForm">		
					<input class="id"  id = "id" name = "id" type="text" placeholder="아이디" maxlength="50" required>
				</div>
				<div class="passForm">
					<input class="pw" id="pass" name = "pass" type="password"  placeholder="비밀번호" maxlength="50" required>
				</div>
				<div>
					<button class="btn" onclick="button_cick('login');">로그인</button>
				</div>
				<div class="bottomText">
			  		Don't you have ID? <a href="#" onClick="button_cick('user_add');">회원가입</a>
			  </div>
			</div>
		</div>
		
		<div id ="LoginCheck" style="display:none;"> </div>
	</body>
</html>