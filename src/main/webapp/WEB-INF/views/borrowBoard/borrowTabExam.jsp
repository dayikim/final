<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>게시판</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free Website Template" name="keywords">
<meta content="Free Website Template" name="description">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap" rel="stylesheet">

<!-- CSS Libraries -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
<style>
body {background-color: #f5f6f7;}

* {margin: 0;padding: 0;}

/* 네비바 및 상단 고정 부분 */
#titlename {margin-top: 1%;	margin-bottom: 0; font-size: 30px; font-family: 'Gugi', cursive; color: white;}
img {width: 100%;}
#search {width: 500px; position: relative;}
.Explanation {position: relative; top: 30%;}
.subject {color: #1d2434; text-align: center; font-size: 40px; font-weight: 800;}
.contents {margin-top: 5%; text-align: center; font-size: 25px;	font-weight: bold;}
.Main {margin-top: 5%;}

/* 프로필-판매물품,거래후기 */
#body {padding-top: 130px; padding-bottom: 30px;}
.wrapper {width: 100%; height: auto;}

/* 탭 메뉴 */
.tab_basic {margin-top: 10px; width: 80%; margin: auto;}
.tab_list_wrap {font-size: 0; height: 35px;}
.tab_list {display: inline-block; width: 50%; height: 100%;	font-size: 15px; line-height: 30px;	text-align: center;	border: 1px solid grey;	border-right: 0; box-sizing: border-box;}
.tab_list:last-child {border-right: 1px solid rgb(112, 91, 91);}
.tab_list {background: #1d2434;}
.tab_list button{background-color: #1d2434; border:#1d2434; color: white;}
.tab_list a {display: block; width: 100%; height: 100%; text-decoration: none; color: rgb(0, 0, 0);	font-weight: 800;font-weight: 800;}
.tab_content {display: none; width: 100%; min-height: 100px; padding: 20px; box-sizing: border-box;}
.tab_content:first-child {display: block;}
.card {display: inline-block; border: white;}
.board_page{text-align:center;}

</style>

<script>
	$(function(){
		$("#search").keyup(function(e) {
			if (e.keyCode == 13) {
				location.href = "/AllBoardList/lendList?category=AllCategory&search="+$("#search").val()+"&cpage=1";
			}
		})	
	})
		
	$(function() {			

		var tabList = document.querySelectorAll('.tab_list_wrap .tab_list');
		
		
		Array.prototype.forEach.call(tabList, function(list) {
			console.log(list.children[0]);
			list.children[0].addEventListener('click', function(e) {
				e.preventDefault()
				
				let tabContent = document.querySelectorAll('.tab_content');
				console.log(tabContent);
				
				let tabNum = this.parentElement.getAttribute('data-tabnum');
				console.log(tabNum);
				
				Array.prototype.forEach.call(tabContent, function(cont, i) {
					cont.style.display = 'none'
					tabList[i].className = 'tab_list'
				})
				
				tabContent[tabNum].style.display = 'block'
					if(list.className.indexOf('tab_active') == -1) {
					list.className = 'tab_list tab_active'
				}
			})
		})

		
		$("#Tomain").on("click",function(){
			location.href="/";
			
		})
		
// 		$("#lendList").on("click",function(){
// 			$("#frm1").submit();
// 		})
		
// 		$("#borrowList").on("click",function(){
// 			$("#frm2").submit();
// 		})
		
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
                <a href="index.html" class="navbar-brand"><p id=titlename>돈-다</p></a>
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
                        		<a href="/my/mypageProc" class="nav-item nav-link">MyPage</a>  <!-- My Page 이동 -->
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
				<section id=table_menu>
				
					<!-- Tabs -->
					<div class="tab_basic">
						
						<!-- Tabs button -->
						<div class="row tab_list_wrap">
							<div class="tab_list tab_active col" data-tabnum="0">
								 <a href="/AllBoardList/lendList?category=${category}&search=${search}&cpage=1" class="btn" id="lendList">대여하기</a>
							</div>
							<div class="tab_list col" data-tabnum="1">
								<a href="/AllBoardList/borrowList?category=${category}&search=${search}&cpage=1" class="btn" id="borrowList">대여요청</a>
							</div>
							<div class="tab_list col" data-tabnum="2">
								<button type="button" id="tlSellList">재능등록</button> 
							</div>
							<div class="tab_list col" data-tabnum="3">
								<button type="button" id="tlRequestList">재능대여</button> 
							</div>
						</div>
						
						
						<div class="tab_container">
							<!-- 대여하기 -->
							<div class="tab_content">
								<div class="row">
								<form action="/AllBoardList/lendList" id="frm1">
										<input type="hidden" name="search" value="${search}">
										<input type="hidden" name="category" value="${category}">
										<input type="hidden" name="cpage" value="1">
								</form>
								<c:forEach var="ld" items="${ldList}">
									<div class="col-sm-4">
										<div class="card">
											<div class="card-body">
												<img src="..." class="card-img-top" alt="...">
												<h5 class="card-title"><a href="/lend/detailView?seq=${ld.seq}">${ld.title}</a></h5>
												<div class="card-address1">${ld.address1}</div>
												
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
								<!-- 페이징 네비바 -->
								<div class="board_page">
									<c:forEach var="ln" items="${ldNavi}" varStatus="s">
										<c:choose>
											<c:when test="${ln == '>'}">
												<a href="/AllBoardList/lendList?cpage=${ldNavi[s.index-1]+1}&category=${category}&search=${search}">${ln}</a>
											</c:when>
											<c:when test="${ln == '<'}">
												<a href="/AllBoardList/lendList?cpage=${ldNavi[s.index-1]+1}&category=${category}&search=${search}">${ln}</a>
											</c:when>
											<c:otherwise>
												<a href="/AllBoardList/lendList?cpage=${ln}&category=${category}&search=${search}">${ln}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
							</div>
						
							<!-- 대여요청 -->
							<div class="tab_content borrowList">
								<div class="row">
								<form action="/AllBoardList/borrowList" id="frm2">
										<input type="hidden" name="search" value="${search}">
										<input type="hidden" name="category" value="${category}">
										<input type="hidden" name="cpage" value="1">
								</form>
								<c:forEach var="bw" items="${bwList}">
									<div class="col-sm-4">
										<div class="card">
											<div class="card-body">
												<img src="..." class="card-img-top" alt="...">
												<h5 class="card-title"><a href="/borrow/detailView?seq=${bw.seq}">${bw.title}</a></h5>
												<div class="card-price ">${bw.address1}</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
								<!-- 페이징 네비바 -->
								<div class="board_page">
									<c:forEach var="bn" items="${bwNavi}" varStatus="s">
										<c:choose>
											<c:when test="${bn == '>'}">
												<a href="/AllBoardList/borrowList?cpage=${bwNavi[s.index-1]+1}&category=${category}&search=${search}">${bn}</a>
											</c:when>
											<c:when test="${bn == '<'}">
												<a href="/AllBoardList/borrowList?cpage=${bwNavi[s.index-1]+1}&category=${category}&search=${search}">${bn}</a>
											</c:when>
											<c:otherwise>
												<a href="/AllBoardList/borrowList?cpage=${bn}&category=${category}&search=${search}">${bn}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
							</div>
						
							<!-- 재능등록 -->
							<div class="tab_content">
								<div class="row">
								<c:forEach var="i" items="${sellinglist}">
								<form action="/tBoard/userSelling" id="frm3">
										<input type="hidden" name="id" value="${i.id}">
								</form>
									<div class="col-sm-4">
										<div class="card">
											<div class="card-body">
											
												<img src="..." class="card-img-top" alt="...">
												<h5 class="card-title">${i.title}</h5>
												<div class="card-price ">${i.price} 원</div>
												<div class="card-region-name">${memberInfo.address1}</div>
												<div class="card-counts">
													<span> 채팅 <span class="badge badge-danger">3</span></span>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
						
							<!-- 재능요청 -->
							<div class="tab_content">
								<div class="row">
								<c:forEach var="i" items="${sellinglist}">
								<form action="/tBoard/userSelling" id="frm4">
										<input type="hidden" name="id" value="${i.id}">
								</form>
									<div class="col-sm-4">
										<div class="card">
											<div class="card-body">
											
												<img src="..." class="card-img-top" alt="...">
												<h5 class="card-title">${i.title}</h5>
												<div class="card-price ">${i.price} 원</div>
												<div class="card-region-name">${memberInfo.address1}</div>
												<div class="card-counts">
													<span> 채팅 <span class="badge badge-danger">3</span></span>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
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
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
		<script src="/lib/easing/easing.min.js"></script>

		<!-- Template Javascript -->
		<script src="/js/main.js"></script>
	</footer>

</body>

</html>