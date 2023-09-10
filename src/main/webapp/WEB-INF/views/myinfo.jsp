<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/myinfo.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".followList").hide();
	$(".followBtn").click(function(){
		$(".followList").hide('slow');
		$(".followList").text('팔로워 리스트 입니다.');
		$(".checkF").hide();
	});
	
	$(".checkF").click(function(){
	let id = $(".ttid").html();
	
	$.ajax({
	
		url : "./followList",
		type : "post",
		data : {id : id},
		dataType : "json",
		success : function(data){
			
		   
		 
		    for (let i = 0; i < data.follower.length; i++) {
		        // span 태그 생성 및 내용 추가
		        $(".followList").append('<br>');
		     $(".followList").append(data.follower[i].m_id2);
		     
		     


		      
		    }
			$(".followList").show('slow');
			$(".checkF").attr("disabled", true);
		},
		error : function(error){
			alert("ㅠㅠ");
		}
	});
	
	});
});
</script>

<style type="text/css">
.followList{
width: 200px;
height: 300px;
background-color: orange;
}
.followBtn{
float: right;
margin-top:240px;

}
</style>
</head>
<body style="background-color: #fffbe6;">

	<div class="lg-img">
		<img alt="" src="./img/Threads_logo.png" height="60px">
	</div>
	<br>
	<%@ include file="menu.jsp"%>
	<hr>

	마이페이지 꾸미기
	<div class="ttid">${result.m_id }</div>
	${result.m_intro }
	
	<br>
	당신의 팔로워 숫자는 : ${result.fcount }	<input class="checkF" type="button" value="팔로워 확인하기">
	<br>
	
<button class ="profile" onclick="location.href='./profile'">프로필편집</button>
	<div class="followList">팔로워 리스트 입니다.
		<button class="followBtn">닫기</button>
	</div>

	
	<table>
			<c:forEach items="${mylist }" var="row">
				<tr>
				<tr>
					<td class="tid">${row.m_id }</td>
					<td class="tdate">${row.bdate }</td>
				</tr>
				<tr onclick="location.href='./comment?bno=${row.bno }'">
					<td class="tcont">
					<c:set var="original" value="${row.bcontent}" />
					<c:set var="c1" value="[" />
					<c:set var="r1" value="<br>" />
					<c:set var="c2" value="]" />
					<c:set var="r2" value="<br>" />
					
					<c:set var="m1" value="${fn:replace(original, c1, r1)}" />
					<c:set var="m2" value="${fn:replace(m1, c2, r2)}" />
					
					${m2}
					
					</td>
				</tr>
				<tr>
					<td><img alt="" src="./img/like.png" height="20px"> 좋아요${row.blike }개  <img alt="" src="./img/comment.png" height="20px"> 답글${row.commentcount }개</td>
				</tr>
			</c:forEach>
		</table>
	
</body>
</html>