<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대여 예약</title>
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
	width: 50%;
	text-align: center;
}

.navi {
	margin: auto;
	margin-top: 115px;
	width: 500px;
	height: 60px;
	border: 1px solid black;
	border-radius: 7px;
	overflow: hidden;
}

#title{
font-size:20px;
font-weight:800;
}

.requestProduct { /* 대여요청 네비 */
	height: 100%;
	background-color: #334257;
}

.requestProduct>a>b {
	color: white;
	font-size: 30px;
	line-height: 60px;
}

.requestTalent { /* 재능요청 네비 */
	height: 100%;
}

.requestTalent>a>b {
	font-size: 30px;
	line-height: 60px;
}

/* 시작 */
.container2 {
	margin: auto;
	width: 1000px;
	margin-top:100px;
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
	width: 250px;
	height: 205px;
	overflow: hidden;
	margin-top:11px;
	margin-left:10px;
	border-radius: 5px;
	border:1px solid gray;
}

img {
	width: 100%;
	height: 100%;
}

.information {
	padding-top: 40px;
	padding-left: 70px;
}

.content{
	margin-top:30px;
}

/* 버튼 */
.under {
	text-align: center;
	padding: 10px;
	margin-top: 10px;
}
#complete{
font-size:18px;
font-weight:800;
	color:blue;
}

.cnum-btn1 {
	/* 취소 */
	border-radius: 5px;
	width: 45%;
	height: 50px;
	background-color: white;
	border: 1px solid #334257;
	color: #334257;
	font-size: 15px;
	outline: none;
	cursor: pointer;
}

.cnum-btn2 {
	/* 수정 */
	border-radius: 5px;
	width: 45%;
	height: 50px;
	background-color: #334257;
	border: none;
	color: #fff;
	font-size: 15px;
	outline: none;
	cursor: pointer;
}
</style>
</head>

<script>
	$(function() {
		
		
		$.ajax({
			url:'/my/approved',
			method:'get',
			dataType:'json'
		}).done(function(result){
			
			let arr =[];
			
			for(let i=0; i<result.length; i++){
				arr.push(result[i].parentseq);
			}
			console.log(arr);
			
			for(let j=0; j<$(".parentseq").length; j++){
					let node = "";
					console.log($($(".parentseq")[j]).val());
				if(arr.indexOf(Number($($(".parentseq")[j]).val()))==-1){
					node += "<div class=under>"
					node += "<input type=button id=cancel class=cnum-btn1 value=예약취소>";
					node +=  "<button type=button id=approval class=cnum-btn2 disabled=disabled>승인 대기 중</button>"
					node += "</div>"
					$($(".parentseq")[j]).parent().append(node);
					
				}else{
						node += "<div class=under>"
						node += "<p id=complete> *판매자의 승인이 완료되었습니다! </p>"
						node += "<button type=button class=cnum-btn2 id=payment>결제하기</button>";
						node += "</div>"
					$($(".parentseq")[j]).parent().append(node);
				}
				
				
			}
			
		})
		// 게시물 검색
		$("#search").keyup(function(e) {
			if (e.keyCode == 13) {
				location.href = "/AllBoardList/lendList?choice=Allchoice&search="+$("#search").val()+"&cpage=1";
			}
		})

		// 채팅
		$("#chat").on("click", function() {
			location.href = "/chat/waitingroom";
		})

		// 결제하기 버튼을 눌렀을 경우
		$(document).on("click","button[id^='payment']",function() {

					location.href = "/point/TopaymentBylend?seq="
							+ $(this).parent().siblings("#parentseq").val()+ "&id="+$(this).parent().siblings("#writer").val()
						})

		// 예약 취소 버튼을 눌렀을 경우
      $(document).on("click",".cnum-btn1" ,function() {
         let result = confirm("취소 하시겠습니까?");
         console.log($($(this).parent().siblings("#parentseq")).val())
         if (result) {
            let button = $(this);
            $.ajax({
               url:"/my/bookingFail",
               data:{parent:$($(this).parent().siblings("#parentseq")).val()}
            }).done(function(resp){
               if(resp=="1"){
                  alert("취소하였습니다.")
                  location.reload();
               }else{
                  alert("에러 발생, 다시 시도해주세요.")
                  return false;
               }
            })
         } else {
            return false;
         }
      })
	})
	
</script>


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
	<!-- Nav Bar End -->


	<!-- 네비바 -->
<!-- 	<div class="navi">
		<div class="requestProduct">
			<a href="/my/buyRequestProduct"> <b>대여 예약</b>
			</a>
		</div>
		
	</div> -->



	<!-- 대여 요청 내역 -->
	<div class="container2">
		<div id="title">예약 내역 > 대여 예약</div>
		<c:forEach var="i" items="${requestRental}" varStatus="vs">
			<div class="requestList">
				<div class="row high">
					<div class="col-8 information">
						<div class="title">
							<h4>
								<b><a href="/lendBoard/lendView?seq=${i.parentseq}&id=${i.writer}">${i.title }</a></b>
							</h4>
						</div>
						<div class="row content">
							<div class="col-4 left">
								<b>물품 판매자</b>

							</div>
							<div class="col-8 right">${i.writer}</div>
						</div>
						<div class="row">
							
						</div>
						<div class="row">
							<div class="col-4 left">
								<b>결제금</b>
							</div>
							<div class="col-8 right">${i.price}상추</div>
						</div>
						<input type=hidden value=${i.writer } name="id" class="id" id=writer> 
						<input type=hidden value=${i.parentseq } name="parent" class="parentseq" id=parentseq>
					</div>
					<div class="col-4">
						<c:choose>
							<c:when test="${i.sysName != null }">
								<div class="image">
									<a href="/lendBoard/lendView?seq=${i.parentseq}&id=${i.writer}"><img src="/imgs/lend/${i.sysName }"></a>
								</div>	
							</c:when>
							<c:otherwise>
								<div class="image">
									<a href="/lendBoard/lendView?seq=${i.parentseq}&id=${i.writer}"><img src="/imgs/noimage.jpg"></a>
								</div>
							</c:otherwise>
						</c:choose>

					</div>
				</div>

			</div>
		</c:forEach>
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