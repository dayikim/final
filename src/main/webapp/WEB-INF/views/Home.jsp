<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>돈 빼고 다! 돈-다</title>
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
#titlename{
    margin-top: 1%;
    margin-bottom: 0;
    font-size: 30px;
    font-family: 'Gugi', cursive;
    color:white;
}
img{
    width: 100%;
}
#search{
    width: 500px;
    position: relative;
}
.Explanation{
    position: relative;
    top: 30%;
}
.subject{
    color: #1d2434;
    text-align: center;
    font-size: 40px;
    font-weight: 800;
}
.contents{
    margin-top: 5%;
    text-align: center;
    font-size: 25px;
    font-weight: bold;
}
.Main{
    margin-top: 5%;
}
    </style>

	<script>
		$(function() {
			$("#search").keyup(function(e) {
				if (e.keyCode == 13) {
					location.href = "/AllBoardList/lendList?category=AllCategory&search="+$("#search").val()+"&cpage=1";
				}
			})
			
			$("#chat").on("click",function(){
				location.href = "/chat";
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
        <div class="container-fluid">
            <div class = "row Main">
                <div class="col-6" id ="Main-1">
                    <img src="/imgs/Main-1.jpg">
                </div>
                <div class="col-6 Main-text first">
                    <div class="Explanation">
                        <div class = "subject">돈-다에서는 물건에 대한 새로운 방식을 제시합니다!</div>
                        <div class = "contents">가까운 이웃에게 물건을 빌리고, 빌려주세요!</div>
                    </div>
                    </div>
                </div>
            <div class = "row Main">
                <div class="col-6">
                    <img src="/imgs/Main-2.png">
                </div>
                <div class="col-6 Main-text second">
                    <div class="Explanation">
                        <div class = "subject">새로운 즐거움을 나눠봐요!</div>
                        <div class = "contents">새로운 이웃을 만나고,</div>
                        <div class = "contents">그들과 경험을 공유하세요!</div>
                    </div>
                </div>
            </div>
            <div class = "row Main">
                <div class="col-6">
                    <img src="/imgs/Main-3.jpg">
                </div>
                <div class="col-6 Main-text third">
                    <div class="Explanation">
                        <div class = "subject">경제적이고, 합리적인 선택이 됩니다!</div>
                        <div class = "contents">경제적이고,합리적인 소비를 통해</div>
                        <div class = "contents">똑똑한 소비자가 돼 보아요!</div>
                    </div>
                </div>
            </div>
            <div class = "row Main">
                <div class="col-6">
                    <img src="/imgs/Main-4.jpg">
                </div>
                <div class="col-6 Main-text third">
                    <div class="Explanation">
                        <div class = "subject">주변과의 새로운 연결 고리가 됩니다!</div>
                        <div class = "contents">단순히 물건을 주고 받는게 아닌</div>
                        <div class = "contents">서로와 서로를 연결해봐요!</div>
                    </div>
                </div>
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
                                    <p><i class="fa fa-map-marker-alt"></i>서울특별시 강남대로 123로</p>
                                    <p><i class="fa fa-phone-alt"></i>02-123-4567</p>
                                    <p><i class="fa fa-envelope"></i>DonDa@example.com</p>
                                    <div class="footer-social">
                                        <a href=""><i class="fab fa-twitter"></i></a>
                                        <a href=""><i class="fab fa-facebook-f"></i></a>
                                        <a href=""><i class="fab fa-youtube"></i></a>
                                        <a href=""><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-6">
                                <div class="footer-contact">
                                    <p><i class="far fa-building"></i>회사소개</p>
                                    <p><i class="far fa-user-circle"></i>채용</p>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="footer-contact">
                                    <p><i class="fas fa-info"></i>이용약관</p>
                                    <p><i class="far fa-id-badge"></i>개인정보처리방침</p>
                                    <p><i class="fas fa-map-pin"></i>위치기반서비스 이용약관</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container copyright">
                <div class="row">
                    <div class="col-12" style="text-align: center;">
                        <p id=titlename>&copy; <a href="#">돈-다</a>, All Right Reserved.</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="/lib/easing/easing.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="/js/main.js"></script>
    </body>
</html>
