<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 후기글</title>
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

        /* 나의 후기글 목록 글씨체 */
        #titleNextName {
            color: white;
        }

        .margin {
            height: 30px;
        }

        /* 후기 목록 내역 큰 단락 */
        .payTitle>b {
            margin-left: 50px;
            font-size: 20px;
        }
        #hr {
            margin: auto;
            width: 600px;
            height: 1.5px;
            background-color: rgb(148, 148, 148);
        }

        /* 후기 목록 내역 출력 */
        .listTitle{
            margin: auto;
            padding: 15px;
            width: 600px;
            border-bottom: 1px solid rgb(148, 148, 148);
        }
        .userID>h6>b{
            line-height: 20px;
        }
        .comment>h6>b{
            line-height: 20px;
        }
    </style>
</head>
<body>
    <div class="row container-fulid">
        <div class="col-6" align=center>
            <a href="index.html" class="navbar-brand">
                <p id=titlename>돈-다</p>
            </a>
            <b id=titleNextName>나의 후기글 목록</b>
        </div>
        <div class="col-6"> </div>
    </div>

    <div class="margin"></div>

    <div class="payTitle">
        <b>나의 후기글 목록</b>
    </div>

    <div class="margin"></div>
    <div id=hr></div>
    
    <!-- title -->
    <div class="row listTitle">
        <div class="col-4 userID">
            <h6><b>사용자 ID</b></h6>
        </div>
        <div class="col-8 comment" align=center>
            <h6><b>후기</b></h6>
        </div>
    </div>
    
    <!-- 후기 출력 -->
    <!-- forEach 사용 예정 -->
    <div class="row listTitle">
        <div class="col-4 userID">
            shoowghjk
        </div>
        <div class="col-8 comment" align=center>
            음 이분 물건 너무 깨끗하게 안써서 빌려줬는데 너무 너덜너덜하게 왔어욤..... 다음부턴 제발 깨끗하게좀 쓰시길ㅠ
        </div>
    </div>
</body>
</html>