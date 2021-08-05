<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">

    

    <style>
        * {
            box-sizing: border-box;
        }       

        /* 홈페이지 가장 위에 있는 헤더 */
        .container-fulid {
            height: 60px;
            background-color: #1d2434;
        }

        /* 홈페이지 로고 */
        #titlename {
            margin-top: 1%;
            margin-bottom: 0;
            font-size: 30px;
            font-family: 'Gugi', cursive;
            color: white;
        }

        /* 마이페이지 글씨체 */
        #titleNextName {
            color: white;
        }

        .margin1 {
            height: 30px;
        }

        /**************************************************************************/

        /* 마이페이지 시작 */
        .container {
            margin: auto;
            width: 1200px;
            padding: 50px;
        }

        /**************************************************************************/

        /*왼쪽*/
        .left {
            border-radius: 20px;
            border: 1px solid rgb(158, 157, 157);
        }

        /* 내정보 글씨 */
        .header>div>h3>b {
            color: #1d2434;
            line-height: 100px;
        }

        /* 내 정보 수정하기 버튼 */
        .cnum-btn {
            border-radius: 5px;
            width: 60px;
            height: 30px;
            margin-top: 35px;
            background-color: #334257;
            border: none;
            color: #fff;
            font-size: 15px;
            outline: none;
            cursor: pointer;
        }

        /* 프로필사진, 개인정보수정 */
        /* 프로필사진 */
        .profile{
            width: 200px;
            height: 170px;
            margin: auto;
        }
        .left>div>img {
            width: 165px;
            height: 165px;
            border-radius: 100px;
        }

        /* 내 정보 */
        .myInfo{
            text-align: center;
        }

        /* 나의 포인트 */
        .myPoint{
            margin: auto;
            margin-top: 20px;
            text-align: center;
            width: 240px;
            height: 150px;
            border: 5px solid #334257;
            border-radius: 10px;
        }
        .p{
            height: 50%;
            line-height: 100px;
        }
        .myPoint2{
            height: 50%;
            line-height: 30px;
        }
        .charge{
            margin: auto;
            margin-top: 10px;
            margin-bottom: 10px;
            text-align: center;
            line-height: 50px;
            width: 240px;
            height: 50px;
            border-radius: 5px;
            border: 1px solid white;
            background-color: #646c7e;
        }
        .charge>a,span{
            color: white;
        }

        /* 현재 빌린 상품 */
        .borrowList{
            width: 330px;
            height: 100px;
            overflow: hidden;
        }
        /* 현재 빌려준 상품 */
        .lendList{
            width: 330px;
            height: 100px;
            overflow: hidden;
        }
        /**************************************************************************/
        /*중간*/
        .center{
            width: 30px;
            height: 30px;
        }

        /**************************************************************************/
        /*오른쪽*/
        
        .list {
            border-radius: 20px;
            height: 250px;
            margin-bottom: 20px;
            border: 1px solid rgb(158, 157, 157);
        }

        .list2 {
            border-radius: 20px;
            height: 250px;
            border: 1px solid rgb(158, 157, 157);
        }

        .go,.titleDiv,.buttonDiv{
            width: 100%;
            height: 100%;
        }

        .title,.stitle{
            height: 50%;
        }

        /* 큰 제목 */
        .title>h3>b{
            line-height: 160px;
            color: gray;
        }

        /* 확인 버튼 */
        .okBtn{
            border-radius: 5px;
            width: 60px;
            height: 30px;
            margin-top: 100px;
            background-color: #334257;
            border: none;
            color: #fff;
            font-size: 15px;
            outline: none;
            cursor: pointer;
        }
    </style>
    <script>
    	$(function(){
    		$("#updateMyInfoBtn").on("click",function(){
    			location.href="";
    		})
    	})
    </script>
</head>

<body>
    <div class="row container-fulid">
        <div class="col-4" align=center>
            <a href="index.html" class="navbar-brand">
                <p id=titlename>돈-다</p>
            </a>
            <b id=titleNextName>마이페이지</b>
        </div>
        <div class="col-4"> </div>
        <div class="col-4"></div>
    </div>

    <div class="margin1"></div>

    <div class="row container">
        <div class="col-12 col-sm-12 col-md-4 left">
            <div class="row header">
                <div class="col-6" align=left>
                    <h3><b>내정보</b></h3>
                </div>
                <div class="col-6" align=right>
                    <button type=button id=updateMyInfoBtn class="cnum-btn">수정</button>
                </div>
            </div>
            <div class="profile" align=center>
                <img src="nomalProfile.jpg">
            </div><br>

            <div class="myInfo">
                <div class="name">
                    <b>OOO</b>님
                </div><br>
                <div class="add">
                    서울특별시 동대문구
                </div>
            </div>
            <hr>

            <div class="point">
                <div class="pointIntro"><h5><b>나의 포인트</b></h5></div>

                <div class="myPoint">
                    <div class="p">Point</div>
                    <div class="myPoint2"><h3><b>100</b></h3></div>
                </div>

                <div class="charge">
                    <a href="#">충전하기</a> <span>ㅣ</span> <a href="#">포인트 내역 확인</a>
                </div>
            </div>
            <hr>

            <div class="borrow">
                <div class="row borrowIntro">
                    <div class="col-6">
                        <h5><b>현재 빌린 상품</b></h5>
                    </div>
                    <div class="col-6" align=right>
                        <a href="#">더보기</a>
                    </div>
                </div>
                <div class="row borrowList">
                    
                </div>
            </div>    
            <hr>
            <div class="lend">
                <div class="row lendIntro">
                    <div class="col-7">
                        <h5><b>현재 빌려준 상품</b></h5>
                    </div>
                    <div class="col-5" align=right>
                        <a href="#">더보기</a>
                    </div>
                </div>
                <div class="row lendList">
                    
                </div>
            </div>
        </div>


        <div class="col-12 col-sm-12 col-md-1 center">

        </div>


        <div class="col-12 col-sm-12 col-md-7 right">
            <div class="row">
                <div class="col-12 list">
                    <div class="row go">
                        <div class="col-10 titleDiv">
                            <div class="title">
                                <h3><b>거래 완료 목록</b></h3>
                            </div>
                            <div class="stitle">
                                <b>내가 빌린 상품, 빌려준 상품에 대한 거래 완료 목록 확인하기</b>
                            </div>
                        </div>
                        <div class="col-2 buttonDiv">
                            <button type=button class="okBtn">확인</button>
                        </div>
                    </div>
                </div>
                <div class="col-12 list">
                    <div class="row go">
                        <div class="col-10 titleDiv">
                            <div class="title">
                                <h3><b>나의 커뮤니티</b></h3>
                            </div>
                            <div class="stitle">
                                <b>내가 쓴 커뮤니티의 목록을 확인하기</b>
                            </div>
                        </div>
                        <div class="col-2 buttonDiv">
                            <button type=button class="okBtn">확인</button>
                        </div>
                    </div>
                </div>
                <div class="col-12 list">
                    <div class="row go">
                        <div class="col-10 titleDiv">
                            <div class="title">
                                <h3><b>내가 쓴 대여 글 확인</b></h3>
                            </div>
                            <div class="stitle">
                                <b>내가 대여한 상품, 나의 글 리스트 확인하기</b>
                            </div>
                        </div>
                        <div class="col-2 buttonDiv">
                            <button type=button class="okBtn">확인</button>
                        </div>
                    </div>
                </div>
                <div class="col-12 list2">
                    <div class="row go">
                        <div class="col-10 titleDiv">
                            <div class="title">
                                <h3><b>나의 후기 글</b></h3>
                            </div>
                            <div class="stitle">
                                <b>거래 완료 후, 구매자 혹 판매자에 대한 후기 작성 목록 확인하기</b>
                            </div>
                        </div>
                        <div class="col-2 buttonDiv">
                            <button type=button class="okBtn">확인</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </div>
</body>

</html>