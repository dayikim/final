<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>마이 프로필 내역</title>
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

/* 프로필-판매물품,거래후기 */
#body {
	padding-top: 80px;
	padding-bottom: 30px;
}

.wrapper {
	width: 100%;
	height: auto;
}

/* 작성자 프로필 */
#user-profile {
	position: relative;
	margin-top: 20px;
	margin-bottom:20px;
}

#user-profile #nickname {
	position: absolute;
	text-align: left;
	margin-top: 10px;
	font-size: 22px;
	font-weight: 600;
	letter-spacing: -0.6px;
	margin-bottom: 10px;
	vertical-align: middle;
	margin-left: 220px;
}

#user-profile #nickname #region_name {
	font-size: 17px;
	color: #212529;
	font-weight: normal;
	vertical-align: middle;
	margin-left: 6px;
}

div {
	display: block;
}

#user-profile #profile-image {
	width: 100px;
	height: 100px;
	margin-left: 100px;
	border-radius: 40px;
	overflow: hidden;
	vertical-align: middle;
}

/* 탭 메뉴 */
.tab_basic {
	margin-top: 20px;
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
	width: 100%;
	min-height: 100px;
	padding: 20px;
	background: white;
	box-sizing: border-box;
}

.tab_content:first-child {
	display: block;
}

.card {
	display: inline-block;
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
</style>
<script>
	$(function() {
		let tabList = document.querySelectorAll('.tab_list_wrap .tab_list')
		Array.prototype.forEach.call(tabList, function(list) {
			list.children[0].addEventListener('click', function(e) {
				e.preventDefault()
				let tabContent = document
						.querySelectorAll('.tab_container .tab_content')
				let tabNum = this.parentElement.getAttribute('data-tabnum')
				Array.prototype.forEach.call(tabContent, function(cont, i) {
					cont.style.display = 'none'
					tabList[i].className = 'tab_list'
				})
				tabContent[tabNum].style.display = 'block'
				if (list.className.indexOf('tab_active') == -1) {
					list.className = 'tab_list tab_active'
				}
			})
		})
		
		$("#Tomain").on("click",function(){
			location.href="/";
			
		})
		
		$("#sellingList").on("click",function(){
			$("#frm").submit();
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
			<a href="index.html" class="navbar-brand">
				<p id=titlename>돈-다</p>
			</a>

			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-between"
				id="navbarCollapse">
				<div class="navbar-nav ml-auto">

					<a href="#" class="nav-item nav-link active">Login</a>
					<!-- Login Page 이동 -->
					<a href="/person/join" class="nav-item nav-link">Sign Up</a>
					<!-- SignUp Page 이동 -->
				</div>
			</div>

		</div>
	</div>
	<!-- Nav Bar End -->
	<section id="body">
		<div class="container">
			<div class="form-control wrapper ">

				<section id="user-profile">
					<h2 id="nickname">
						<b>${myInfo.name}</b>님 <span id="region_name">${myInfo.address1}</span>
					</h2>

					<div id="profile-image">
						<c:choose>
							<c:when test="${profile != null}">
								<img src="/imgs/mypage/${profile.sysName }" id=profile>
							</c:when>
							<c:otherwise>
								<img src="/imgs/nomalProfile.jpg" id=profile>
							</c:otherwise>
						</c:choose>
					</div>


				</section>

				<section id=table_menu>
					<!-- Tabs -->
					<div class="tab_basic">
						<div class="row tab_list_wrap">
							<div class="tab_list tab_active col" data-tabnum="0">
							
								<button type="button" id="sellingList"> 판매목록 <span class="badge badge-pill badge-dark">${sellingCount}</span></button>
							</div>
							<div class="tab_list col" data-tabnum="1">
								<a href="/TBoard/Review">거래 후기 <span class="badge badge-pill badge-dark">3</span></a>
							</div>
							<!-- <div class="tab_list" data-tabnum="2">
								<a href="#">3번 탭</a>
							</div> -->
						</div>
						
						<div class="tab_container">
							<div class="tab_content">
								<div class="row">
								<c:forEach var="i" items="${sellinglist}">
								<form action="/tBoard/mySellingList" id="frm">
										<input type="hidden" name="id" value="${i.id}">
									</form>
									<div class="col-sm-4">
										<div class="card">
											<div class="card-body">
											
												<img src="..." class="card-img-top" alt="...">
												<h5 class="card-title">${i.title}</h5>
												<div class="card-price ">${i.price} 원</div>
												<div class="card-region-name">${myInfo.address1}</div>
												<div class="card-counts">
													<span> 채팅 <span class="badge badge-danger">3</span></span>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>

								</div>
							</div>
							<div class="tab_content">
								<ul class="comment_list">
									<li class="commentItem">
										<!-- 거래 후기 출력 -->
										<div class="col-12 d-md-block comment_box">
											<div class="comment_writerInfo">

												<!-- 거래 후기 작성자 프로필 -->
												<section id="small_user-profile">
													<h2 id="small_nickname">
														<a href="/users/2736355">cjy3037</a> <span
															id="small_region_name">송파구 잠실2동</span>
													</h2>

													<div id="small_profile-image">
														<c:choose>
															<c:when test="${profile != null}">
																<img src="/imgs/mypage/${profile.sysName }" id=profile>
															</c:when>
															<c:otherwise>
																<img src="/imgs/nomalProfile.jpg" id=profile>
															</c:otherwise>
														</c:choose>
													</div>

												</section>
											</div>
											<div class="comment_text">
												<p class="text_view">
													<span class="modify_option" id="com">${i.comments}</span>
												</p>
											</div>

											<div class="commentInfo">
												<span> <fmt:formatDate pattern="yyyy-MM-dd:hh:mm" />날짜
												</span>
											</div>

										</div>
									</li>
								</ul>
								<hr>

								<ul class="comment_list">
									<li class="commentItem">
										<!-- 거래 후기 출력 -->
										<div class="col-12 d-md-block comment_box">
											<div class="comment_writerInfo">
												<section id="small_user-profile">
													<h2 id="small_nickname">
														<a href="/users/2736355">cjy3037</a> <span
															id="small_region_name">송파구 잠실2동</span>
													</h2>

													<div id="small_profile-image">

														<img alt="써니사이드"
															src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png">
													</div>

												</section>
											</div>
											<div class="comment_text">
												<p class="text_view">
													<span class="modify_option" id="com">${i.comments}</span>
												</p>
											</div>

											<div class="commentInfo">
												<span> <fmt:formatDate pattern="yyyy-MM-dd:hh:mm" />날짜
												</span>
											</div>

										</div>
									</li>
								</ul>
							</div>
							<!-- <div class="tab_content">
								<span>빈 탭</span>
							</div> -->
						</div>
					</div>
				</section>
				<div class=" btn_wrap text-right ">
					<button type="button" class="btn btn-outline-info" id="Tomain">메인으로 이동</button>
				</div>
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