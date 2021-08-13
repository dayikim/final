<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>돈 빼고 다! 돈-고</title>
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

.margin1 {
	height: 30px;
}

/* 판매완료, 구매완료 메뉴 */
#body {
	padding-top: 30px;
	padding-bottom: 30px;
}

.wrapper {
	width: 100%;
	height: auto;
	margin-top: 75px;
}

/* 탭 메뉴 */
.tab_basic {
	margin-top: 10px;
	width: 80%;
	margin: auto;
}

.tab_list_wrap {
	font-size: 0;
	height: 35px;
}

.tab_list {
	display: inline-block;
	width: 50%;
	height: 100%;
	font-size: 15px;
	line-height: 30px;
	text-align: center;
	border: 1px solid grey;
	border-right: 0;
	box-sizing: border-box;
}

.tab_list:last-child {
	border-right: 1px solid rgb(112, 91, 91);
}

.tab_list.tab_active {
	background: #cdcfd3;
	color: whitesmoke;
}

.tab_list a {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	color: rgb(0, 0, 0);
	font-weight: 800;
	font-weight: 800;
}

.tab_content {
	display: none;
	min-height: 100px;
	padding: 20px;
	box-sizing: border-box;
}

.tab_content:first-child {
	display: block;
}

.card {
	display: inline-block;
}

.tab_container {
	margin: 10px;
}

/* 거래후기 tab */
/*  작은 작성자 프로필 */
#small_user-profile {
	position: relative;
	margin-top: 20px;
	margin-bottom: 10px;
	margin-left: 10px;
}

#small_user-profile #small_nickname {
	position: absolute;
	text-align: left;
	margin-top: 10px;
	margin-left: 60px;
	font-size: 18px;
	font-weight: 600;
	letter-spacing: -0.6px;
	margin-bottom: 10px;
	vertical-align: middle;
}

#small_user-profile #small_nickname #small_region_name {
	font-size: 14px;
	color: #212529;
	font-weight: normal;
	vertical-align: middle;
	margin-left: 6px;
}

div {
	display: block;
}

#small_user-profile #small_profile-image {
	width: 50px;
	height: 50px;
	border-radius: 30px;
	overflow: hidden;
	vertical-align: middle;
}

.small_profile_info {
	margin-left: 10px;
	display: inline-block;
}

/* 거래후기 리스트 */
li {
	display: list-item;
}

.comment_list {
	list-style: none;
	list-style-position: initial;
	list-style-image: initial;
	list-style-type: none;
	margin-top: 10px;
	margin-bottom: 10px;
	border: none;
}

.CommentBox .comment_list .CommentItem {
	margin-left: 46px;
	padding-left: 0;
}

.comment_box {
	border: 1px solid black;
	margin-left: 10px;
	width: 800px;
	padding-right: 20;
}

.CommentBox .comment_list .comment_info_box {
	margin-top: 10px;
	font-size: 12px;
}

.text_view {
	margin-left: 10px;
}

/* 판매 완료 리스트 */
.completDiv {
	margin: 10px;
	margin-top: 20px;
	border: 1px solid black;
	border-radius: 10px;
}

/* 상품 이미지 부분 */
.completImg {
	width: 200px;
	height: 200px;
	border-radius: 10px;
	border: 1px solid black;
	overflow: hidden;
	margin-left: 32px;
	margin-top: 15px;
}

/* 상품 정보 부분 */
.information {
	margin-top: 60px;
}

/* 거래완료 뱃지 */
.completBg {
	border-radius: 3px;
	background-color: #1d2434;
}

.foot {
	margin-left: 2px;
	margin-top: 20px;
}

.completBg>h6 {
	color: white;
	text-align: center;
	line-height: 25px;
}

/* 리뷰 */
.review {
	text-align: center;
	height: 45px;
}

.review>a {
	text-decoration: none;
	color: orange;
}

/* footer */
footer {
	margin-top: 20px;
}
</style>
<script>

        $(function () {
            let tabList = document.querySelectorAll('.tab_list_wrap .tab_list')
            Array.prototype.forEach.call(tabList, function (list) {
                list.children[0].addEventListener('click', function (e) {
                    e.preventDefault()
                    let tabContent = document.querySelectorAll('.tab_container .tab_content')
                    let tabNum = this.parentElement.getAttribute('data-tabnum')
                    Array.prototype.forEach.call(tabContent, function (cont, i) {
                        cont.style.display = 'none'
                        tabList[i].className = 'tab_list'
                    })
                    tabContent[tabNum].style.display = 'block'
                    if (list.className.indexOf('tab_active') == -1) {
                        list.className = 'tab_list tab_active'
                    }
                })
            })




        });
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
							<a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
								class="fab fa-facebook-f"></i></a> <a href=""><i
								class="fab fa-instagram"></i></a>
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
			<a href="index.html" class="navbar-brand"><p id=titlename>돈-다</a>
			</p>
			<b id=titleNextName>거래 완료 목록</b>
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
							<a href="/my/mypageProc" class="nav-item nav-link">MyPage</a>
							<!-- My Page 이동 -->
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
	<!-- Nav Bar End -->
	
	
	<section id="body">
		<div class="container">
			<div class="form-control wrapper ">

				<div class="margin1"></div>

				<section id=table_menu>
					<!-- Tabs -->
					<div class="tab_basic">
						<!-- 탭 메뉴 -->
						<div class="tab_list_wrap">
							<div class="tab_list tab_active" data-tabnum="0">
								<a href="/TBoard/sellingList">판매완료</a>
							</div>
							<div class="tab_list" data-tabnum="1">
								<a href="/TBoard/Review">구매완료</a>
							</div>

						</div>


						<div class="tab_container">
							<!-- 판매 완료 -->
							<div class="tab_content">

								<!---------forEach 사용 구간------------------------------------------------------------------------------>
								<ul class="comment_list">
									<li class="commentItem">
										<!-- 판매 완료 출력 -->
										<div class="completDiv">
											<div class="row complet">
												<div class="col-12 col-md-4 col-sm-4 completImgDiv">
													<div class="completImg">
														<img src="...">
													</div>
												</div>
												<div class="col-12 col-md-8 col-sm-8 information">
													<div>
														<h4>
															<b>혼자 공부하는 자바</b>
														</h4>
													</div>
													<div>shoowghjk ㅣ 서울특별시 동대문구</div>
													<div class="row foot">
														<div class="col-3 completBg">
															<h6>거래완료</h6>
														</div>
														<div class="col-9 price">
															<h5>10000원</h5>
														</div>
													</div>

												</div>
											</div>
											<hr>

											<!-- 거래 후기 링크 걸기 -->
											<div class="review">
												<a href="">거래후기 보내기</a>
											</div>
										</div>

									</li>
								</ul>
								<!---------forEach 사용 구간------------------------------------------------------------------------------>

							</div>


							<!-- 구매 완료 탭 -->
							<div class="tab_content">

								<!---------forEach 사용 구간------------------------------------------------------------------------------>
								<ul class="comment_list">
									<li class="commentItem">
										<!-- 구매 완료 출력 -->
										<div class="completDiv">
											<div class="row complet">
												<div class="col-12 col-md-4 col-sm-4 completImgDiv">
													<div class="completImg">
														<img src="...">
													</div>
												</div>
												<div class="col-12 col-md-8 col-sm-8 information">
													<div>
														<h4>
															<b>둘이 공부하는 자바</b>
														</h4>
													</div>
													<div>gab_by3130 ㅣ 서울특별시 송파구</div>
													<div class="row foot">
														<div class="col-3 completBg">
															<h6>거래완료</h6>
														</div>
														<div class="col-9 price">
															<h5>15000원</h5>
														</div>
													</div>

												</div>
											</div>
											<hr>

											<!-- 거래 후기 링크 걸기 -->
											<div class="review">
												<a href="">거래후기 보내기</a>
											</div>
										</div>

									</li>
								</ul>
								<!---------forEach 사용 구간------------------------------------------------------------------------------>

							</div>

						</div>
					</div>
				</section>
			</div>
		</div>
	</section>

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