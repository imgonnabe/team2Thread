<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 창입니다.</title>
<link rel="stylesheet" href="./css/login.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">

//자바스크립트 입니당
  function check(){
	//alert("!")
	let msg = document.getElementById("msg");
	let id = document.getElementById("id");
	let pw = document.getElementById("pw");
	//alert(id.value);
	//alert(id.value.length);
	if(id.value.length < 3){
		alert("아이디는 3글자 이상이여야 합니다.");
		msg.innerHTML = text;
		id.focus();
		return false;
	}
	if(pw.value.length < 3){
		alert("암호는 3글자 이상이여야 합니다.");
		pw.focus();
		return false;
	}
	//이거랑 ResttController에 있는 checkLogin함수는 오류나면 지우겠슴다
	if(id.value.length > 3 && pw.value.length > 3){
		$(function(){
			let id = $("#id").val();
			let pw = $("#pw").val();
		$.ajax({
			url : "./checkLogin",
			type : "post",
			data : {id : id, pw : pw},
			dataType : "json",
			success : function(data){
				if(data.result == 1){
					
					return true;
				}else{
					alert("아이디와 비밀번호를 확인해주세요");
					
					return false;
					}
				
				/* else{
				} */
				
				
			/* 	if(data.result == 0){
					
					return true;	
				} */
				
			},
			error : function(error){
				alert("값을 못받아옴 ㅠㅠ");
				return false;
			}
			
		});
		
			});
		
		
	}

}

	


</script>
</head>
<body style="background-color: #fffbe6;">

<div class="lg-img">
		<img alt="" src="./img/Threads_logo.png" height="60px">
	</div>
	<br>
<%@ include file="menu.jsp"%>
<hr>
<div  class="bigh1">
<div class="Lname">
<h1>Login</h1>
</div>
	<form action="./login" method="post" onsubmit="return check()" >	
	<div>
	<img class="loginhuman" alt="로그인사람" src="./img/loginhuman.png">
	<input type="text" name="id" id="id" placeholder="Username" >
	</div>
	<div>
	<img class="loginkey" alt="로그인키" src="./img/loginkey.png">
	<input type="password" name="pw" id="pw" placeholder="●●●●●" >
	</div><div>
	<span id="msg"></span></div>
	<br>
	<button type="submit" class="join">로그인</button>
	</form>
	<br>
	<form action="./join" method="get">
	<button type="submit" class="join">회원가입</button>
	</form>
	<br>
	<form action="./findID" method="get">
	<button type="submit" class="join">아이디 찾기</button>
	</form>
	<br>
	<form action="./findPW" method="get">
	<button type="submit" class="join">비밀번호 찾기</button>
	</form>
</div>
</body>
</html>