<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>마이 프로필</title>
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

                /* 프로필-판매물품,거래후기 */
                #body {
                    padding-top: 80px;
                    padding-bottom: 30px;
                    height: auto;
                }

                .wrapper {
                    width: 100%;
                    height: auto;
                }

                /* 작성자 프로필 */
                #user-profile {
                    position: relative;
                    margin-top: 10px;
                    height: auto;
                }

                #user-profile #nickname {
                    position: absolute;
                    text-align: left;
                    margin-top: 10px;
                    font-size: 22px;
                    font-weight: 600;
                    letter-spacing: -0.6px;
                    margin-bottom: 10px;
                    vertical-align: middle;
                    margin-left: 150px;
                }

                #user-profile #nickname #region_name {
                    font-size: 17px;
                    color: #212529;
                    font-weight: normal;
                    vertical-align: middle;
                    margin-left: 6px;
                }

                div {
                    display: block;
                }

                #user-profile #profile-image {
                    width: 100px;
                    height: 100px;
                    margin-top: 10px;
                    margin-left: 40px;
                    border-radius: 40px;
                    overflow: hidden;
                    vertical-align: middle;
                }

                /* 네비바 */
                h2 {
                    margin-left: 10px;
                    font-weight: bold;
                    padding-top: 10px;
                    padding-bottom: 10px;
                }

                /* navi tab */
                .list {
                    font-weight: bold;
                    font-size: larger;
                    margin-bottom: 20px;
                }

                .pagingBar a {
                    font-weight: bold;
                    font-size: larger;
                }

                .nav-item {
                    transition: all .3s ease;
                    color: #43c4a4;
                }

                .container a {
                    color: black;
                    font-weight: bold;
                }

                /* 거래후기 */
                
                #selling{
                   width: 250px;
                   text-align: center;
                    border: solid 1px black;
                }
                #review {
                    background-color: grey;
                    width: 250px;
                    text-align: center;
                    border: solid 1px black;
                }

                .card {
                    margin: 10px;
                }

                /* 거래후기 */
                #review {
                    width: 250px;
                    text-align: center;
                    border: solid 1px black;

                }

                /* .list li a:hover { 
 	color: black;
 	background-color: rgb(0, 139, 7);
} */

                .list li a:after {
                    display: block;
                    content: '';
                    border-bottom: solid 3px #39d9c8;
                    transform: scaleX(0);
                    background-color: greenyellow;
                    transition: transform 250ms ease-in-out;
                }

                .list li a:hover:after {
                    transform: scaleX(1);
                }

                .list li a.fromRight:after {
                    transform-origin: 100% 50%;
                }

                .list li a.fromLeft:after {
                    transform-origin: 0% 50%;
                }

                /* 탭 메뉴 */
                #table_menu {
                    margin: auto;
                    margin-bottom: 20px;
                    border-radius: 5px;
                    border: 1px solid grey;
                    width: 80%;
                    height: auto;
                    margin-bottom: 20px;
                }

                /* 거래후기 tab */
                /*  작은 작성자 프로필 */
                #small_user-profile {
                    position: relative;
                    margin-top: 20px;
                    margin-bottom: 10px;
                    margin-left: 10px;
                }

                #small_user-profile #small_nickname {
                    position: absolute;
                    text-align: left;
                    margin-top: 10px;
                    margin-left: 60px;
                    font-size: 18px;
                    font-weight: 600;
                    letter-spacing: -0.6px;
                    margin-bottom: 10px;
                    vertical-align: middle;
                }

                #small_user-profile #small_nickname #small_region_name {
                    font-size: 14px;
                    color: #212529;
                    font-weight: normal;
                    vertical-align: middle;
                    margin-left: 6px;
                }

                div {
                    display: block;
                }

                #small_user-profile #small_profile-image {
                    width: 50px;
                    height: 50px;
                    border-radius: 30px;
                    overflow: hidden;
                    vertical-align: middle;
                }

                .small_profile_info {
                    margin-left: 10px;
                    display: inline-block;
                }

                .card {
                    display: inline-block;
                }

                /* 거래후기 리스트 */
                li {
                    display: list-item;
                }

                .comment_list {
                    list-style: none;
                    list-style-position: initial;
                    list-style-image: initial;
                    list-style-type: none;
                    margin-top: 10px;
                    margin-bottom: 10px;
                    border: none;
                }

                .CommentBox .comment_list .CommentItem {
                    
                    padding-left: 0;
                    margin: auto;
                }

                .comment_box {
                    border: 1px solid grey;
                    margin-left: 20px;
                    width: 800px;
                 
                    margin: auto;
                }

                .CommentBox .comment_list .comment_info_box {
                    margin-top: 10px;
                    font-size: 12px;
                }

                .text_view {
                    margin-left: 10px;
                }
            </style>

            <script>
                $(function () {

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
                    <a href="/" class="navbar-brand">
                        <p id=titlename>돈-다
                    </a>
                    </p>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <c:choose>
                        <c:when test="${loginID == null }">
                            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                <div class="navbar-nav ml-auto">
                                    <a href="/person/login" class="nav-item nav-link active">Login</a>
                                    <!-- Login Page 이동 -->
                                    <a href="/person/join" class="nav-item nav-link">Sign Up</a>
                                    <!-- SignUp Page 이동 -->
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                <div class="navbar-nav ml-auto">

                                    <a href="/person/logout" class="nav-item nav-link active">Logout</a>
                                    <!-- Logout -->
                                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                                        <ul class="navbar-nav">
                                            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
                                                    id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false"> Menu </a>
                                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                                    <a class="dropdown-item"
                                                        href="/AllBoardList/lendList?category=AllCategory&search=&cpage=1">Board</a>
                                                    <a class="dropdown-item" href="/sns/main">SNS</a> <a
                                                        class="dropdown-item" href="/my/mypageProc">My page</a> <a
                                                        class="dropdown-item" href="/point/ToCharging">Charging</a>
                                                </div>
                                            </li>
                                        </ul>
                                        <button type="button" class="btn btn-outline-warning"
                                            id="chat">Chatting</button>
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
                            <h2 id="nickname">
                                <b>${myInfo.name}</b>님 <span id="region_name">${myInfo.address1}</span>
                            </h2>
                            <div id="profile-image">
                                <c:choose>
                                    <c:when test="${profile != null}">
                                        <img src="/imgs/mypage/${profile.sysName }" id=profile>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/imgs/nomalProfile.jpg" id=profile>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </section>
                        <hr>
                        <section id="navi">

                            <ul class="nav justify-content-center list">
                                <li class="nav-item"><a class="nav-link active" id="selling" aria-current="page"
                                        href="/profile/myselling?writer=${loginID}">
                                        판매 목록<span class="badge badge-pill badge-dark">${sellingCount}</span>
                                    </a></li>
                                <li class="nav-item"><a class="nav-link" id="review"
                                        href="/profile/reviewListForMe">거래후기<span
                                            class="badge badge-pill badge-dark">${reviewCount}</span></a></li>
                            </ul>
                        </section>
                        <section id="table_menu">
                        
                        <c:forEach var="i" items="${reviewList}">
                        
                            <ul class="comment_list">
                                <li class="commentItem">
                                    <!-- 거래 후기 출력 -->
                                    <div class="col-12 d-md-block comment_box">
                                        <div class="comment_writerInfo">

                                            <!-- 거래 후기 작성자 프로필 -->
                                            <section id="small_user-profile">
                                                <h2 id="small_nickname">
                                                    <a href="/profile/userProfile?id=${i.id}">${i.name} 님</a> <span
                                                        id="small_region_name">${i.address}</span>
                                                </h2>
                                                 <c:forEach var="sys" items="${sysName}">
                                                      <div id="small_profile-image">
                                                    <c:choose>
                                                        <c:when test="${sys != null}">
                                                            <img src="/imgs/mypage/${sys }" id=profile>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="/imgs/nomalProfile.jpg" id=profile>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
												</c:forEach>
                                            </section>
                                        </div>
                                        <div class="comment_text">
                                            <p class="text_view">
                                                <span class="modify_option" id="com">${i.contents}</span>
                                            </p>
                                        </div>

                                        <div class="commentInfo">
                                            <span>
                                              ${i.regdate}
                                            </span>
                                        </div>

                                    </div>
                                </li>
                            </ul>
                            </c:forEach>
                            
                        </section>
                        <div class="text-right">
                            <input type=button class="btn btn-secondary" value="메인으로" id="back">
                        </div>
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

        </body>

        </html>