<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
			var pass = document.getElementById('pass').value;

			console.log("pass   " + pass);

			if (pass == null || pass == 'nul' || pass == 'undefined'
					|| pass == '') {
				alert("비밀번호를 입력해주세요.");

				document.getElementById("pass").focus();
				return;
			} else {
				var pass_real = document.getElementById('real_pass').value
				console.log("pass_real   " + pass_real);

				if (pass != pass_real) {
					alert("비밀번호가 틀립니다.\n다시 입력해주세요.");

					document.getElementById("pass").focus();
					return;
				} else {
					if (check_value == 'update') {
						document.getElementById("subject").readOnly = false;
						document.getElementById("contents").readOnly = false;
						document.getElementById("writer").readOnly = false;

						document.getElementById("save_up").innerText = "저장하기";
						document.getElementById("save_up").setAttribute(
								"onClick", "button_cick('save')");
					} else if (check_value == 'delete') {
						var number = document.getElementById('number').value;
						console.log("number   " + number);
						location.href = "/delete?number=" + number;
					} else if (check_value == 'save') {
						var number = document.getElementById('number').value;
						var subject = document.getElementById("subject").value;
						var contents = document.getElementById("contents").value;
						var writer = document.getElementById("writer").value;

						console.log("subject   " + subject);
						console.log("contents   " + contents);
						console.log("writer   " + writer);

						location.href = "/update?number=" + number
								+ "&subject=" + subject + "&contents="
								+ contents + "&writer=" + writer;
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
	<div class="container">
		<c:forEach items="${list_detail}" var="board">
			<H1 class="display-3">
				<strong>게시판 - ${board.subject}</strong>
			</H1>
			<br>

			<form action="#" method="post">
				<input id="number" type="hidden" value="${board.number}">
				<button type="button" class="btn btn-outline-dark"
					style="float: right;" onclick="button_cick('delete');">삭제하기</button>
				<div class="form-group">
					<label
						style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;"
						for="subject">제목</label> <input id="subject" type="text"
						maxlength="200" name="subject" class="form-control"
						value="${board.subject}" readonly>
				</div>
				<br>

				<div class="form-group">
					<label
						style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;"
						for="contents">내용</label>
					<textarea id="contents" class="form-control" rows="10"
						name="contents" readonly>${board.contents}</textarea>
				</div>
				<br>

				<div class="form-group">
					<label
						style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;"
						for="writer">작성자</label> <input id="writer" style="width: 40%;"
						type="text" maxlength="200" name="writer" class="form-control"
						value="${board.writer}" readonly>
				</div>

				<div class="form-group">
					<label
						style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;"
						for="pass">비밀번호</label> <input id="pass" style="width: 40%;"
						type="password" maxlength="50" name="pass" class="form-control"
						placeholder="비밀번호를 입력해주세요." required> <input
						id="real_pass" type="hidden" value="${board.password}">
				</div>
				<br> <a class="btn btn-outline-dark" href="/list">뒤로가기</a>
				<button id="save_up" type="button" class="btn btn-outline-dark"
					style="float: right;" onclick="button_cick('update');">수정하기</button>
			</form>
		</c:forEach>

		<hr>
		<hr>

		<c:forEach items="${list_detail}" var="c_board">
			<form action="/c_insert" method="post" name="commentInsertForm">
				<input name="b_idx" id="b_idx" type="hidden" value="${c_board.number}">

				<div class="form-group">
					<label
						style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;"
						for="writer">작성자</label> <input id="c_writer" style="width: 40%;"
						type="text" maxlength="200" name="c_writer" class="form-control"
						placeholder="작성자를 입력해주세요." required>
				</div>

				<div class="form-group">
					<label
						style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;"
						for="contents">내용</label>
					<textarea id="c_contents" class="form-control" rows="2"
						name="c_contents" placeholder="내용을 입력해주세요"></textarea>
				</div>
				<br>
				
				<div class="form-group">
					<label
						style="font-size: calc(1.375rem + 0.5vw); font-weight: bold; line-height: 1.8;"
						for="pass">비밀번호</label> <input id="c_pass" style="width: 40%;"
						type="password" maxlength="50" name="c_pass" class="form-control"
						placeholder="비밀번호를 입력해주세요." required>
				</div>
				<br>
				<div class="form-group">
				<button type="submit" class="btn btn-outline-dark"
					name="commentInsertBtn" style="float: right;">제출하기</button>
				</div>
			</form>
		</c:forEach>
		<br><br><br>
		<div id="comment_list" class="form-group">
		</div>
		<br><br><br>
	</div>

	<script>
		$("#comment_list").load('/c_list?b_idx='+${list_number});
	</script>
</body>

</html>