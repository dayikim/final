<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 업로드 결과</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<script>
	<c:choose>
		<c:when test="${result > 0}">
			alert("프로필을 성공적으로 업로드하였습니다.")
			opener.location.reload(); // 부모창 새로고침
			window.close();
		</c:when>
		<c:otherwise>
			alert("프로필 업로드를 실패하였습니다.")
			location.href="/mypage/profile";
	</c:otherwise>
	</c:choose>
	</script>
</body>
</html>