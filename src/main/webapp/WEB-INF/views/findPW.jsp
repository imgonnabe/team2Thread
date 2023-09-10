<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".loginbtn").hide();
	
	$(".pwbtn").click(function(){
		
		let id = $("#id").val();
		let birth = $("#birth").val();
		
		//alert("아이디 : " + id + "/ 생일 : " + birth);
		
		$.ajax({
			url : "./findPW",
			type : "post",
			data : {id : id, birth : birth},
			dataType : "json",
			success : function(data){
				
				if(data.newPW != null){
				$(".msg").text("임시 비밀번호는" + data.newPW + "입니다.");
				$(".pwbtn").hide();
				$(".loginbtn").show();	
				}else{
					$(".msg").text("아이디와 비밀번호를 다시 입력해주세요.");
				}
			},
			error : function(error){
				alert("데이터가 안와요 ㅠㅠ");
				
			}
		});
	})
});




</script>
</head>
<body style="background-color: #fffbe6;">
<body>
<h1>비밀번호 찾기</h1>
<div>아이디와 생년월일을 입력해주세요</div>
<div>
<form action="./findPW" method="post"></form>
	<div>
		<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요.">
	</div>
	<div>
		<input type="date" name="birth" id="birth">
	</div>
		<button type="submit" class="pwbtn">비밀번호 찾기</button>
	<span class="msg"></span>
	<div class="loginbtn">
	<form action="./login" method="get">
		<button type="submit" >로그인하러 가기</button>
	</form>
	</div>
</div>

</body>
</html>