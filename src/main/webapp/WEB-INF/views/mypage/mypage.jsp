<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">

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

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">

<!-- icon css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">



<style>
#titlename{
    margin-top: 1%;
    margin-bottom: 0;
    font-size: 30px;
    font-family: 'Gugi', cursive;
    color:white;
}
img{
    width: 100%;
}
#search{
    width: 500px;
    position: relative;
}
.Explanation{
    position: relative;
    top: 30%;
}
.subject{
    color: #1d2434;
    text-align: center;
    font-size: 40px;
    font-weight: 800;
}
.contents{
    margin-top: 5%;
    text-align: center;
    font-size: 25px;
    font-weight: bold;
}
.Main{
    margin-top: 5%;
}

/**************************************************************************/

/* 마이페이지 시작 */
.container2 {
	margin: auto;
	margin-top:75px;
	width: 1200px;
	padding: 50px;
}

/**************************************************************************/

/*왼쪽*/
.left {
	border-radius: 20px;
	border: 1px solid rgb(158, 157, 157);
}

/* 내정보 글씨 */
.header>div>h3>b {
	color: #1d2434;
	line-height: 100px;
}

/* 내 정보 수정하기 버튼 */
.cnum-btn1 { /* 내정보 수정 */
	border-radius: 5px;
	width: 60px;
	height: 30px;
	margin-top: 35px;
	background-color: #334257;
	border: none;
	color: #fff;
	font-size: 15px;
	outline: none;
	cursor: pointer;
}

.cnum-btn2 { /* 프로필 */
	border-radius: 5px;
	width: 60px;
	height: 30px;
	background-color: white;
	border: 1px solid #334257;
	color: #334257;
	font-size: 15px;
	outline: none;
	cursor: pointer;
}

/* 프로필사진, 개인정보수정 */
/* 프로필사진 */
.profile {
	width: 200px;
	height: 170px;
	margin: auto;
}

.left>div>a>img {
	width: 165px;
	height: 165px;
	border-radius: 100px;
}

/* 내 정보 */
.myInfo {
	text-align: center;
}

.name>b {
	font-size: 20px;
}

/* 나의 포인트 */
.myPoint {
	margin: auto;
	margin-top: 20px;
	text-align: center;
	width: 240px;
	height: 150px;
	border: 5px solid #334257;
	border-radius: 10px;
}

.p {
	height: 50%;
	line-height: 100px;
}

.myPoint2 {
	height: 50%;
	line-height: 30px;
}

.charge {
	margin: auto;
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: center;
	line-height: 50px;
	width: 240px;
	height: 50px;
	border-radius: 5px;
	border: 1px solid white;
	background-color: #646c7e;
}

.charge>a, span {
	color: white;
}

/* 현재 빌린 상품, 빌려준 상품 */
.borrowList, .lendList {
	width: 330px;
	height: 100px;
	overflow: hidden;
	margin-top: 5px;
}

/* 안에 들어갈 미리보기 설정 */
.product {
	width: 330px;
	margin-left: 15px;
}

.product>a {
	color: black;
	text-decoration: none;
}

.product>a:hover {
	color: gray;
}

/* 회원탈퇴 */
.memberOutDiv{
	text-align: left;
}
#memberOut{
	width:100px;
}
#memberOut:hover{
	background-color : #334257;
	color:white;
}
/**************************************************************************/
/*중간*/
.center {
	width: 30px;
	height: 30px;
}

/**************************************************************************/
/*오른쪽*/

/* 마이페이지 목차 */
.list {
	border-radius: 20px;
	height: 200px;
	margin-bottom: 20px;
	border: 1px solid rgb(158, 157, 157);
}

.list2 {
	border-radius: 20px;
	height: 200px;
	border: 1px solid rgb(158, 157, 157);
}

.go, .titleDiv, .buttonDiv {
	width: 100%;
	height: 100%;
}

.title {
	height: 55%;
}

.stitle {
	height: 45%;
}



/* 큰 제목 */
.title>h3>b {
	line-height: 150px;
	color: gray;
	margin-left: 10px;
}

/* 부 제목 */
.stitle>b {
	margin-left: 10px;
	margin-top: 100px;
}

/* 확인 버튼 */
.okBtn {
	border-radius: 5px;
	width: 60px;
	height: 30px;
	margin-top: 80px;
	margin-left: 10px;
	background-color: #334257;
	border: none;
	color: #fff;
	font-size: 15px;
	outline: none;
	cursor: pointer;
}


</style>
<script>
	$(function(){		
		// 게시물 검색
/* 		$("#search").keyup(function(e) {
			if (e.keyCode == 13) {
				location.href = "/AllBoardList/lendList?category=AllCategory&search="+$("#search").val()+"&cpage=1";
			}
		}) */
		
		// 채팅
		$("#chat").on("click",function(){
			location.href = "/chat";
		})
		
		// 프로필 사진 업로드
		$("#updateMyProfile").on("click",function(){
			let origin_picture = $("#profile").attr("src");
			let popup = window.open('/my/picture_change?origin='+origin_picture,'change','width=530px,height=530px,scrollbars=no,resizable=no');
		})
		
		// 회원탈퇴 버튼을 눌렀을 때
		$("#memberOut").on("click",function(){
			var msg = confirm("정말로 탈퇴하시겠습니까?");
			if(msg == true){
				$.ajax({
					url : "/my/memberOut",
					type : "POST",
					data : {"id":$("#session").val()}
				}).done(function(resp){
					if(resp == 1){
						alert("회원탈퇴가 정상처리되었습니다.")
						location.href = "/"
					}else{
						alert("탈퇴처리중 문제발생")
					}
				})
			}else{
				return false;
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
	

	<!-- 왼쪽 레이아웃 -->
	<div class="row container2">
		<div class="col-12 col-sm-12 col-md-4 left">
			<div class="row header">
				<div class="col-6" align=left>
					<h3>
						<b>내정보</b>
					</h3>
				</div>
				<div class="col-6" align=right>
					<a href="/my/modify"><button type=button id=updateMyInfoBtn
							class="cnum-btn1">수정</button></a>
					<button type=button id=updateMyProfile class="cnum-btn2">프로필</button>
				</div>
			</div>

			<!-- 나의 프로필 -->
			<div class="profile" align=center>
				<c:choose>
					<c:when test="${profile != null}">
						<a href="/profile/myProfile"><img
							src="/imgs/mypage/${profile.sysName }" id=profile></a>
					</c:when>
					<c:otherwise>
						<a href="/profile/myProfile"><img src="/imgs/nomalProfile.jpg"
							id=profile></a>
					</c:otherwise>
				</c:choose>
			</div>
			<br>

			<!-- 내 정보 출력 -->
			<div class="myInfo">
				<div class="name">
					<a href="/profile/myProfile"><b><i class="fas fa-user-alt"></i>
							${myInfo.name}</b>님</a>
				</div>
				<br>
				<div class="add">
					<i class="fas fa-map-marker-alt"></i> ${myInfo.address1 }
				</div>
			</div>
			<hr>

			<!-- 나의 포인트 -->
			<div class="point">
				<div class="pointIntro">
					<h5>
						<b>나의 포인트</b>
					</h5>
				</div>

				<div class="myPoint">
					<div class="p">
						Point <i class="fas fa-hockey-puck"></i>
					</div>
					<div class="myPoint2">
						<h3>
							<b>${point }</b>
						</h3>
					</div>
				</div>

				<div class="charge">
					<a href="/point/ToCharging">충전하기</a> <span>ㅣ</span> <a
						href="/my/pointChargeList"
						onclick="window.open(this.href,'','width=600,height=600');return false">포인트
						내역 확인</a>
				</div>
			</div>
			<hr>

			<!-- 현재 빌린 상품 -->
			<div class="borrow">
				<div class="row borrowIntro">
					<div class="col-6">
						<h5>
							<b>현재 빌린 상품</b>
						</h5>
					</div>
					<div class="col-6" align=right>
						<a href="/my/borrowProduct"
							onclick="window.open(this.href,'','width=550,height=600');return false">더보기</a>
					</div>
				</div>
				<div class="row borrowList">
					<c:forEach var="i" items="${borrowList}">
						<div class="product">
							<a href="#">${i.item }</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<hr>

			<!-- 현재 빌려준 상품 -->
			<div class="lend">
				<div class="row lendIntro">
					<div class="col-7">
						<h5>
							<b>현재 빌려준 상품</b>
						</h5>
					</div>
					<div class="col-5" align=right>
						<a href="/my/lendProduct"
							onclick="window.open(this.href,'','width=550,height=600');return false">더보기</a>
					</div>
				</div>
				<div class="row lendList">
					<c:forEach var="i" items="${lendList}">
						<div class="product">
							<a href="#">${i.item}</a>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="memberOutDiv">
				<button type=button id=memberOut class="cnum-btn2">회원탈퇴</button>
			</div>
		</div>


		<div class="col-12 col-sm-12 col-md-1 center"></div>

		<!-- 오른쪽 레이아웃 -->
		<div class="col-12 col-sm-12 col-md-7 right">
			<div class="row">

				<!-- 거래 요청 내역(판매자 입장) -->
				<div class="col-12 list">
					<div class="row go">
						<div class="col-10 titleDiv">
							<div class="title">
								<h3>
									<b>물품 거래 요청 내역</b>
								</h3>
							</div>
							<div class="stitle">
								<b>나에게 온, 나의 물건 거래 요청 리스트 확인</b>
							</div>
						</div>
						<div class="col-2 buttonDiv">
							<a href="/my/requestRentalProduct"><button type=button class="okBtn">확인</button></a>
						</div>
					</div>
				</div>
				
				
				
				<!-- 예약 내역(구매자 입장) -->
				<div class="col-12 list">
					<div class="row go">
						<div class="col-10 titleDiv">
							<div class="title">
								<h3>
									<b>물품 예약 내역</b>
								</h3>
							</div>
							<div class="stitle">
								<b>나에게 필요한, 물건 예약 요청 리스트 확인</b>
							</div>
						</div>
						<div class="col-2 buttonDiv">
							<a href="/my/buyRequestProduct"><button type=button class="okBtn">확인</button></a>
						</div>
					</div>
				</div>


				<!-- 거래 완료 목록 -->
				<div class="col-12 list">
					<div class="row go">
						<div class="col-10 titleDiv">
							<div class="title">
								<h3>
									<b>물품 거래 완료 내역</b>
								</h3>
							</div>
							<div class="stitle">
								<b>내가 빌린 상품, 빌려준 상품에 대한 거래 완료 목록 확인</b>
							</div>
						</div>
						<div class="col-2 buttonDiv">
							<a href="/my/dealEndProductSellList"><button type=button class="okBtn">확인</button></a>
						</div>
					</div>
				</div>
				
				
				<!-- 내가 쓴 게시글 보기 -->
				<div class="col-12 list">
					<div class="row go">
						<div class="col-10 titleDiv">
							<div class="title">
								<h3>
									<b>나의 게시물</b>
								</h3>
							</div>
							<div class="stitle">
								<b>홈페이지에 작성한 나의 게시글 모아보기</b>
							</div>
						</div>
						<div class="col-2 buttonDiv">
							<a href="/my/myRequestSellProduct"><button type=button class="okBtn">확인</button></a>
						</div>
					</div>
				</div>



				<!-- 나의 커뮤니티 -->
				<div class="col-12 list2">
					<div class="row go">
						<div class="col-10 titleDiv">
							<div class="title">
								<h3>
									<b>나의 커뮤니티</b>
								</h3>
							</div>
							<div class="stitle">
								<b>내가 쓴 커뮤니티의 목록을 확인</b>
							</div>
						</div>
						<div class="col-2 buttonDiv">
							<a href="/my/selectMySns"><button type=button class="okBtn">확인</button></a>
						</div>
					</div>
				</div>


				
			</div>
		</div>

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
	<input type=hidden id=session value=${loginID }>
</body>

</html>