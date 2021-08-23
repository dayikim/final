<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>포인트 사용내역</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">

<style>
* {
	box-sizing: border-box;
}

/* 홈페이지 가장 위에 있는 헤더 */
.container-fulid {
	height: 60px;
	background-color: #1d2434;
}

/* 홈페이지 로고 */
#titlename {
	margin-top: 1%;
	margin-bottom: 0;
	font-size: 30px;
	font-family: 'Gugi', cursive;
	color: white;
}

/* 포인트 내역 글씨체 */
#titleNextName {
	color: white;
}

.margin {
	height: 30px;
}

/* 결제 내역 큰 단락 */
.payTitle>b {
	margin-left: 50px;
	font-size: 20px;
}

/* 결제 내역 네비바 */
.navi>div {
	float: left;
}

.pointUse {
	margin-left: 30px;
	border-bottom: 3px solid blue;
}

.pointCharge {
	margin-left: 50px;
}

.pointUse>a>b {
	color: blue;
	text-decoration: none;
}

.pointCharge>a>b {
	color: black;
	text-decoration: none;
}

#hr {
	margin: auto;
	width: 550px;
	height: 1.5px;
	background-color: rgb(148, 148, 148);
}

/* 포인트충전 내역 리스트 */
.list {
	margin: auto;
	width: 550px;
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid rgb(148, 148, 148);
}

.pay {
	line-height: 50px;
	text-align: center;
}
</style>
</head>

<body>
	<div class="row container-fulid">
		<div class="col-4" align=center>
			<a href="#" class="navbar-brand">
				<p id=titlename>돈-다</p>
			</a> <b id=titleNextName>포인트 내역</b>
		</div>
		<div class="col-4"></div>
		<div class="col-4"></div>
	</div>

	<div class="margin"></div>

	<div class="payTitle">
		<b>포인트사용</b>
	</div>

	<div class="margin"></div>

	<div class="navi">
		<div class="pointCharge">
			<a href="/my/pointChargeList"><b>포인트입금</b></a>
		</div>
		<div class="pointUse">
			<a href="/my/pointUseList"><b>포인트사용</b></a>
		</div>
	</div>

	<div class="margin"></div>
	<div id=hr></div>

	<!-- 포인트 사용내역 리스트 출력 -->
	<c:forEach var="i" items="${pointUse }">
		<div class="row list">
			<div class="col-8">
				<div class="date">${i.dealdate }</div>
				<div class="content">
					<b>포인트 사용</b>
				</div>
			</div>
			<div class="col-4 pay">
				<b>${i.usepoint }</b> 상추
			</div>
		</div>
	</c:forEach>
</body>

</html>