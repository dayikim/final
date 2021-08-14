<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>대여 결제하기</title>
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
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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

        /* 페이지 구성 */
        .wrapper {
            width: 70%;
            height: auto;
        }

        #body {
            height: auto;
            padding-top: 30px;
            padding-bottom: 30px;

        }

        .wrapper {
            width: 70%;
            margin: auto;
            height: auto;
        }

        /* 결제하기 title */
        .card-header {
            width: 70%;
            margin: 0 atuo 0 0;
            background-color: rgba(18, 54, 29, 0.973);
            border-radius: 10px;
            border: solid 1px black;
            color: white;
            font-size: 20px;
            font-weight: bolder;
        }

        /* 게시글 제목 */
        .board_title {
            margin: auto;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid gray;
            width: 85%;
            margin-bottom: 20px;

        }

        /* 대여 상품 */
        #lend_product {
            margin: auto;
            margin-top: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid gray;
            width: 85%;
            margin-bottom: 20px;
        }

        hr {
            margin: 0px;
        }

        /* 상품명 */
        #lend_product #product {
            position: absolute;
            text-align: center;
            margin-top: 20px;
            font-size: 22px;
            font-weight: bold;
            letter-spacing: -0.6px;
            margin-bottom: 10px;
            margin-left: 140px;
            display: inline-block;
        }

        #lend_product #price {
            position: absolute;
            margin-top: 50px;
            margin-left: 150px;
            font-size: 18px;
            font-weight: bold;
            letter-spacing: -0.6px;
            margin-bottom: 10px;
        }

        #lend_product #profile-image img {
            width: 100px;
            height: 100px;
            margin-left: 20px;
            margin-top: 10px;
            margin-bottom: 10px;
            overflow: hidden;
            vertical-align: middle;
        }


        /* 판매자 정보 */
        #sellerInfo_box {
            margin-top: 10px;
        }

        #lend_product #seller {
            margin-top: 10px;
            margin-left: 20px;
            font-weight: 800;
            font-size: 18px;
            color: gray;
            text-align: center;
        }

        #lend_product #small_profile-image {
            width: 40px;
            height: 40px;
            margin-left: 30px;
            margin-bottom: 10px;
            border-radius: 30px;
            overflow: hidden;
            vertical-align: middle;
        }

        #lend_product #nickname {
            position: absolute;
            margin-left: 60px;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: -0.6px;
            margin-bottom: 10px;
            margin-top: 5px;
            vertical-align: bottom;
        }

        /* 결제 금액 */
        #lend {
            border-radius: 5px;
            border: 1px solid gray;
            width: 85%;
            margin: auto;
            margin-bottom: 20px;

        }

        .lend_period {
            margin-top: 10px;
            margin-left: 20px;
        }

        .period {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        /* 최종 결제 금액 */
        #payment {
            border-radius: 5px;
            border: 1px solid gray;
            width: 85%;
            margin: auto;
            height: auto;
            margin-bottom: 10px;

        }

        /* 포인트 결제액 */
        .point_wrap {
            margin-top: 10px;
            margin-left: 20px;
            height: auto;
            margin-bottom: 30px;
        }

        .point {
            display: inline-block;
            margin-right: 10px;
        }

        .point_wrap .all {
            margin: auto;
            margin-right: 10px;
        }

        /* 보유포인트 */
        .point_wrap #remain_point {
            display: block;
            text-align: center;
            margin-top: 10px;
            margin-bottom: 5px;
            margin-right: 100px;
        }

        /* 사용포인트 */
        .point_wrap #use_point {
            display: block;
            text-align: center;
            margin-bottom: 0;
        }

        /* 포인트 관련 알림 */
        .point_wrap .alertPoint {
            margin: 0;
            margin-left: 60px;
            text-align: center;
            color: red;
            display: block;
        }

        .point_wrap .amount {
            width: 80px;
            margin-left: 10px;
            margin-right: 10px;

        }

        .pointAmount {
            color: #2ca10f;
            font-weight: 800;
            width: 120px;
            margin-left: 20px;
            width: 80px;

        }

        #point1 {
            margin-left: 10px;
        }

        #point2 {
            margin-right: 10px;
        }

        .pay_box {
            text-align: center;
        }

        #pay {
            margin: auto;
            display: block;
            margin-bottom: 10px;

        }

        .final_price {
            margin-left: 10px;
            color: #2ca10f;
            font-weight: 800;
        }

        .back {
            color: black;
            font-size: xx-large;
        }
    </style>
</head>

<body>

    <!-- Nav Bar Start -->
    <div class="navbar navbar-expand-lg bg-dark navbar-dark">
        <div class="container-fluid">
            <a href="index.html" class="navbar-brand">
                <p id="titlename">돈-다</p>
            </a>

            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
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
            <div class="container-fluid card-header">
                <i class="fas fa-comment-dollar">  <b>결제하기</b></i>
            </div>
            <div class="form-control wrapper">

                <section id="lend_product">

                    <div class="lend_period">
                        <h4>
                            <b> 대여상품</b>
                        </h4>
                        <hr>
                        <h2 id="product">
                            <b> 자전거 대여 </b>
                        </h2>
                        <span class="align-baseline" id="price"><b class="final_price">100</b> 상추</span>
                        <div id="profile-image">
                            <!-- 프로필 이미지 -->
                            <img src="/imgs/nomalProfile.jpg">
                        </div>
                        <hr>
                        <div id="sellerInfo_box">
                            <h8 id="seller">
                                판매자 정보
                            </h8>
                        </div>

                        <div id="nickname_box">
                            <h9 id="nickname">
                                <b>김다이</b>님
                                </h2>
                        </div>

                    </div>

                    <div id="small_profile-image">
                        <!-- 프로필 이미지 -->
                        <img src="자유게시판 수정.PNG">
                    </div>
                </section>

                <section id="lend">
                    <div class="lend_period">
                        <h4>
                            <b> 대여기간</b>
                        </h4>
                        <hr>
                        <div class="period">
                            <b>2021-08-18~ 2021-08-19</b>
                        </div>
                    </div>

                </section>

                <section id="payment">
                    <div class="point_wrap">
                        <h4 class=" point">
                            <b>최종 결제 금액 </b>
                        </h4>
                        <hr>
                        <span id="remain_point"><b>현재 보유 포인트 : </b> <span
                                class="align-baseline pointAmount">middle</span>
                            <b id="point1">상추</b></span>
                        <span id="use_point"><b id="use">사용 포인트 : </b> <input class="amount"> <b id="point2">상추</b>
                            <button type="button" class=" all btn-outline-info btn btn-sm">
                                사용</i></button></span>

                        <span class="alertPoint">
                            보유 포인트 이상~~~
                        </span>
                    </div>
                    <div class="pay_box">
                        <span id="pay_amount">
                            <h5><b>결제 금액 : <b class="final_price">100</b> <b id="point1">상추</b></b></h4>
                        </span>
                    </div>
                </section>

                <div class="btn_wrap">
                    <button type="button" class="btn btn-success btn btn-lg" id="pay"><i
                            class="far fa-comment-dots"></i>
                        결제하기</i></button>

                </div>
                <div class="btn_wrap text-right">
                    <a href="" class="back"><i class="fas fa-arrow-alt-circle-left"></i></a>

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
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="/lib/easing/easing.min.js"></script>

        <!-- Template Javascript -->
        <script src="/js/main.js"></script>
    </footer>

</body>

</html>