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

.navi1,.navi2 {
	float: left;
	width: 50%;
	text-align: center;
}

.navi {
	margin: auto;
	margin-top: 115px;
	width: 500px;
}

hr{width:1000px;}


/* 시작 */
.container2 {
	margin: auto;
	width: 1000px;
	padding: 50px;
	padding-top:10px;
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
									          <a class="dropdown-item" href="#">Board</a>
									          <a class="dropdown-item" href="#">SNS</a>
									          <a class="dropdown-item" href="#">My page</a>
									          <a class="dropdown-item" href="#">Charging</a>
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

	<!-- 네비바 -->
	<div class="navi">
		<div class="navi1">
			<ul class="navbar-nav">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 물품대여 </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="/my/dealEndProductSellList">판매 완료</a> 
					<a class="dropdown-item" href="/my/dealEndProductBuyList">구매 완료</a> 
				</div>
			</li>
			</ul>
		</div>
		
		<div class=navi2>
			<ul class="navbar-nav">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 재능등록 </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="/my/dealEndTalentSellList">판매 완료</a> 
					<a class="dropdown-item" href="/my/dealEndTalentBuyList">구매 완료</a> 
				</div>
			</li>
			</ul>
		</div>
		
		
	</div><br><br>
	
	<hr>


	<div class="container2">
	
		<div class="margin">
			<div>물품 대여 > 판매 완료</div>
		</div>
	
		<!---------forEach 사용 구간------------------------------------------------------------------------------>

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