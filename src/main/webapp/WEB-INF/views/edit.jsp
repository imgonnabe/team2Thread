<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 스레드</title>
<link rel="stylesheet" href="./css/edit.css">
<script type="text/javascript">
function check() {
	let content = document.getElementsByClassName('content')[0];
	if (content.value.length < 1) {
		alert("내용을 입력하세요.");
		content.focus();
		return false;
	}
}
</script>
</head>
<body>
<body style="background-color: #fffbe6;">

	<div class="lg-img">
		<img alt="" src="./img/Threads_logo.png" height="60px">
	</div>
	<br>
	<%@ include file="menu.jsp"%>
	<h1>수정 스레드</h1>
	<hr>
	<form action="./edit" method="post" onsubmit="return check()">
		<div id="thread">
			<img alt="" src="./img/profile.png">
			<div id="m_id">${dto.m_id }</div>
			<div class="container">
				<textarea cols="100" rows="8" maxlength="500" name="bcontent"
				class="content" required="required" placeholder="스레드를 시작하세요...">${dto.bcontent }</textarea>
				<br>
			</div>
		<button type="submit" class="writebtn btn">게시</button>
		<input type="hidden" name="bno" value="${dto.bno }">
		</div>
	</form>
</body>
</html>