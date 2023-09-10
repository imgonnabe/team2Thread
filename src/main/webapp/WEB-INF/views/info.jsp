<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

$(function(){
	

	$(".fbtn").click(function(){
	let tof = $(".tof").text();
	let fromf = $(".fromf").val();
	//alert(fromf);
	if(fromf != ""){
		if(confirm('팔로우 하시겠습니까?')){
			
		}else{
			return false;
		}
	$.ajax({
		url : "./follow",
		type : "post",
		data : {tof : tof , fromf : fromf},
		dataType : "json",
			success : function(data){
				if(data.result ==1 && data.result2 ==1 && data.result3 ==1){
					alert(tof + "님과 팔로우 되었습니다.");
					$(".fbtn").attr("type","text");
					$(".fbtn").attr("value","팔로우 되었습니다!");
					
				}
				else if(data.result ==0 && data.result2 ==0 && data.result3 ==0){
					alert("이미 팔로우했는데요?");
					$(".fbtn").attr("type","text");
					$(".fbtn").attr("value","팔로우 중입니다.");
				}else{
					alert("값이 안왔는데요?");
				}
			},
			error : function(error){
			alert("왜 안됌ㅠㅠ");
			}
	});
	
	}else{
		alert("팔로우 하시려면 로그인 해주세요");
		location.href='login';
	}
		
	
	});
	
	$(".fbtn2").click(function(){
		let tof = $(".tof").text();
		let fromf = $(".fromf").val();
		if(confirm("언팔로우 하시겠습니까?")){
			$.ajax({
				url : "./unFollow",
				type : "post",
				data : {tof : tof , fromf : fromf},
				dataType : "json",
				success : function(data){
					alert("언팔로우 되었습니다..................................................");
					$(".fbtn2").attr("type","text");
					$(".fbtn2").attr("value","새로고침 해주세요..............");
				},
				error : function(error){
					alert("ㅠㅠ");
				}
				
			});
			
		}else{
			alert("ㅠㅠ");
			return false;
		}
		
		
	});
	
	
});
</script>


</head>
<body style="background-color: #fffbe6;">

	<div class="lg-img">
		<img alt="" src="./img/Threads_logo.png" height="60px">
	</div>
	<br>
	<%@ include file="menu.jsp"%>
	<hr>


	<div class="tof">${info.m_id }</div>
	<h3>소개글  : ${info.m_intro }</h3>
<c:choose>
	<c:when test="${result eq 1}">
	<input type="button" class="fbtn2" value="언팔로우하기">
	<input class="fromf" value="${sessionScope.mid }"type="hidden">
	</c:when>
	<c:otherwise>
	<input type="button" class="fbtn" value="팔로우하기">
	<input class="fromf" value="${sessionScope.mid }"type="hidden">
	</c:otherwise>
	</c:choose>
	
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