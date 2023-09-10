<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>프로필</title>
<link rel="stylesheet" href="./css/profile.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("#pwUpdate").on("click", function(){

        if($("#memberPw").val() == ""){
            alert("현재 비밀번호를 입력해주세요");
            $("#memberPw").focus();
            return false;
        }
        if($("#memberPw1").val() == ""){
            alert("변경비밀번호를 입력해주세요");
            $("#memberPw1").focus();
            return false;
        }
        if($("#memberPw2").val() == ""){
            alert("변경비밀번호를 입력해주세요");
            $("#memberPw2").focus();
            return false;
        }
        if ($("#memberPw1").val() != $("#memberPw2").val()) {
            alert("변경비밀번호가 일치하지 않습니다.");
            $("#memberPw2").focus();
            return false;
        }
        
        $.ajax({
            url: "./checkPW",
            type: "POST",
            dataType: "json",
            data: $("#pwUpdateForm").serializeArray(),
            success: function(data){
                if(data.result == 0){
                    alert("패스워드가 틀렸습니다.");
                    return;
                } else {
                    if(confirm("변경하시겠습니까?")){
                        $("#pwUpdateForm").submit();
                    }
                }
            }
        });
    });
});
	</script>
</head>
</head>

<body>
<body style="background-color: #fffbe6;">

	<div class="lg-img">
		<img alt="" src="./img/Threads_logo.png" height="60px">
	</div>
	<br>
	<%@ include file="menu.jsp"%>
	<hr>

	<h1>${dto.m_id}님</h1>

	<div class="profile-div">
		<form action="./changeinfo" method="post" id="changebox">
			<input type="text" name="intro" id="intro" value="${dto.m_intro}">

			<button class="btn" type="submit">수정</button>
			<input type="hidden" name="id" value="${dto.m_id}">
		</form>
	</div>

	<form action="./pwUpdate" method="post" id="pwUpdateForm"
		name="pwUpdateForm">
		<input type="hidden" id="id2" name="id"
			value="${dto.m_id}">
		<div class="col-sm-8 col-sm-offset-2">
			<div class="panel panel-default panel-margin-10">
				<div class="panel-body panel-body-content text-center">
					<p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
					<div class="form-group">
						<input type="password" name="memberPw" id="memberPw"
							class="form-control form-control-inline text-center"
							placeholder="현재 비밀번호" />
					</div>
					<div class="form-group">
						<input type="password" name="memberPw1" id="memberPw1"
							class="form-control form-control-inline text-center"
							placeholder="새 비밀번호" />
					</div>
					<div class="form-group">
						<input type="password" name="memberPw2" id="memberPw2"
							class="form-control form-control-inline text-center"
							placeholder="새 비밀번호 확인" />
					</div>
					<button type="button" id="pwUpdate" name="pwUpdate"
						class="btn btn-primary">비밀번호 변경</button>
					<a href="./myinfo" class="btn btn-default">취소</a>
				</div>
			</div>
		</div>
	</form>




</body>
</html>