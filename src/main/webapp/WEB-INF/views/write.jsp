<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 스레드</title>
<link rel="stylesheet" href="./css/write.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 버튼 클릭하면 새로운 스레드 생성
		$(".okbtn").click(function(){
			var newText = $('<textarea cols="100" rows="8" maxlength="500" name="content" class="content" required="required" placeholder="스레드를 시작하세요..."></textarea><br>');
		    $('.container').append(newText);
		});
		  
	   // 글썼을 때 내용이 없으면
	   $(document).on('click', '.writebtn', function() {
		var contents = document.getElementsByClassName('content');
		for (var i = 0; i < contents.length; i++) {
			if (contents[i].value.length < 1){
				alert("내용을 입력하세요.");
				contents[i].focus();
				return false;
			 }
		 }
	 });
	  
	  //글쓰기 버튼 클릭
	  $('.writebtn').click(function() {
		  // event.preventDefault(); // 바로 화면이 갱신되지 않음
		  // function(event) 매개변수에 event를 적어야 한다.
		  // button의 type이 submit이라면 바로 submit되는 것을 방지하고자 적어야 한다.
		  // button의 type이 button이기 때문에 적지 않아도 된다.
			
	      var contents = []; // textarea 내용을 저장할 배열
	      var contentsValid = true; // 모든 내용이 유효한지 여부
	      
	      $('.content').each(function() {// '.content' 요소마다 반복 수행
	    	    var contentValue = $(this).val();
	    	    if(!contentValue){
					 contentsValid = false;
			         return false; // 반복 중단
				}
	    	    contents.push({ 
	    	    	contentKey : contentValue
	    	    });
	    	    
	      });
	      
	      if (!contentsValid) {
	    	  alert("내용을 입력하세요.");
		      return false; // AJAX 요청 막음
		    }
	      
	      var jsonData = JSON.stringify(contents); // JSON으로 변환
	       // jackson dependency 추가해야 한다.
	      
	      $.ajax({
	    	 url:'./write',
	    	 type:'post',
	    	 data:jsonData,// 보낼 데이터의 자료형
	         contentType: 'application/json', // JSON 데이터 형식, 'json'으로 적어도 된다.
	         // MIME 타입 : 이진 데이터 / json
	         // 인코딩(바이너리 파일 > 텍스트 파일)하고 있는 데이터 종류를 지정
	    	 dataType:'json',// 서버에서 받아올 데이터의 자료형
	    	 success:function(data){
	    		 if(data.result == 1){
	    			 location.href = 'thread';
	    		 } else{
	    			 alert("실패입니다. 다시 시도해주세요.");
	    		 }
	    	 },
	    	 error:function(error){
	    		 alert("에러입니다. 다시 시도해주세요.");
	    	 }
	      });
	  });
	 });
</script>
</head>
<body>
<body style="background-color: #fffbe6;">

	<div class="lg-img">
		<img alt="" src="./img/Threads_logo.png" height="60px">
	</div>
	<br>
<%@ include file="menu.jsp"%>
	<h1>새로운 스레드</h1>
	<hr>
	<div id="thread">
		<img alt="" src="./img/profile.png">
		<div id="m_id">${sessionScope.mid }</div>
		<div class="container">
			<textarea cols="100" rows="8" maxlength="500" name="content"
			class="content" placeholder="스레드를 시작하세요..."></textarea>
			<br>
		</div>
	</div>
	<button type="button" class="okbtn btn">새로운 스레드</button>
	<button type="button" class="writebtn btn">게시</button>
</body>
</html>