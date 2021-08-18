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
			
			/*list style */
			*{box-sizing: border-box;}
   			div{display: block;}
    		.minicontainer{margin: auto; overflow: hidden;text-align: center; padding: 150px 80px;}
    		.minibody{padding:0 8px; overflow: hidden;}
    		.minibody p{font-size: 1.1rem;}
    
    		.dropbtn {background-color: #1d2434; color: white;padding: 10px; font-size: 13px; border: none; cursor: pointer;border-radius: 3px;}
    		.dropdown {position: relative; display: inline-block;margin-bottom: 40px;}
    		.dropbtn:hover {background-color: skyblue}
    		
    		.tlSellBtn{color:#1d2434;background:none;font-size:1.2rem;font-weight:bold;}
    		.browse{display:inline-block; text-align:end; width:70%; margin-bottom:40px;}
    		.inp_slct{width:10%; height:28px; display:inline-block; margin-right:5px;}
    		.inp_slct select{height:100%;}
    		.browseBtn{width:60px;background-color:#1d2434;color:white;}
    		.minibody{text-align: center;}
    		.reservation{overflow: hidden; font-size: 0.5rem; position: absolute;  transform: translate( 5%, -10%);}
    		.to-board{width: 25%;overflow: hidden; display:inline-block; margin-right:30px; margin-bottom: 56px;}
    		.to-board img{width: 100%; height: 70%; border-radius: 20px;} 
    		.minibody a{color: black; cursor: pointer; text-decoration: none;}
    		.minibody a:hover{color: black; text-decoration: none;}
    		
    		.write{width:80%; display:inline-block; text-align:end; margin-bottom:20px;}
    		.writeBtn{background-color: #1d2434; color:white;}
    </style>

	<script>
		$(function() {
			$("#search").keyup(function(e) {
				if (e.keyCode == 13) {
					location.href = "/AllBoardList/lendList?choice=Allchoice&search="+$("#search").val()+"&cpage=1";
				}
			})
			
			$("#chat").on("click",function(){
				location.href = "/chat";
			})
		})
		
		$(function(){
	 		$("#lendBtn").on("click",function(){
	    		location.href="/AllBoardList/lendList?choice=${choice}&search=${search}&cpage=1";
	    	})
	       
	    	$("#borrowBtn").on("click",function(){
	    		location.href="/AllBoardList/borrowList?choice=${choice}&search=${search}&cpage=1";
	    	})
	       
	    	$("#tlSellBtn").on("click",function(){
	    		location.href="/AllBoardList/tlSellList?choice=${choice}&search=${search}&cpage=1";
	    	}) 
	    
	    	$("#tlRequestBtn").on("click",function(){
	    		location.href="/AllBoardList/tlRequestList?choice=${choice}&search=${search}&cpage=1";
	    	})
	    
	    	$("#writeBtn").on("click",function(){
	    		location.href="/tBoard/sellingWrite";
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
									          <a class="dropdown-item" href="/AllBoardList/lendList?choice=Allchoice&search=&cpage=1">Board</a>
									          <a class="dropdown-item" href="/sns/main">SNS</a>
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

	<div class="minicontainer">
		<div class="miniheader">
        	<!-- 카테고리별 버튼 누를시 그 카테고리로 이동한다 -->
            <div class="dropdown">
                <button class="dropbtn lendBtn" id="lendBtn">대여하기</button>
            </div>
            <div class="dropdown">
                <button class="dropbtn borrowBtn" id="borrowBtn">대여요청</button>
            </div>
            <div class="dropdown">
                <button class="dropbtn tlSellBtn" id="tlSellBtn">재능등록</button>
            </div>
            <div class="dropdown">
                <button class="dropbtn tlRequestBtn" id="tlRequestBtn">재능요청</button>
            </div>
		</div>
		
		<!-- 검색 -->
		<form action="/AllBoardList/tlSellList" method="post">
			<div class="browse">
				<input type="hidden" name="cpage" value=1>
				<div class="inp_slct">
					<select name="choice">
						<option value="Allchoice">전체</option>
						<option value="title">제목</option>
						<option value="category">카테고리</option>
						<option value="address">지역</option>
						<option value="contents">내용</option>
					</select>
				</div>
				<input type="text" name="search" class="inpform" placeholder="검색을 입력하세요.">
				<button class="browseBtn" id="browseBtn">검색</button>
			</div>
		</form>
		
		<!-- 검색결과 리스트 -->
		<div class="minibody">
			<input type="hidden" value="${search}" name=search>
			<input type="hidden" value="${choice}" name=choice>
			
			<c:forEach var="tls" items="${tlsList}">
				<div class="to-board">
					<a href="/borrow/detailView?seq=${tls.seq}" id="tlshttp" class="tlshttp" >					
						<img src="ittaketwo.jpg" alt="#"> 
						<input type="hidden" value="${tls.seq}" id="seq" name="seq">
						<p class="title" name="title">${tls.title}</p>
						<p id="address" name="address">${tls.address}</p>
					</a>
				</div>
			</c:forEach>
		</div>
		
		<!-- 글쓰기 버튼 -->
		<c:if test="${loginID != null}">
			<div class="write" id="write">		
				<button type="button" class="writeBtn" id="writeBtn">글쓰기</button>
			</div>
		</c:if>
		
		<!-- 페이징 네비바 -->
		<div class="board_page">
			<c:forEach var="i" items="${navi}" varStatus="s">
				<c:choose>
					<c:when test="${i == '>'}">
						<a href="/AllBoardList/lendList?cpage=${navi[s.index-1]+1}&choice=${choice}&search=${search}">${i}</a>
					</c:when>
					<c:when test="${i == '<'}">
						<a href="/AllBoardList/lendList?cpage=${navi[s.index-1]+1}&&choice=${choice}&search=${search}">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="/AllBoardList/lendList?cpage=${i}&choice=${choice}&search=${search}">${i}</a>
					</c:otherwise>
				</c:choose>
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
