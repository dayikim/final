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
/* img{ */
/*     width: 100%; */
/* } */
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

*{box-sizing: inherit;}
   *{box-sizing: inherit;}
    div{display: block;}
    .minicontainer{margin: auto; overflow: hidden;text-align: center;}
    .minibody{padding:0 8px; overflow: hidden;}
    img{border-radius: 20px;}
    a{color: black; cursor: pointer; text-decoration: none;}
    p{font-size: 1.1rem;}
    
    .dropbtn {background-color: #acafac; color: white;padding: 10px; font-size: 13px; border: none; cursor: pointer;border-radius: 3px;}
    .dropdown {position: relative; display: inline-block;margin-bottom: 20px;}
    a:hover {background-color: #f1f1f1}
    .dropdown:hover .dropbtn {background-color: #acafac}

    .count {overflow: hidden; }
    .count p{width: 6%; display: inline-block;}
    .minibody{text-align: center;}
    .reservation{overflow: hidden; font-size: 0.5rem; position: absolute;  transform: translate( 5%, -10%);}
    .board{width: 25%;height: 300px; overflow: hidden; float: left; margin-right:30px; margin-bottom: 56px;}
    .board img{width: 100%; height: 70%;} 
    .seq {width: 10%; display: inline-block;}
    .title {width: 50%; display: inline-block;}
    .regdate {width: 20%; display: inline-block;}
    .minibody a:hover{text-decoration: none;}
    </style>
    
    <script>  
    
    $(function(){
      	 $("#search").keyup(function(e){
      		 if(e.keyCode == 13){
      			location.href="/AllBoardList/allList?&search="+$("#search").val();
           	}
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
                                <a href=""><i class="fab fa-twitter"></i></a>
                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                <a href=""><i class="fab fa-instagram"></i></a>
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
                <a href="index.html" class="navbar-brand"><p id= titlename>돈-다</a></p>
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

	 <div class="minicontainer">
        <div class="miniheader">
            <div class="dropdown">
                <button class="dropbtn"><a href="#">대여하기</a></button>
            </div>
            <div class="dropdown">
                <button class="dropbtn"><a href="#">대여요청하기</a></button>
            </div>
            <div class="dropdown">
                <button class="dropbtn"><a href="#">재능기부</a></button>
            </div>
        </div>
       <div class="minibody">
            <div id="count" class="count">대여하기 총 <p>${ldCount}</p> 개</div> 
			<c:forEach var="ld" items="${ldList}">
				<div class="borrow-board">
					<div id="ldseq" class="seq" name="ldseq" >${ld.seq}</div>
					<a id="ldtitle" class="title" name="title">${ld.title}</a>
					<p id="ldregdate" class="regdate" name="address1">${ld.regdate}</p>
				</div>
			</c:forEach>
            <br>
            <a href="/lend/list?&search=${search}">나머지 확인하기</a>
            <hr>
            <div id="count" class="count">대여가기 총 <p>${bwCount}</p> 개</div>
			<c:forEach var="bw" items="${bwList}">
				<div class="borrow-board">
					<div id="bwseq" class="seq" name="bwsleq" >${bw.seq}</div>
					<a id="bwtitle" class="title" name="bwtitle">${bw.title}</a>
					<p id="bwregdate" class="regdate" name="bwregdate">${bw.regdate}</p>
				</div>
			</c:forEach>
            <br>
            <a href="/borrow/list?&search=${search}">나머지 확인하기</a>
            <hr>
            <div id="count" class="count">대여가기 총 <p>${tlCount}</p> 개</div>
			<c:forEach var="tl" items="${tlList}">
				<div class="borrow-board">
					<div id="tlseq" class="seq" name="tltlseq" >${tl.seq}</div>
					<a id="tltitle" class="title" name="tltitle">${tl.title}</a>
					<p id="tlregdate" class="regdate" name="tlregdate">${tl.regdate}</p>
				</div>
			</c:forEach>
            <br>
            <a href="/tBoard/list?&search=${search}">나머지 확인하기</a>
            <hr>
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
<!--         <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="/lib/easing/easing.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="/js/main.js"></script>
    </body>
</html>
