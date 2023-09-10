<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thread</title>
<link rel="stylesheet" href="./css/thread.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<script type="text/javascript">
	function linkPage(pageNo) {
		location.href = "./thread?pageNo=" + pageNo;
	}
</script>


<body style="background-color: #fffbe6;">

	<div class="lg-img">
		<img alt="" src="./img/Threads_logo.png" height="60px">
	</div>
	<br>
	<%@ include file="menu.jsp"%>

	<hr>

	<table border="1">
		<c:forEach items="${list }" var="row">
			<tr>
			<tr>
				<td class="tid" onclick="location.href='./info@${row.m_id }'">${row.m_id }</td>
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
			<tr>
				<td><img alt="" src="./img/like.png" height="20px">좋아요${row.blike }개
					<img alt="" src="./img/comment.png" height="20px">답글${row.commentcount }개
					<img alt="" src="./img/repost.png" height="27px"></td>
			</tr>
		</c:forEach>

	</table>



</body>
</html>