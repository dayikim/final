<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 업로드</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
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

        /* 프로필 업로드 글씨체 */
        #titleNextName {
            color: white;
        }

        .margin1 {
            height: 70px;
        }

        /* 사진 업로드 */
        .photo {
            width: 200px;
            height: 170px;
            margin: auto;
        }

        .photo>img {
            width: 165px;
            height: 165px;
            border-radius: 100px;
        }

        /* 파일 업로드 */
        .margin2{
            height: 20px;
        }

        /* 버튼 업로드 */
        .margin3{
            height: 70px;
        }

        .cnum-btn1 { /* 취소 */
            border-radius: 5px;
            width: 60px;
            height: 30px;
            background-color: white;
            border: 1px solid #334257;
            color: #334257;
            font-size: 15px;
            outline: none;
            cursor: pointer;
        }

        .cnum-btn2 { /* 수정 */
            border-radius: 5px;
            width: 60px;
            height: 30px;
            background-color: #334257;
            border: none;
            color: #fff;
            font-size: 15px;
            outline: none;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <div class="row container-fulid">
        <div class="col-6" align=center>
            <a href="index.html" class="navbar-brand">
                <p id=titlename>돈-다</p>
            </a>
            <b id=titleNextName>프로필 변경</b>
        </div>
        <div class="col-6"> </div>
    </div>

    <div class="margin1"></div>

    <div class="container">
        <!-- 프로필 업로드 -->
        <div class="photo" align=center>
            <img src="nomalProfile.jpg">
        </div>
        <div class="margin2"></div>

        <!-- 파일 업로드 -->
        <div class="fileUpLoad" align=center>
            <input type="file">
        </div>
        <div class="margin3"></div>
        <hr>

        <!-- 버튼 -->
        <div class="okBtn" align=center>
            <input type=button id=cencle class="cnum-btn1" value="취소">
            <button type=button id=update class="cnum-btn2">수정</button>
        </div>
    </div>
</body>

</html>