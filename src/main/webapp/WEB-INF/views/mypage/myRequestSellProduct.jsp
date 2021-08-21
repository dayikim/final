<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돈 빼고 다! 돈-고</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free Website Template" name="keywords">
<meta content="Free Website Template" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
<style>
#titlename {
	margin-top: 1%;
	margin-bottom: 0;
	font-size: 30px;
	font-family: 'Gugi', cursive;
	color: white;
}

/* 마이페이지 글씨체 */
#titleNextName {
	margin-left: 20px;
	color: white;
}

img {
	width: 100%;
}

#search {
	width: 500px;
	position: relative;
}

.Explanation {
	position: relative;
	top: 30%;
}

.subject {
	color: #1d2434;
	text-align: center;
	font-size: 40px;
	font-weight: 800;
}

.contents {
	margin-top: 5%;
	text-align: center;
	font-size: 25px;
	font-weight: bold;
}

.Main {
	margin-top: 5%;
}

/* 네비바 */
.navi>div {
	float: left;
	width: 25%;
	text-align: center;
}

.navi {
	margin: auto;
	margin-top: 115px;
	width: 900px;
	height: 60px;
	border: 1px solid black;
	border-radius: 7px;
	overflow: hidden;
}

.requestSellProduct { /* 대여하기 네비 */
	height: 100%;
	background-color: #334257;
}

.requestSellProduct>a>b {
	color: white;
	font-size: 30px;
	line-height: 60px;
}

.requestBuyProduct, .requestSellTalent, .requestBuyTalent {
	/* 대여하기 제외한 나머지 네비 */
	height: 100%;
}

.requestBuyProduct, .requestSellTalent, .requestBuyTalent>a>b {
	font-size: 30px;
	line-height: 60px;
}

/* 시작 */
.container2 {
	margin: auto;
	width: 1000px;
	padding-top: 35px;
	padding-left: 50px;
	padding-right: 50px;
	padding-bottom: 50px;
}

/* 대여 요청 내역 */
.requestList {
	overflow: hidden;
	border-radius: 7px;
	border: 1px solid black;
	margin-top: 20px;
}

.image {
	width: 200px;
	height: 200px;
	overflow: hidden;
	padding-top: 10px;
}

img {
	width: 200px;
	height: 200px;
	border-radius: 5px;
}

.information {
	padding-top: 40px;
	padding-left: 40px;
	padding-bottom:40px;
}
.content{
	margin-top:30px;
}

</style>

<script>
	$(function() {
		// 게시물 검색
		$("#search").keyup(function(e) {
			if (e.keyCode == 13) {
				location.href = "/AllBoardList/lendList?category=AllCategory&search="+$("#search").val()+"&cpage=1";
			}
		})
		
		// 채팅
		$("#chat").on("click",function(){
			location.href = "/chat";
		})
		
		// 게시물 삭제
		$(".cnum-btn2").on("click", function() {
			let result = confirm("정말 삭제하시겠습니까?");
			if (result) {
				$("#frm").submit();
			} else {
				$(".cnum-btn1").parent().parent().parent().empty();
			}
		})
	})
</script>

</head>
<body>
	<!-- Top Bar Start -->
	<div class="top-bar d-none d-md-block">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="top-bar-left">
						<div class="text">
							<h2>AM 9:00 - PM 7:00</h2>
						</div>
						<div class="text">
							<h2>02 123 4567</h2>
							<p>고객 센터</p>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="top-bar-right">
						<div class="social">
							<a href="/sns/main"><i class="fab fa-twitter"></i></a> <a
								href="/sns/main"><i class="fab fa-facebook-f"></i></a> <a
								href="/sns/main"><i class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Top Bar End -->

	<!-- Nav Bar Start -->
	<div class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
			<a href="/" class="navbar-brand"><p id=titlename>돈-다</a>
			</p>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<c:choose>
				<c:when test="${loginID == null }">
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav ml-auto">
							<input class="form-control mr-sm-5" type="search"
								placeholder="물품, 지역을 검색해주세요." id=search aria-label="Search">
							<a href="/person/login" class="nav-item nav-link active">Login</a>
							<!-- Login Page 이동 -->
							<a href="/person/join" class="nav-item nav-link">Sign Up</a>
							<!-- SignUp Page 이동 -->
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav ml-auto">
							<input class="form-control mr-sm-5" type="search"
								placeholder="물품, 지역을 검색해주세요." id=search aria-label="Search">
							<a href="/person/logout" class="nav-item nav-link active">Logout</a>
							<!-- Logout -->
							<div class="collapse navbar-collapse" id="navbarNavDropdown">
								<ul class="navbar-nav">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#"
										id="navbarDropdownMenuLink" role="button"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> Menu </a>
										<div class="dropdown-menu"
											aria-labelledby="navbarDropdownMenuLink">
											<a class="dropdown-item" href="/AllBoardList/lendList?category=AllCategory&search=&cpage=1">Board</a> <a
												class="dropdown-item" href="/sns/main">SNS</a> <a
												class="dropdown-item" href="/my/mypageProc">My page</a> <a
												class="dropdown-item" href="/point/ToCharging">Charging</a>
										</div></li>
								</ul>
								<button type="button" class="btn btn-outline-warning" id="chat">Chatting</button>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
	<!-- Nav Bar End -->


	<!-- 네비바 -->
	<div class="navi">
		<div class="requestSellProduct">
			<a href="/my/myRequestSellProduct"> <b>대여 하기</b>
			</a>
		</div>
		<div class="requestBuyProduct">
			<a href="/my/myRequestBuyProduct"> <b>대여 요청</b>
			</a>
		</div>
		<div class="requestSellTalent">
			<a href="/my/myRequestSellTalent"> <b>재능 등록</b>
			</a>
		</div>
		<div class="requestBuyTalent">
			<a href="/my/myRequestBuyTalent"> <b>재능 요청</b>
			</a>
		</div>

	</div>



	<!-- 대여 요청 내역 -->
	<div class="container2">
		<div>나의 게시물 > 대여 하기</div>
		<!-- forEach문 사용 -->
		<%-- <c:forEach var="i" items="${requestRental }"> --%>
		<form action="" method="get">
			<div class="requestList">
				<div class="row high">
					<div class="col-8 information">
						<div class="title">
							<h4>
								<b>자전거 대여합니다</b>
							</h4>
						</div>
						<div class="content">
							<div class="row">
								<div class="col-4 left">
									<b>대여자</b>
								</div>
								<div class="col-8 right">내이름 ㅣ shoowghjk</div>
							</div>
							<div class="row">
								<div class="col-4 left">
									<b>위치</b>
								</div>
								<div class="col-8 right">서울특별시 동대문구</div>
							</div>
							<div class="row">
								<div class="col-4 left">
									<b>결제 내역</b>
								</div>
								<div class="col-8 right">15000원</div>
							</div>
							<div class="row">
								<div class="col-4 left">
									<b>게시물 등록일</b>
								</div>
								<div class="col-8 right">2021-08-16</div>
							</div>
						</div>
					</div>

					<div class="col-4">
						<div class="image">
							<img src="">
						</div>

					</div>
				</div>
			</div>
		</form>
		<%-- </c:forEach> --%>

	</div>


	<!-- Footer Start -->
	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="row">
						<div class="col-12">
							<div class="footer-contact">
								<p>
									<i class="fa fa-map-marker-alt"></i>서울특별시 강남대로 123로
								</p>
								<p>
									<i class="fa fa-phone-alt"></i>02-123-4567
								</p>
								<p>
									<i class="fa fa-envelope"></i>DonDa@example.com
								</p>
								<div class="footer-social">
									<a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
										class="fab fa-facebook-f"></i></a> <a href=""><i
										class="fab fa-youtube"></i></a> <a href=""><i
										class="fab fa-instagram"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="row">
						<div class="col-6">
							<div class="footer-contact">
								<p>
									<i class="far fa-building"></i>회사소개
								</p>
								<p>
									<i class="far fa-user-circle"></i>채용
								</p>
							</div>
						</div>
						<div class="col-6">
							<div class="footer-contact">
								<p>
									<i class="fas fa-info"></i>이용약관
								</p>
								<p>
									<i class="far fa-id-badge"></i>개인정보처리방침
								</p>
								<p>
									<i class="fas fa-map-pin"></i>위치기반서비스 이용약관
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container copyright">
			<div class="row">
				<div class="col-12" style="text-align: center;">
					<p id=titlename>
						&copy; <a href="#">돈-다</a>, All Right Reserved.
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/easing/easing.min.js"></script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>