<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <title>재능 결제하기</title>
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
                    width: 100%;
                    height: auto;
                    margin: auto;
                }

                #body {
                    height: auto;
                    padding-top: 100px;
                    padding-bottom: 30px;
                }

                /* 결제하기 title */
                .card-header {
                    width: 100%;
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

                /* 재능 상품 */
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
                    margin-bottom: 10px;
                }

                .point {
                    display: inline-block;
                    margin-right: 10px;
                }

                .point_wrap.all {
                    margin: auto;
                    margin-right: 10px;
                }

                /* 보유포인트 */
                .point_wrap #remain_point {
                    display: block;
                    text-align: center;
                    font-weight: 800;
                    font-size: 18px;
                    margin-top: 20px;
                    margin-left: 40px;
                    margin-bottom: 10px;
                    margin-right: 100px;
                }

                /* 사용포인트 */
                .point_wrap #use_point {
                    display: block;
                    font-weight: 800;
                    font-size: 18px;
                    text-align: center;
                    margin-bottom: 0;
                }

                /* 포인트 관련 알림 */
                .point_wrap .alertPoint {
                    margin: 0;
                    margin-left: 60px;
                    margin-top: 10px;
                    text-align: center;
                    color: red;
                    display: block;
                }

                .point_wrap .amount {
                    width: 80px;
                    text-align: center;
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
                    margin-top: 5px;
                }

                #pay {
                    margin: auto;
                    display: block;
                    margin-bottom: 10px;
                }

                .btn_wrap {
                    margin-top: 20px;
                }

                .amount_title {
                    margin-top: 30px;
                    font-size: 25px;
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

            <script>
                $(function () {

                    //사용 가능 포인트 체크
                    $("#insertBtn").on("click", function () {
                        let check = $(".amount")
                        if (check.val() == "") {
                            alert("사용할 포인트를 입력해주세요.");
                            check.focus();
                            return false;

                        } else {
                            $.ajax({
                                url: "/point/pointcheck",
                                data: {
                                    point: $(".amount").val()
                                }
                            }).done(function (resp) {
                                console.log(resp);
                                if (resp == 0) {
                                    $(".amount").val();
                                    $(".alertPoint").text("보유 포인트 이상 사용은 불가능 합니다.");
                                    $(".alertPoint").css("color", "red");
                                    $(".alertPoint").css("font-weight", "800");

                                } else if (resp == 1) {
                                    $(".alertPoint").text("포인트 사용이 가능합니다.");
                                    $(".alertPoint").css("color", "blue");
                                    $(".alertPoint").css("font-weight", "800");

                                }

                            })

                        }

                    })

                    $("#pay").on("click", function () {
                        let check = $(".amount")
                        if (check.val() == "") {
                            alert("사용할 포인트를 입력해주세요.");
                            check.focus();
                            return false;

                        } else {
                            let check = confirm("정말 결제하시겠습니까?");
                            let parentseq = $("#parentseq").val();
                                                                    
                            if (check) {
                                $.ajax({
                                    url: "/point/isPayment",
                                    data: { parentseq: parentseq }
                                }).done(function (resp) {
                                    console.log(resp);
                                    if (resp == 0) {
                                    	 alert("결제 완료!! \n마이페이지에서 포인트 내역을 확인하세요.")
                                    	$("#payForm").submit();

                                    } else {
                                        alert("이미 결제된 거래 게시글입니다.")
                                        location.href = "${pageContext.request.contextPath}/my/mypageProc"
                                        return;
                                    }
                                })
                            } else {
                                alert("결제 취소!")
                                return;
                            }
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
                                    <input class="form-control mr-sm-5" type="search" placeholder="물품, 지역을 검색해주세요."
                                        id=search aria-label="Search">
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
                    <div class="container-fluid card-header">
                        <i class="fas fa-comment-dollar"> <b>결제하기</b></i>
                    </div>
                    <div class="form-control wrapper">

                        <section id="lend_product">

                            <div class="lend_period">
                                <h4>
                                    <b> 재능 판매</b>
                                </h4>
                                <hr>
                                <h2 id="product">
                                    <b> ${board.title} </b>
                                </h2>
                                <span class="align-baseline" id="price"><b class="final_price">${board.price}</b>
                                    상추</span>
                                <div id="profile-image">
                                    <!-- 사진 이미지 -->
                                    <img src="/imgs/nomalProfile.jpg">
                                </div>
                                <hr>
                                <div id="sellerInfo_box">
                                    <h8 id="seller"> 판매자 정보 </h8>
                                </div>

                                <div id="nickname_box">
                                    <h9 id="nickname"> <b>${writerInfo.name}</b>님
                                        </h2>
                                </div>

                            </div>

                            <div id="small_profile-image">
                                <c:choose>
                                    <c:when test="${profile != null}">
                                        <a href="/profile/myProfile"><img src="/imgs/mypage/${profile.sysName }"
                                                id=profile></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/profile/myProfile"><img src="/imgs/nomalProfile.jpg" id=profile></a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </section>

                        <section id="payment">
                            <div class="point_wrap">
                                <h4 class=" point">
                                    <b>최종 결제 금액 </b>
                                </h4>
                                <hr>
                                <span id="remain_point"><b>현재 보유 포인트 : </b> <span
                                        class="align-baseline pointAmount">${point}</span> <b id="point1">상추</b></span>
                                <span id="use_point"><b id="use">사용 포인트 : </b> <input class="amount" name="point"> <b
                                        id="point2">상추</b>
                                    <button type="button" class=" all btn-outline-info btn btn-sm"
                                        id="insertBtn">입력</button></span> <span class="alertPoint"> </span>
                            </div>

                            <hr>
                            <div class="pay_box">
                                <span id="pay_amount">
                                    <h5>
                                        <b class="amount_title">결제 금액 : <b class="final_price">${board.price}</b>
                                            <b id="point1">상추</b></b>
                                        </h4>
                                </span>
                            </div>
                        </section>

                        <div class="btn_wrap">
                        <form action="/point/payment" id="payForm">
                        	<input type="hidden" name="seller" value="${board.writer}">
                        	 <input type="hidden" name="item" value="${board.title}">
                        	 <input type="hidden" name="price" value="${board.price}" id="price">
                            <input type="hidden" name="parentseq" value="${board.seq}" id="parentseq">
                            <input type="hidden" name="category" value="${board.category}" id="category">                             
                            <button type="button" class="btn btn-success btn btn-lg" id="pay">
                                <i class="far fa-comment-dots"></i> 결제하기
                            </button>
                            </form>
                        </div>
                    </div>
                   <!--  <div class="btn_wrap text-right">
                        <a href="/my/mypageProc"  class="back"><i class="fas fa-arrow-alt-circle-left"></i></a>

                    </div> -->
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