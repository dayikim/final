<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nunito:600,700,900" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<title>회원가입완료</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
#body {
    font-family: 'Nunito';
	background-color:  #5d8fc9;
}

#login-card{
    width:350px;
    border-radius: 25px;
    margin:150px auto;  
}

#checkID,#checkBtn{
    border-radius:30px;
    margin-bottom: 10px;
}

#btn{
   position: absolute; 
   bottom: -35px; 
   padding: 5px;
   margin: 0px 55px;
   align-items: center;
   border-radius: 5px"
}

#container{
    margin-top:25px;
}

.btn-circle.btn-sm { 
	width: 40px; 
    height: 40px; 
    padding: 2px 0px; 
    border-radius: 25px; 
    font-size: 14px; 
    text-align: center;           
    margin: 8px;
}

div{
    text-align: center;
    margin-bottom: 10px;
}

p{
    font-size: 50px;
    font-family: 'Gugi', cursive;
}
</style>
</head>
<body id="body">
<div id="login-card" class="card">
<div class="card-body">

    <p>돈<span>-</span>다</p>

   	<div>회원가입을 축하드립니다!</div>
    <a href="/"><button type="button" id="checkID" class="btn btn-primary deep-purple btn-block ">메인으로</button></a>
    <a href="/person/login"><button type="button" id="checkBtn" class="btn btn-primary deep-purple btn-block ">로그인하러가기</button><br></a>


    
</div>
</div>

</body>
</html>