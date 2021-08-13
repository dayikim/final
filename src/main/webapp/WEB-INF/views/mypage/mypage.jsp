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

/* 마이페이지 글씨체 */
#titleNextName {
	color: white;
}

.margin1 {
	height: 30px;
}

/**************************************************************************/

/* 마이페이지 시작 */
.container {
	margin: auto;
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
	height: 250px;
	margin-bottom: 20px;
	border: 1px solid rgb(158, 157, 157);
}

.list2 {
	border-radius: 20px;
	height: 250px;
	border: 1px solid rgb(158, 157, 157);
}

.go, .titleDiv, .buttonDiv {
	width: 100%;
	height: 100%;
}

.title {
	height: 60%;
}

.stitle {
	height: 40%;
}

/* 큰 제목 */
.title>h3>b {
	line-height: 200px;
	color: gray;
	margin-left: 10px;
}

/* 부 제목 */
.stitle>b {
	margin-left: 10px;
}

/* 확인 버튼 */
.okBtn {
	border-radius: 5px;
	width: 60px;
	height: 30px;
	margin-top: 100px;
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
		// 프로필 사진 업로드
		$("#updateMyProfile").on("click",function(){
			let origin_picture = $("#profile").attr("src");
			let popup = window.open('/my/picture_change?origin='+origin_picture,'change','width=500px,height=460px,scrollbars=no,resizable=no');
		})
	})
</script>
</head>

<body>
	<!-- 맨 윗 상단 -->
	<div class="row container-fulid">
		<div class="col-4" align=center>
			<a href="/" class="navbar-brand">
				<p id=titlename>돈-다</p>
			</a> <b id=titleNextName>마이페이지</b>
		</div>
		<div class="col-4"></div>
		<div class="col-4"></div>
	</div>

	<div class="margin1"></div>

	<!-- 왼쪽 레이아웃 -->
	<div class="row container">
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
						<a href="/tBoard/myProfile"><img src="/imgs/mypage/${profile.sysName }" id=profile></a>
					</c:when>
					<c:otherwise>
						<a href="/tBoard/myProfile"><img src="/imgs/nomalProfile.jpg" id=profile></a>
					</c:otherwise>
				</c:choose>
			</div>
			<br>

			<!-- 내 정보 출력 -->
			<div class="myInfo">
				<div class="name">
					<a href="/tBoard/myProfile"><b>${myInfo.name}</b>님</a>
				</div>
				<br>
				<div class="add">${myInfo.address1 }</div>
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
					<div class="p">Point</div>
					<div class="myPoint2">
						<h3>
							<b>${point }</b>
						</h3>
					</div>
				</div>

				<div class="charge">
					<a href="/point/ToCharging">충전하기</a> <span>ㅣ</span> <a
						href="/my/pointChargeList"
						onclick="window.open(this.href,'','width=550,height=600');return false">포인트
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
					<!-- forEach 쓸 예정 -->
					<div class="product">
						<a href="#">현재 내가 빌려준 상품 목록 미리보기</a>
					</div>

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
					<!-- forEach 쓸 예정 -->
					<div class="product">
						<a href="#">현재 내가 빌린 상품 목록 미리보기</a>
					</div>


				</div>
			</div>
		</div>


		<div class="col-12 col-sm-12 col-md-1 center"></div>

		<!-- 오른쪽 레이아웃 -->
        <div class="col-12 col-sm-12 col-md-7 right">
            <div class="row">
            
            	<!-- 대여 요청 내역 -->
            	<div class="col-12 list">
                    <div class="row go">
                        <div class="col-10 titleDiv">
                            <div class="title">
                                <h3><b>대여 요청 내역</b></h3>
                            </div>
                            <div class="stitle">
                                <b>나에게 온, 나의 물건 대여 요청 리스트 확인</b>
                            </div>
                        </div>
                        <div class="col-2 buttonDiv">
                            <a href="/my/requestRental"><button type=button class="okBtn">확인</button></a>
                        </div>
                    </div>
                </div>
                
                
                
                <!-- 거래 완료 목록 -->
                <div class="col-12 list">
                    <div class="row go">
                        <div class="col-10 titleDiv">
                            <div class="title">
                                <h3><b>거래 완료 목록</b></h3>
                            </div>
                            <div class="stitle">
                                <b>내가 빌린 상품, 빌려준 상품에 대한 거래 완료 목록 확인</b>
                            </div>
                        </div>
                        <div class="col-2 buttonDiv">
                            <a href="/my/dealEndList"><button type=button class="okBtn">확인</button></a>
                        </div>
                    </div>
                </div>
                
                
                <!-- 나의 커뮤니티 -->
                <div class="col-12 list">
                    <div class="row go">
                        <div class="col-10 titleDiv">
                            <div class="title">
                                <h3><b>나의 커뮤니티</b></h3>
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
                
                
                <!-- 내가 쓴 대여 글 확인 -->
                <div class="col-12 list2">
                    <div class="row go">
                        <div class="col-10 titleDiv">
                            <div class="title">
                                <h3><b>나의 대여 글 목록</b></h3>
                            </div>
                            <div class="stitle">
                                <b>내가 대여한 상품, 나의 글 리스트 확인</b>
                            </div>
                        </div>
                        <div class="col-2 buttonDiv">
                            <a href="/my/myBoardList"><button type=button class="okBtn">확인</button></a>
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
</body>

</html>