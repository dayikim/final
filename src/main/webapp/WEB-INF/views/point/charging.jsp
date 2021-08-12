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
	padding-top: 80px;
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
#payment {
	position: relateive;
}

.charging {
	width: 70%;
	text-align: center;
	justify-content: center;
	margin: auto;
	margin-bottom: 30px;
}

.charge-wrapper {
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
}

.pay_info {
	margin: 10px;
	margin-bottom: 10px;
	text-decoration: underline;
}

.row {
	align-content: center;
	justify-content: center;
}

.chargeBox {
	border-radius: 30px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	margin-right: 10px;
	display: inline-block;
}

.form-check {
	text-align: center;
	margin-left: 20px;
	border: none;
}

.point_wrap {
	text-align: center;
}

.card {
	display: inline-block;
}

.method {
	display: inline-block;
}

.point {
	display: inline-block;
	margin-right: 10px;
}

.amount_box {
	margin-right: 30px;
	display: inline-block;
}

.amount {
	margin-right: 10px;
	font-size: 20px;
}

#won {
	font-size: 20px;
	margin-right: 30px;
}

.pay_info {
	float: right;
	margin-right: 120px;
	margin-top: 0;
	font-style: italic;
}

.btn_wrap {
	margin-right: 30px;
	margin-top: 50px;
	margin-bottom: 10px;
}

#charge {
	margin-right: 10px;
}

/* 기타금액 */
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

/* footer */
</style>
<script>
	/*  function getdata(value){
	      //check your value through console log
	       console.log(value);   
	 } */
	$(function() {
		$(".point1").on("click", function() {
			$(".amount").text("1,000");

		})

		$(".point2").on("click", function() {
			$(".amount").text("2,000");

		})
		$(".point3").on("click", function() {
			$(".amount").text("5,000");

		})
		$(".point4").on("click", function() {
			$(".amount").text("7,000");

		})
		$(".point5").on("click", function() {
			$(".amount").text("10,000");

		})

		$("#other").on("click", function() {
			$(".amount").text("0");
		})

		$(".insert").on("click", function() {
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
					 $(".amount").text(money);
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

		$("#cancel").on("click", function() {
			$(".amount").text("0");
		})

		//   $("#otherAmount").on("click",function() {							
		// 			  window.open("/payment/otherAmount?seq="+parent,"기타 금액","width=450,height=450");           
		// 		    });   

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
					<div id="nickname_box">
						<h2 id="nickname">
							<b>${myInfo.name}</b>님
						</h2>
						<span id="region_name">${myInfo.address1}</span>
					</div>
					<div id="mypoint">
						<span>현재 나의 포인트(상추) :</span>

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
				<section id="card payment">
					<div class="card-header">
						<i class="fas fa-coins"> 돈다 포인트 충전</i>
					</div>
					<div class="form-control charging wrapper ">
						<div class="charge-wrapper">
							<h4 id="charging">
								<b>충전하기</b>
							</h4>
							<div class=" row">
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
							<div class="row">
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
											
										<div class="modal fade modal_box" id="exampleModal" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
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
															</label>
															<!-- <input class="form-control" id="amount_input"
                                                                        placeholder="충전금액"
                                                                        onKeyup="this.value=this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');"
                                                                        required></input><span
                                                                        class="point_title"><strong>상추</strong></span> -->
															<input type="number" class="form-control" id="amount_input"
																placeholder="충전금액" required></input><span
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
						</div>
						<hr>
						<!-- 결제 수단 -->
						<div class="paymentmethod-wrapper method">
							<h4 id="charging method">
								<b>결제수단</b>
							</h4>
						</div>
						<div class="form-check card">
							<input class="form-check-input" type="radio" name="paymentmethod"
								value="creditcard" id="card" checked> <label
								class="form-check-label" for="flexRadioDefault2" id="card">
								신용카드 </label>
						</div>
						<hr>
						<div class="point_wrap text-right">
							<h4 class="point">
								<b>결제할 충전금액 : </b>
							</h4>
							<div class="amount_box">
<!-- 							onchange="this.value=this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');"
 -->								<span class="amount">0 <b id="won">원</b></span>
							</div>
						</div>
						<Strong class="pay_info">*100 상추는 1,000원입니다.</Strong>

						<!-- 충전 버튼 -->
						<div class=" btn_wrap text-right ">

							<button type="button" class="btn btn-primary btn-lg"
								style="width: 200px;" id="charge">충전</button>
							<button type="button" id="cancel" class="btn btn-dark btn-lg">취소</button>
						</div>
					</div>
					<div class=" btn_wrap text-right ">
					<button type="button" onclick="history.back()" class="btn btn-info btn-lg">마이페이지로 이동</button>
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