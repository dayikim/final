<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>재능 판매 게시글 상세보기</title>
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


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
<style>
body {
	background-color: #f5f6f7;
}

* {
	margin: 0;
	padding: 0;
}

/* 네비바 및 상단 고정 부분 */
#titlename {
	margin-top: 1%;
	margin-bottom: 0;
	font-size: 30px;
	font-family: 'Gugi', cursive;
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

/* 프로필,상세보기 */
#body {
	padding-top: 100px;
	padding-bottom: 30px;
}

.wrapper {
	width: 100%;
	height: auto;
}

/* 버튼 박스 */
.btn_box {
	margin-top: 10px;
	margin-bottom: 5px;
}

/* 게시글 제목 */
.board_title {
	margin: auto;
	margin-top: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
	width: 85%;
	margin-bottom: 20px;
}

.title_msg {
	margin-left: 10px;
}

/* 사진 슬라이드 */
.carousel {
	margin: 0;
}

.carousel-item {
	max-height: 500px;
}

.carousel-item img {
	width: 100%;
	height: 100%;
}

.carousel-inner {
	width: 100%;
}

.row .carousel-control-prev {
	left: -40px;
	border-bottom: 0;
	font-size: 40px;
	color: #444;
}

.row .carousel-control-next {
	right: -40px;
	border-bottom: 0;
	font-size: 40px;
	color: #444;
}

/* 작성자 프로필 */
#user-profile {
	margin: auto;
	margin-top: 30px;
	margin-bottom: 20px;
	border-radius: 5px;
	border: 1px solid #ddd;
	width: 85%;
	margin-bottom: 20px;
}

/* 아이디 */
#user-profile #nickname {
	position: absolute;
	text-align: center;
	margin-top: 20px;
	font-size: 22px;
	font-weight: bold;
	letter-spacing: -0.6px;
	margin-bottom: 10px;
	margin-left: 90px;
	display: inline-block;
}

/* 위치  */
#user-profile #region_name {
	position: absolute;
	text-align: center;
	margin-top: 50px;
	letter-spacing: -0.6px;
	margin-bottom: 10px;
	margin-left: 100px;
	font-size: 15px;
	display: inline-block;
}

#user-profile #price {
	float: right;
	margin-top: 30px;
	font-size: 18px;
	font-weight: bold;
	letter-spacing: -0.6px;
	margin-right: 130px;
	margin-bottom: 10px;
}

#user-profile #booking {
	float: right;
	margin-top: 20px;
	font-size: 18px;
	font-weight: bold;
	letter-spacing: -0.6px;
	margin-right: 30px;
	margin-bottom: 10px;
}

/* 프로필 이미지 */
#user-profile #profile-image img {
	width: 60px;
	height: 60px;
	margin-left: 20px;
	margin-top: 10px;
	margin-bottom: 10px;
	border-radius: 40px;
	overflow: hidden;
	vertical-align: middle;
}

/* 세부 설명 */
#contents {
	border-radius: 5px;
	border: 1px solid #ddd;
	width: 85%;
	margin: auto;
	height: auto;
	margin-top: 10px;
	margin-bottom: 30px;
}

.contents_input {
	padding: 0;
	margin-left: 20px;
	min-height: 100%;
	width: 95%;
	border-radius: 10px;
}

p {
	margin-left: 20px;
	margin-top: 10px;
}

.btn_wrap #chat {
	margin: auto;
	display: block;
	margin-bottom: 10px;
}
</style>
<script>
$(function(){

		$("#deleteBtn").on("click",function () { //게시글 삭제
					let check = confirm("정말 게시글을 삭제하겠습니까?");
					if (check) {
						location.href = "tBoard/delete?seq="
							+ $("#deleteBtn").val(); //게시글 삭제 확인 팝업
					} else {
						return;
					}
				});

		$("#modifyBtn").on("click",function () { //게시글 수정
					let check = confirm("정말 게시글을 수정하겠습니까?");
					if (check) {
						location.href = "tBoard/modify?seq="
							+ $("#modifyBtn").val(); //게시글 수정 확인 팝업
					} else {
						return;
					}
				});

	$("#booking").on("click",function(){ //예약 하기 
		let check = confirm("정말 예약하시겠습니까?");
		if (check) {
			alert("마이페이지에서 예약내역을 확인하세요.");
			$("#bookingform").submit();
		}else{
			return;
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
                                <a href="/sns/main"><i class="fab fa-twitter"></i></a>
                                <a href="/sns/main"><i class="fab fa-facebook-f"></i></a>
                                <a href="/sns/main"><i class="fab fa-instagram"></i></a>
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
                <a href="/" class="navbar-brand"><p id= titlename>돈-다</a></p>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <c:choose>
                	<c:when test="${loginID == null }">
                		<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    	<div class="navbar-nav ml-auto">
                        	<input class="form-control mr-sm-5" type="search" placeholder="물품, 지역을 검색해주세요." id =search aria-label="Search">
                        	<a href="/person/login" class="nav-item nav-link active">Login</a> <!-- Login Page 이동 -->
                        	<a href="/person/join" class="nav-item nav-link">Sign Up</a>  <!-- SignUp Page 이동 -->
                    	</div>
                		</div>
                	</c:when>
                	<c:otherwise>
                		<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    		<div class="navbar-nav ml-auto">
                        		<input class="form-control mr-sm-5" type="search" placeholder="물품, 지역을 검색해주세요." id =search aria-label="Search">
                        		<a href="/person/logout" class="nav-item nav-link active">Logout</a> <!-- Logout -->
                        		 <div class="collapse navbar-collapse" id="navbarNavDropdown">
	                        		 <ul class="navbar-nav">
	                        			<li class="nav-item dropdown">
									        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									         Menu
									        </a>
									        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									          <a class="dropdown-item" href="/AllBoardList/lendList?category=AllCategory&search=&cpage=1">Board</a>
									          <a class="dropdown-item" href="/sns/main">SNS</a>
									          <a class="dropdown-item" href="/my/mypageProc">My page</a>
									          <a class="dropdown-item" href="/point/ToCharging">Charging</a>
									        </div>
								      	</li>
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
	<section id="body">
		<div class="container">
			<div class="btn_box btn_wrap text-right ">
				<button type="button" class="btn btn-info" value="${tboard.seq}" id="deleteBtn">
					<i class="fas fa-trash-restore"> 삭제</i>
				</button>
				<button type="button" class="btn btn-info" value="${tboard.seq}" id="modifyBtn">수정</button>
			</div>									
			
			<div class="form-control wrapper">
				<div class="board_title">

					<a href="#" class="badge badge-info">재능 판매</a>

						<span id="category">${tboard.category}</span>
						<h2 class="title_msg">
							<b>${tboard.title}<b>
						</h2>
				</div>
				<div class="row col-12 carousel">
					<!-- Carousel -->
					<div id="carousel-example" class="col-12 carousel slide"
						data-ride="carousel">

<%-- 						<c:forEach var="file" items="${filelist}">
 --%>						<div class="col-12 carousel-inner">
							<div class="col-12 col-md-12 carousel-item active">
								<img src="자유게시판 상세 및 신고.png" class="col-12 d-block w-100"
									alt="slide-img-1">
<%-- 						</c:forEach>
 --%>							</div>
							<div class=" col-12 carousel-item">
								<img src="자유게시판 수정.PNG" class="col-12 col-md-12 d-block w-100"
									alt="slide-img-2">
								<div class="carousel-caption"></div>
							</div>
						</div>
						<div class=" col-12 carousel-item">
							<img src="자유게시판 작성.png" class="col-12 col-md-12 d-block w-100"
								alt="slide-img-3">

						</div>
						<div class="col-12 carousel-item">
							<img src="assets/img/slides/slide-img-4.jpg"
								class="d-block w-100" alt="slide-img-4">

						</div>
					</div>

					<a class="carousel-control-prev" href="#carousel-example"
						role="button" data-slide="prev"> <i
						class="fas fa-chevron-circle-left" aria-hidden="true"></i> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carousel-example"
						role="button" data-slide="next"> <i
						class="fas fa-chevron-circle-right" aria-hidden="true"></i> <span
						class="sr-only">Next</span>
					</a>
				</div>
				<!-- End carousel -->


				<section id="user-profile">
					<div id="nickname_box">
						<h2 id="nickname">
							<a href="/profile/userProfile?id=${tboard.writer}"><b>${writerInfo.name}</b>님</a>
						</h2>

					</div>
					<span id="region_name">${tboard.address} </span>
					<div class=" btn_wrap text-right">
					
					<form action="/tBoard/booking" id="bookingform">
					<input type="hidden" name="seller" value="${tboard.writer}">
					<input type="hidden" name="bookable" value="y">
					<input type="hidden" name="booker" value="${loginID}">
					<input type="hidden" name="parentseq" value="${tboard.seq}">
						<button type="button" class="btn btn-secondary" id="booking">
							예약하기</button>
					</form>
					</div>
					<span class="align-baseline" id="price">${tboard.price} 상추</span>

					<div id="profile-image">
						<!-- 프로필 이미지 -->
							<c:choose>
					<c:when test="${profile != null}">
						<a href="/profilie/userProfile?id=${tboard.writer}"><img src="/imgs/mypage/${profile.sysName }" id=profile></a>
					</c:when>
					<c:otherwise>
						<a href="/profilie/userProfile?id=${tboard.writer}"><img src="/imgs/nomalProfile.jpg" id=profile></a>
					</c:otherwise>
				</c:choose>
					</div>
				</section>

				<section id="contents">
					<!-- 게시글  내용 -->
					<div class="col-12 md-5 contents_input">
						<p class="target">${tboard.contents }</p>
					</div>

					<div class="btn_wrap">
						<button type="button" class="btn btn-outline-info btn btn-lg"
							id="chat">
							<i class="far fa-comment-dots"></i> 1:1 채팅
						</button>
					</div>
				</section>
			</div>
		</div>
	</section>

	<hr>
	<footer>
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
	</footer>

</body>

</html>