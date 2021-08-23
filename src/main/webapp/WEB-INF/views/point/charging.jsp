<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>충전하기</title>
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
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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

/* 프로필,충전하기 */
#body {
	padding-top: 100px;
	padding-bottom: 30px;
}

.wrapper {
	width: 100%;
	height: auto;
}

/* 작성자 프로필 */
#user-profile {
	margin-top: 40px;
	margin-bottom: 40px;
	display: inline-block;
}

/* 아이디 */
#user-profile #nickname {
	position: absolute;
	text-align: center;
	margin-top: 10px;
	font-size: 22px;
	font-weight: bold;
	letter-spacing: -0.6px;
	margin-bottom: 10px;
	margin-left: 140px;
	display: inline-block;
}

/* 위치  */
#user-profile #region_name {
	position: absolute;
	text-align: center;
	margin-top: 10px;
	letter-spacing: -0.6px;
	margin-bottom: 10px;
	margin-left: 255px;
	font-size: 17px;
	display: inline-block;
}

#user-profile #mypoint {
	position: absolute;
	text-align: center;
	margin-top: 50px;
	font-size: 18px;
	font-weight: bold;
	letter-spacing: -0.6px;
	margin-bottom: 10px;
	display: inline-block;
	margin-left: 140px;
}

/* 프로필 이미지 */
#user-profile #profile-image img {
	width: 50px;
	height: 50px;
	margin-left: 80px;
	border-radius: 40px;
	overflow: hidden;
	vertical-align: middle;
}

/* 충전하기 */
.charging {
	width: 70%;
	justify-content: center;
	margin: auto;
	margin-bottom: 30px;
}

.charge-wrapper {
	margin: auto;
	margin-top: 10px;
	margin-bottom: 20px;
	border-radius: 5px;
	border: 1px solid gray;
	width: 100%;
	margin-bottom: 20px;
}

#charging_title {
	display: block;
	margin-left: 10px;
	margin-top: 10px;
}

.card-header {
	width: 70%;
	margin: auto;
	background-color: rgba(18, 54, 29, 0.973);
	border-radius: 10px;
	border: solid 1px black;
	color: white;
	font-size: 20px;
	font-weight: bold;
	margin-top: 20px;
}

.final_price {
	margin-left: 10px;
    font-size: 20px;
	color: #2ca10f;
	font-weight: 800;
}

.pay_info {
	text-decoration: underline;
	font-size: 15px;
}

.choice_point1, .choice_point2 {
	align-content: center;
	justify-content: center;
}

.choice_point1 {
	margin-top: 10px;
}

.choice_point2 {
	margin-bottom: 10px;
}

/* 결제수단 */
#paymentMethod {
	border-radius: 5px;
	border: 1px solid gray;
	width: 100%;
	height: auto;
	margin: auto;
	margin-bottom: 20px;
}

.method {
	margin-left: 10px;
	margin-top: 10px;
}

.form-check {
	text-align: center;
	margin-left: 20px;
	border: none;
}

.card {
	display: inline-block;
	text-align: center;
	margin-left: 100px;
}

.card {
	text-align: center;
}

#charge_wrap {
	border-radius: 5px;
	border: 1px solid gray;
	width: 100%;
	height: auto;
	margin: auto;
	margin-bottom: 20px;
}

hr {
	margin: 0px;
}

.chargeBox {
	border-radius: 30px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	margin-right: 10px;
	display: inline-block;
}

.method {
	display: inline-block;
}

.point {
	display: block;
	margin-right: 10px;
	margin-top: 10px;
}

.amount_box {
	margin-right: 30px;
	display: inline-block;
}

.amount {
	width: 100px;
	text-align: right;
	margin-right: 10px;
	font-size: 20px;
}

#won {
	font-size: 20px;
	margin-right: 30px;
}

.pay_info {
	display: block;
	margin-top: 40px;
	margin-right: 10px;
	margin-top: 0;
	font-style: italic;
}

/* 충전 버튼 */
.btn_wrap {
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: center;
}

#charge {
	margin: auto;
	margin-right: 10px;
}

/* 기타금액 충전 */
.modalBtn {
	float: right;
	margin-left: 10px;
}

#amount_input {
	display: inline-block;
	width: 250px;
}

.point_title {
	display: inline-block;
	margin: 10px;
}

/* 최종 결제 금액 */
#payment {
	border-radius: 5px;
	border: 1px solid gray;
	width: 100%;
	margin: auto;
	height: auto;
}

/* 충전액 */
.point_wrap {
	margin-top: 10px;
	margin-left: 20px;
	height: auto;
	margin-bottom: 10px;
}

.point_wrap .amount {
	width: 80px;
	margin-left: 10px;
	margin-right: 10px;
}

#pay_amount {
	margin-top: 10px;
}

.pay_box {
	text-align: center;
}
</style>
<script>

				$(function () {
					$(".point1").on("click", function () {
						$(".amount").val("1000");

					})

					$(".point2").on("click", function () {
						$(".amount").val("2000");

					})
					$(".point3").on("click", function () {
						$(".amount").val("5000");

					})
					$(".point4").on("click", function () {
						$(".amount").val("7000");

					})
					$(".point5").on("click", function () {
						$(".amount").val("10000");

					})

					$("#other").on("click", function () {
						$(".amount").val("0");
					})

					$(".insert").on("click", function () {
						let otherAmount = $("#amount_input");
						let amountReg = /\d/g;
						let resultAmount = amountReg.test(otherAmount.val());
						let money = (otherAmount.val() * 10)

						if (resultAmount) {
							if (otherAmount.val() < 100) {
								alert("최소 충전 금액은 100상추입니다. 충전 금액을 다시 입력해주세요.");
								otherAmount.val("");
								otherAmount.focus();
								return false;
							} else {
								$(".amount").val(money);
/* 					document.querySelector(".amount").onchange(); // 값이 바뀐 엘리먼트에 onchange 함수를 실행 
 */				}
						} else {
							alert("숫자만 입력해주세요.")
							otherAmount.val("");
							otherAmount.focus();
							return false;
							console.log
						}
						otherAmount.val("");
						$(".modal_box").modal("hide");
					})

					$("#cancel").on("click", function () {
						$(".amount").val("0");
					})

					$('#charge').click(function () {
						// getter
						let IMP = window.IMP;
						IMP.init('imp55463683');
						let money = $(".amount").val();
						console.log(money);

						IMP.request_pay({
							pg: 'kakao',
							merchant_uid: 'merchant_' + new Date().getTime(),

							name: '돈다 : 돈다 포인트(상추) 충전',
							amount: money,
							buyer_email: '${myInfo.email}',
							buyer_name: '${myInfo.name}',
							buyer_tel: '${myInfo.phone}',
							buyer_addr: '${myInfo.address1}',
							buyer_postcode: '{myInfo.postcode}'
						}, function (rsp) {
							console.log(rsp);
							if (rsp.success) {
								var msg = '결제가 완료되었습니다.\n';
								/*    msg += '고유ID : ' + rsp.imp_uid;
								   msg += '상점 거래ID : ' + rsp.merchant_uid; */
								msg += '\n 결제 금액 : ' + rsp.paid_amount;
								msg += '\n 카드 승인번호 : ' + rsp.apply_num;
								msg += '\n\n 확인 후 마이 페이지로 이동합니다.'

								$.ajax({
									type: "GET",
									url: "/point/charging", //충전 금액값을 보낼 url 설정
									data: {
										"amount": money
									},
								});
								alert(msg);
								document.location.href = "/my/mypageProc";

							} else {
								var msg = '결제에 실패하였습니다.\n';
								msg += '\n 에러내용 : ' + rsp.error_msg;
								alert(msg);
								document.location.href = "/point/ToCharging"

							}
						});
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
			<div class="form-control wrapper ">
				<section id="user-profile">
					<div id="nickname_box">
						<h2 id="nickname">
							<b>${myInfo.name}</b>님
						</h2>
						<span id="region_name">${myInfo.address1}</span>
					</div>

					<div id="mypoint">
						<span>현재 나의 포인트(상추) : <b class="final_price">${point}</b>
						</span>

					</div>
					<div id="profile-image">
						<!-- 프로필 이미지 -->
						<c:choose>
							<c:when test="${profile != null}">
								<img src="/imgs/mypage/${profile.sysName}">
							</c:when>
							<c:otherwise>
								<img src="/imgs/nomalProfile.jpg">
							</c:otherwise>
						</c:choose>
					</div>

				</section>
				<hr>
				<!-- 충전하기 -->
				<section id="card_payment">
					<div class="card-header">
						<i class="fas fa-coins"> 돈다 포인트 충전</i>
					</div>
					<div class="form-control charging wrapper ">


						<section id=charging_point">
							<div class="charge-wrapper">
								<h4>
									<b id="charging_title"> 충전 금액</b>
								</h4>
								<hr>
								<div class="row choice_point1">
									<div class="col-sm-2 ">
										<div class="chargeBox">
											<button type="button" class="btn btn-outline-success point1"
												value="100">100 상추</button>

										</div>
									</div>
									<div class="col-sm-2">
										<div class="chargeBox">
											<button type="button" class="btn btn-outline-success point2"
												value="200">200 상추</button>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="chargeBox">
											<button type="button" class="btn btn-outline-success point3"
												value="500">500 상추</button>
										</div>
									</div>
								</div>
								<div class="row choice_point2">
									<div class="col-sm-2">
										<div class="chargeBox">
											<button type="button" class="btn btn-outline-success point4"
												value="700">700 상추</button>
										</div>
									</div>

									<div class="col-sm-2">
										<div class="chargeBox">
											<button type="button" class="btn btn-outline-success point5"
												value="1000" style="width: 105px;">1,000 상추</button>
										</div>
									</div>

									<div class="col-sm-2">
										<div class="chargeBox">
											<!-- <a href=""> <button type="button" class="btn btn-outline-success" id="otherAmount">
														기타금액</button></a> -->
											<button type="button" class="btn btn-outline-success"
												data-toggle="modal" data-target="#exampleModal" id="other">기타금액</button>

											<div class="modal fade modal_box" id="exampleModal"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close"></button>
														<div class="modal-body">
															<div class="form-group">
																<label for="message-text" class="col-form-label">
																	<h5>
																		<b>100 상추부터 10,000 상추까지 충전가능합니다.</b>
																	</h5>
																</label> <input type="number" class="form-control"
																	id="amount_input" placeholder="충전금액" required></input><span
																	class="point_title"><strong>상추</strong></span>
															</div>

															<button type="button" class="btn btn-dark modalBtn"
																data-dismiss="modal">취소</button>
															<button type="button"
																class="btn btn-outline-success modalBtn insert">확인</button>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr>
							</div>

						</section>

						<!-- 결제 수단 -->
						<section id="paymentMethod">
							<div class="paymentmethod-wrapper method">
								<h4 id="charging method">
									<b id="method">결제수단</b>
								</h4>
							</div>
							<div class="form-check card">
								<input class="form-check-input" type="radio"
									name="paymentmethod" value="creditcard" id="card" checked>
								<label class="form-check-label" for="flexRadioDefault2"
									id="card"> 신용카드 </label>
							</div>
						</section>
						<section id="payment">
							<div class="point_wrap">
								<h4 class=" point">
									<b id="pay_title">최종 결제 금액 </b>
								</h4>
								<hr>
								<div class="pay_box">
									<span>
										<h5 id="pay_amount">
											<b>충전금 결제액: </b> <input class="amount" readonly> <b
												id="won">원</b>
										</h5>
									</span> <Strong class="pay_info">*100 상추는 1,000원입니다.</Strong>
								</div>
							</div>
						</section>

						<!-- 충전 버튼 -->
						<div class=" btn_wrap ">
 
							<button type="button" class="btn btn-success btn-lg"
								style="width: 200px;" id="charge">충전</button>
							<button type="button" id="cancel" class="btn btn-dark btn-lg">취소</button>
						</div>
					</div>
					<!-- <div class=" btn_wrap text-right ">
						<button type="button" onclick="history.back()"
							class="btn btn-info btn-lg">마이페이지로 이동</button>
					</div> -->
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
						<p id="titlename">
							<a href="#">돈-다</a>, All Right Reserved.
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