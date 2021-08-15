<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<c:forEach var="boardAll" items="${boardAll}">
		<div>
			<input type="hidden" class="num" name="board_seq"
				value="${boardAll.seq}">
			<div class="num">${boardAll.seq}</div>
			<div class="title">
				<a href="/tBoard/detailView?seq=${boardAll.seq}&id=${boardAll.id}">${boardAll.title}</a>
			</div>
              <a href="">대여등록</a>
              <a href="">대여요청</a>
               <a href="">재능등록</a>
                <a href="">재능요청</a>
              

		</div>
	</c:forEach>
</body>
</html>