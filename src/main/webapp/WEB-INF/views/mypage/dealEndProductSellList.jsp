<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>물품 대여 완료</title>
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
	width: 50%;
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

.requestSellProduct { /* 물품 빌림하기 네비 */
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
	padding: 50px;
	padding-top: 10px;
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
/*모달창  */
.modal-title {
	margin: auto;
	font-size: 24px;
	font-weight: 800;
}

.review_title {
	display: block;
	margin: 0;
	font-size: 20px;
	font-weight: 800;
	color: black;
	text-align: start;
}

.review_text {
	display: block;
	margin: 0;
	font-size: 18px;
	text-align: start;
}

.review_form img {
	position: absolute;
	top: 20px;
	right: 20px;
	margin-bottom: 10px;
	width: 100px;
	overflow: hidden;
}

.review_form img {
	position: absolute;
	top: 20px;
	right: 20px;
	margin-bottom: 10px;
	width: 100px;
	overflow: hidden;
}

.writer {
	display: block;
	text-align: start;
}

.modalBtn {
	display: inline-block;
	margin-left: 10px;
}

.send {
	display: inline-block;
}

form {
	margin: 0;
}
</style>
<script>
	$(function() { // 게시물 검색
		$("#search")
				.keyup(
						function(e) {
							if (e.keyCode == 13) {
								location.href = "/AllBoardList/lendList?category=AllCategory&search="
										+ $("#search").val() + "&cpage=1";
							}
						})
		// 채팅
		$("#chat").on("click", function() {
			location.href = "/chat";
		})
		// person
		// 후기
		$(".send")
				.on(
						"click",
						function() {
							let message = $("#message-text");
							if (message.val() == "") {
								alert("메세지를 입력해주세요.");
								message.focus();
								return false;
							} else {
								let check = confirm("거래 후기를 보내시겠습니까?");
								let recipient = $("#recipient").val();
								let reviewer = $("#reviewer").val();
								let boardtype = $("#boardtype").val();
								let reviewable = $("#reviewable").val();
								let contents = $(".contents").val();
								let parentseq = $("#parentseq").val();
								if (check) {
									$
											.ajax({
												url : "/profile/checkReview",
												data : {
													parentseq : parentseq
												}
											})
											.done(
													function(resp) {
														console.log(resp);
														if (resp == 0) {
															$
																	.ajax(
																			{
																				url : "/profile/review",
																				data : {
																					recipient : recipient,
																					parentseq : parentseq,
																					reviewer : reviewer,
																					reviewable : reviewable,
																					contents : contents,
																					boardtype : boardtype
																				}
																			})
																	.done(
																			function(
																					resp) {
																				console
																						.log(resp);
																				if (resp == 1) {
																					alert("거래 후기 작성 완료!! \n마이페이지에서 거래완료 내역을 확인하세요.")
																					location.href = "${pageContext.request.contextPath}/my/mypageProc"
																				} else {
																					alert("작성 실패!!")
																				}
																			})
														} else {
															alert("이미 후기를 작성하였습니다.\n마이페이지에서 거래완료 내역을 확인하세요.")
															location.href = "${pageContext.request.contextPath}/my/mypageProc"
															return;
														}
													})
								} else {
									alert("거래 후기 작성 취소!")
									return;
								}
							}
						})
					$.ajax({
						url: '/my/reviewedBySeller',
						method: 'get',
						dataType: 'json'
					}).done(function (result) {

						let arr = [];

						for (let i = 0; i < result.length; i++) {
							arr.push(result[i].parentseq);
						}
						console.log(arr);

						for (let j = 0; j < $(".parentseq").length; j++) {
							let node = "";
							console.log($($(".parentseq")[j]).val());
							if (arr.indexOf(Number($($(".parentseq")[j]).val())) == -1) {

								node += "<div class=review>"
								node +=	"<a data-toggle=modal href=#sendModal id=openReview>작성한 후기 보기</a>"
								node += "</div>"

								$($(".parentseq")[j]).parent().append(node);

							}else{
								node += "<div class=review>"
								node += "<a data-toggle=modal href=#myModal id=payment>거래 후기 보내기</button>";
									
								$($(".parentseq")[j]).parent().append(node);
							}


						}

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
			<a href="/" class="navbar-brand">
				<p id=titlename>돈-다
			</a>
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
											<a class="dropdown-item"
												href="/AllBoardList/lendList?category=AllCategory&search=&cpage=1">Board</a>
											<a class="dropdown-item" href="/sns/main">SNS</a> <a
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
	
	<div class="navi">
		<div class="requestSellProduct">
			<a href="/my/dealEndProductSellList"> <b>물품 대여</b>
			</a>
		</div>
		<div class="requestBuyProduct">
			<a href="/my/dealEndProductBuyList"> <b>물품 빌림</b>
			</a>
		</div>

	</div>
	<br>
	<div class="container2">
		<div class="margin">
			<div>물품 > 물품대여 완료</div>
		</div>

		<!---------forEach 사용 구간------------------------------------------------------------------------------>

		<!-- 대여 완료 출력 -->
		<c:forEach var="i" items="${productSellList}" varStatus="vs">
			<div class="completDiv">
				<div class="row complet">
					<div class="col-12 col-md-4 col-sm-4 completImgDiv">
						<div class="completImg">

							<!-- lendboard 주소로 수정 -->
							<a href="/lendBoard/lendView?id=${i.buyer}&seq=${i.parentseq}"><img
								src="..."></a>
						</div>
					</div>
					<div class="col-12 col-md-8 col-sm-8 information">
						<div>
							<h4>
								<!-- lendboard 주소로 수정 -->
								<a href="/lendBoard/lendView?id=${i.buyer}&seq=${i.parentseq}">
									<b>${i.item}</b>
								</a>

							</h4>
						</div>
						<div>물품 빌린이: ${i.name}</div>
						<div>거래 완료 일시: ${i.paymentdate}</div>
						<div class="row foot">
							<div class="col-3 completBg">
								<h6>거래완료</h6>
							</div>
							<div class="col-9 price">
								<h5>${i.price}상추</h5>
							</div>
						</div>
					</div>
				</div>
				<hr>

				<!-- 거래 후기 링크 걸기 -->
				<div class="review">
					<c:choose>
						<c:when test="${i.reviewable =='y'}">
							<a href="" data-toggle="modal"
								data-target="#sendModal${vs.index}" id="openReview">작성한 후기
								보기</a>
						</c:when>
						<c:otherwise>
							<a href="" data-toggle="modal"
								data-target="#writeModal${vs.index}" id="other">거래 후기 보내기</a>
						</c:otherwise>
					</c:choose>
					<div class="modal fade modal_box" id="writeModal${vs.index}"
						tabindex="-1" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">거래후기 보내기</h5>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<div class="mb-3 review_form">
											<label class="col-form-label review_title">거래 경험이
												좋으셨나요?</label> <label class="col-form-label review_text">${i.seller}님에게
												감사인사 남겨보세요.</label> <img src="/imgs/letter.png">
										</div>
										<hr>
										<div class="mb-3">
											<textarea class="form-control contents" name="contents"
												id="message-text" placeholder="거래 후기 남겨주세요"></textarea>
										</div>
									</div>
									<input type="hidden" name="reviewer" value="${loginID}"
										id="reviewer"> <input type="hidden" name="recipient"
										value="${i.buyer}" id="recipient"> <input
										type="hidden" name="boardtype" value="${i.boardtype}"
										id="boardtype"> <input type="hidden" name="seq"
										value="${i.parentseq}" id="parentseq"> <input
										type="hidden" name="reviewable" value="y" id="reviewable">
									<button type="button" class="btn btn-dark modalBtn"
										data-dismiss="modal">취소</button>
									<button type="button"
										class="btn btn-outline-warning modalBtn send">보내기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="modal fade modal_box" id="sendModal${vs.index}"
						tabindex="-1" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">내가 보낸 거래후기
										보기</h5>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<div class="mb-3 review_form">
											<label class="col-form-label review_title">${i.name}님에게
												감사인사를 남겼습니다.</label> <label class="col-form-label review_text"></label>
											<img src="/imgs/letter.png">
										</div>
										<hr>
										<div class="mb-3">
											<input class="form-control contents" value="${i.contents}"
												readonly="readonly"></input>
										</div>
									</div>
									<button type="button" class="btn btn-dark modalBtn"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>


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