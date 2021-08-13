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

<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous">
    </script>

<!-- icon css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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

/* 시작 */
* {
	box-sizing: border-box;
}

.container2 {
	margin: auto;
	margin-top:108px;
	height: 1000px;
	width: 1000px;
	overflow: hidden;
	padding: 30px;
	background-color: rgb(230, 235, 245);
	border-radius: 10px;
}

/* sns 헤더 */
/* 프로필 사진 */
.profileImg {
	width: 150px;
	height: 150px;
	border-radius: 100px;
	overflow: hidden;
	margin: auto;
	margin-top: 15px;
	border: 7px solid rgba(169, 213, 233, 0.644);
}

.profileImg>img {
	width: 100%;
	height: 100%;
}

/* 내정보 소개 */
.myInfo {
	margin: auto;
	text-align: center;
	border-radius: 10px;
	overflow: hidden;
	padding: 20px;
}

.id {
	margin-bottom: 20px;
}

.myIDandADD>div {
	color: gray;
}

.margin {
	height: 10px;
}

/* sns */
.container3 {
	width: 800px;
	margin: auto;
}

style>body {
	background-color: #eeeeee;
}

.h7 {
	font-size: 0.8rem;
}

.gedf-wrapper {
	margin-top: 0.97rem;
}

@media ( min-width : 992px) {
	.gedf-main {
		padding-left: 4rem;
		padding-right: 4rem;
	}
	.gedf-card {
		margin-bottom: 2.77rem;
	}
}

/**Reset Bootstrap*/
.dropdown-toggle::after {
	content: none;
	display: none;
}

#commenticon, #top, #love {
	cursor: pointer;
}

#commenticon {
	color: #AA96DA;
}

#love {
	color: #FFBCBC;
}

#del, #modi, #delcomm, #modicomm {
	font-size: 3px;
}

#top {
	position: fixed;
	bottom: 5%;
	right: 16%;
	width: 35px;
	display: none;
	font-size: 50px;
}
</style>

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
			<a href="index.html" class="navbar-brand"><p id=titlename>돈-다</a>
			</p>
			<b id=titleNextName>나의 커뮤니티</b>
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


	<!-- 커뮤니티 -->
	<div class="container2">

		<div class="row snsHeader">
			<div class="col-12 profileImgDiv">
				<div class="profileImg">
					<c:choose>
						<c:when test="${profile != null}">
							<img src="/imgs/mypage/${profile.sysName }" id=profile>
						</c:when>
						<c:otherwise>
							<img src="/imgs/nomalProfile.jpg" id=profile>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="myInfo">
				<div class="myInfo2">
					<div class="myNAme">
						<h4>
							<i class="far fa-comments"></i> ${myInfo.name }님의 커뮤니티</b>
						</h4>
					</div>
					<div class="myIDandADD">
						<div class="id">@${myInfo.id}</div>

						<div class="add">
							<i class="fas fa-map-marker-alt"></i> ${myInfo.address1 }
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="margin"></div>

		<hr>
		<!-- sns -->
		<!--- 게시글-->
		<div class="container3">
			<c:forEach var="item" items="${list}">
				<div class="card gedf-card">
					<div class="card-header">
						<div class="d-flex justify-content-between align-items-center">
							<div class="d-flex justify-content-between align-items-center">
								<div class="mr-2">
									<img class="rounded-circle" width="45"
										src="https://picsum.photos/50/50" alt="">
								</div>
								<div class="ml-2">
									<div class="h5 m-0">
										${item.id}
										<c:choose>
											<c:when test="${loginID == item.id }">
												<a
													href="${pageContext.request.contextPath}/sns/delete?seq=${item.seq }"
													id=del>삭제</a>
												<a
													href="${pageContext.request.contextPath}/sns/modify?seq=${item.seq }"
													id=modi>수정</a>
											</c:when>
										</c:choose>
									</div>
									<div class="h7 text-muted">${item.region}</div>
								</div>
							</div>
							<div></div>
						</div>
					</div>
					<div class="card-body">
						<div class="text-muted h7 mb-2">
							<i class="fa fa-clock-o"></i>${item.category }
						</div>
						<p class="card-text">${item.contents }</p>
					</div>
					<div class="card-footer">
						<a class="card-link" id=love><i class="far fa-heart"></i>${item.love }</a>
						<a class="card-link" id=commenticon><i
							class="fas fa-comment-dots"></i>Comment</a>
					</div>

					<!-- 댓글작성 -->
					<div id=hiddencomment style="display: none;">
						<div class="input-group mb-3">
							<input type="text" class="form-control" id=comment
								placeholder="댓글을 작성해주세요" aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button"
									id="sendcomment">
									<i class="fas fa-pen"></i>
								</button>
							</div>
							<input type=hidden id=hidden value=${item.seq }> <input
								type=hidden id=lovecount value=${item.love }>
						</div>

						<!-- 댓글리스트 -->
						<%-- <ul class="comments-list" id=commentList>
                        <div class="comment-body">
                            <div class="comment-heading">
                                <h6>list.id
                                    <c:choose>
                                        <c:when test="${loginID == comment.id }">
                                            <a href="${pageContext.request.contextPath}/snscomm/delete?seq=${comment.seq }"
                                                id=delcomm>삭제</a>
                                            <a href="${pageContext.request.contextPath}/snscomm/modify?seq=${comment.seq }"
                                                id=modicomm>수정</a>
                                        </c:when>
                                    </c:choose>
                                    </h5>
                                    <div type=hidden value=${comment.seq } id=commentseq></div>
                            </div>
                            <p>list.contents</p>
                        </div>
                        </ul> --%>
					</div>
				</div>
			</c:forEach>

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