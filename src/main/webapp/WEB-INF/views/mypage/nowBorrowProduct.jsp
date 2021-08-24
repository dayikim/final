<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>현재 대여 받은 상품</title>
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

    <!-- icon css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

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

        /* 현재 대여받은 상품 글씨체 */
        #titleNextName {
            color: white;
        }

        /*********************************************************/
        /* 대여 받은 상품 목록 출력 시작 */
        .list{
            margin: auto;
            margin-top: 15px;
            padding: 15px;
            width: 95%;
            border-radius: 10px;
            border: 1px solid rgb(105, 102, 102);
        }
        .title{ /* 게시글 제목 */
            margin-bottom: 20px;
        }
        .content>.left{margin-bottom: 5px;} /* 왼쪽 */
        .content>.left>b{
            color:gray;
        }
        .fa-arrow-circle-right{ /* 오른쪽 페이지이동 아이콘 */
            font-size: 40px;
            margin-top: 35px;
            margin-left: 15px;
        }
    </style>
</head>
<body>
    <div class="row container-fulid">
        <div class="col-6" align=center>
            <a href="#" class="navbar-brand">
                <p id=titlename>돈-다</p>
            </a>
            <b id=titleNextName>현재 대여 받은 상품</b>
        </div>
        <div class="col-6"> </div>
    </div>

	<c:forEach var="i" items="${borrowList }">
    <div class="row list">
        <div class="col-10 listcontents">
            <div class="title">
                <h4><b>${i.item }</b></h4> 
            </div>
            <div class="row content">
                <div class="col-4 left"><b>대여 일자</b></div>
                <div class="col-8 right">${i.paymentDate }</div> 
            </div>
            <div class="row content">
                <div class="col-4 left"><b>결제 내역</b></div>
                <div class="col-8 right">${i.price }상추</div> 
            </div>
            <div class="row content">
                <div class="col-4 left"><b>대여자</b></div>
                <div class="col-8 right">${i.seller }</div> 
            </div>
        </div>
        <div class="col-2">
        <input type="hidden" val="${i.seller }">
        <input type="hidden" val="${i.parentseq }">
            <a href="/borrowBoard/borrowView?seq=${i.parentseq}&id=${i.seller}"><i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>
    </c:forEach>
    
    
</body>
</html>