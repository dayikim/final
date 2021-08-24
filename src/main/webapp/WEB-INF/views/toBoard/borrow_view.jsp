<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title> 대여 요청 게시글 상세보기</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free Website Template" name="keywords">
    <meta content="Free Website Template" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
        rel="stylesheet">

    <!-- CSS Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


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

        /* 프로필,상세보기 */
        #body {
            padding-top: 120px;
            padding-bottom: 30px;

        }

        .wrapper {
            width: 100%;
            height: auto;
        }

        /* 버튼 박스 */
        .btn_box {
            margin-top: 10px;
            margin-bottom: 5px;
        }

        /* 게시글 제목 */
        .board_title {
            margin: auto;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            width: 85%;
            margin-bottom: 20px;

        }

        .title_msg {
            margin-left: 10px;

        }

        /* 사진 슬라이드 */    
        .mySlides {display:none}
		.w3-left, .w3-right{cursor:pointer; color:#1d2434; font-size:35px;}
		.slcon{width: 60%; height:400px;}
		.mySlides{width:100%; height: 100%;border-radius:15px;}
		.forDemo{width:113%;top:40%;}
		
        /* 작성자 프로필 */
        #user-profile {
            margin: auto;
            margin-top: 30px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ddd;
            width: 85%;
            margin-bottom: 20px;
        }

        /* 아이디 */
        #user-profile #nickname {
            position: absolute;
            text-align: center;
            margin-top: 20px;
            font-size: 22px;
            font-weight: bold;
            letter-spacing: -0.6px;
            margin-bottom: 10px;
            margin-left: 90px;
            display: inline-block;
        }

        /* 위치  */
        #user-profile #region_name {
            position: absolute;
            text-align: center;
            margin-top: 50px;
            letter-spacing: -0.6px;
            margin-bottom: 10px;
            margin-left: 100px;
            font-size: 15px;
            display: inline-block;
        }

        #user-profile #price {
            float: right;
            margin-top: 30px;
            font-size: 18px;
            font-weight: bold;
            letter-spacing: -0.6px;
            margin-right: 130px;
            margin-bottom: 10px;
        }

        #user-profile #booking {
            float: right;
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
            letter-spacing: -0.6px;
            margin-right: 30px;
            margin-bottom: 10px;
        }

        /* 프로필 이미지 */
        #user-profile #profile-image img {
            width: 60px;
            height: 60px;
            margin-left: 20px;
            margin-top: 10px;
            margin-bottom: 10px;
            border-radius: 40px;
            overflow: hidden;
            vertical-align: middle;
        }

        /* 세부 설명 */
        #contents {
            border-radius: 5px;
            border: 1px solid #ddd;
            width: 85%;
            margin: auto;
            height: 100%;
            margin-top: 10px;
            margin-bottom: 30px;

        }
        
        .btn_wrap{text-align:center; margin-bottom:3px;}

        .contents_input {
            padding: 0;
            margin-left: 20px;
            min-height: 100%;
            width: 95%;
            border-radius: 10px;
        }

        p {
            margin-left: 20px;
            margin-top: 10px;
        }


        #chat,#request{
            margin-right: 10px;
        }
    </style>
    <script type="text/javascript">
   

    $(function() {
		$("#search").keyup(function(e) {
			if (e.keyCode == 13) {
				location.href = "/AllBoardList/lendList?choice=Allchoice&search="+$("#search").val()+"&cpage=1";
			}
		})
		
		$("#chatting").on("click",function(){
			location.href = "/chat/createRoom?board_seq="+$("#seq").val()+"&board_category=borrow";
		})
	})
	$(function() {
    	$("#request").on("click",function(){//대여하기 글쓰기로이동
    		location.href = "/lendBoard/toLend"
    	})
    	
		$("#deleteBtn").on("click",function () { //게시글 삭제
					let check = confirm("정말 게시글을 삭제하겠습니까?");
					if (check) {
						location.href = "/borrowBoard/borrowDelete?seq="
							+ $("#deleteBtn").val(); //게시글 삭제 확인 팝업
					} else {
						return;
					}
				});

		$("#modifyBtn").on("click",function () { //게시글 수정
					let check = confirm("정말 게시글을 수정하겠습니까?");
					if (check) {
						location.href = "/borrowBoard/modify?seq="
							+ $("#modifyBtn").val(); //게시글 수정 확인 팝업
					} else {
						return;
					}
				});
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
                                    class="fab fa-facebook-f"></i></a> <a href=""><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
         <input type ="hidden"  id =seq value="${board.seq}" >
        <c:choose>
                <c:when test="${loginID == board.writer}">
            <div class="btn_box btn_wrap text-right ">
                <button type="button" class="btn btn-info" value="${board.seq}" id="deleteBtn"><i class="fas fa-trash-restore"> 삭제</i></button>
                <button type="button" class="btn btn-info" value="${board.seq}" id="modifyBtn">수정</button>
            </div>
            </c:when>
            </c:choose>
            
            <div class="form-control wrapper">
                <div class="board_title">
                    <a href="#" class="badge badge-info">대여 요청</a>
                    <span id="category">${board.category}</span>
                    <h2 class="title_msg"><b>${board.title}<b></h2>
                </div>
               <!-- slide -->
					<div class="w3-content w3-display-container slcon" id="slcon">
						<c:choose>
							<c:when test="${fn:length(flist) != 0}">
								<c:forEach var="f" items="${flist}">
		  							<img class="mySlides" src="/imgs/borrow/${f.sysName}">
		  						</c:forEach>	
		  						<div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle forDemo" id="forDemo">
								    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
								    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
								</div>
							</c:when>
							<c:otherwise>
									<img class="mySlides" src="/imgs/noimage.jpg">
							</c:otherwise>	
						</c:choose>
					</div>
                <!-- End slide -->
                <section id="user-profile">
                    <div id="nickname_box">
                        <h2 id="nickname">
                            <a href="/profilie/userProfile?id=${board.writer}"><b>${writer.name}</b>님</a>
                        </h2>

                    </div>
                    <span id="region_name">${board.address}</span>
                    <div class=" btn_wrap text-right">
                        <!-- <button type="button" class="btn btn-secondary" id="booking">
                            예약하기</i></button> -->
                    </div>
                    <span class="align-baseline" id="price">${board.price} 상추</span>
                    
                    <div id="profile-image">
                        <!-- 프로필 이미지 -->
                        <c:choose>
					<c:when test="${profile != null}">
						<a href="/profilie/userProfile?id=${board.writer}"><img src="/imgs/mypage/${profile.sysName}" id=profile></a>
					</c:when>
					<c:otherwise>
						<a href="/profilie/userProfile?id=${board.writer}"><img src="/imgs/nomalProfile.jpg" id=profile></a>
					</c:otherwise>
				</c:choose>
                    </div>
                </section>

                <section id="contents">
                <!-- 게시글  내용 -->
                    <div class="col-12 md-5 contents_input">
                        <p class="target"> ${board.contents}</p>
                    </div>

                    <div class="btn_wrap">
                    	<c:if test="${loginID !=  board.writer}">
                        <button type="button" class="btn btn-outline-info btn btn-lg" id="chatting"><i class="far fa-comment-dots"></i>
                            1:1 채팅</button>
                            <a href="/lendBoard/toLend"><button type="button" class="btn btn-outline-info btn btn-lg" id="request">
                                대여 하기</button></a>
                         </c:if>
                    </div>

                </section>



            </div>
        </div>
    </section>

    <hr>
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
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="/lib/easing/easing.min.js"></script>

        <!-- Template Javascript -->
        <script src="/js/main.js"></script>
    </footer>
	<script>
	//슬라이드
	
	    var slideIndex = 1;
		showDivs(slideIndex);
		
		function plusDivs(n) {
	  		showDivs(slideIndex += n);
		}
		
		function showDivs(n) {
			  var i;
			  var x = document.getElementsByClassName("mySlides");
			  
			  if (n > x.length) {slideIndex = 1}
			  if (n < 1) {slideIndex = x.length}
			  for (i = 0; i < x.length; i++) {
			    x[i].style.display = "none";
			   }
			  x[slideIndex-1].style.display = "block"; 
		}

	</script>
	
</body>

</html>