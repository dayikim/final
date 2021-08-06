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

<title>findpw</title>
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

#pw,#ch{
    border-radius:30px;
    background-color: #ebf0fc;
    border-color: #ebf0fc;
    color: #9da3b0;
}

#sendphoneNumber,#checkID,#checkBtn{
    border-radius:30px;
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

#hidden{
	display:none;
}

.next_box {
    margin-top: 9px;
    font-size: 12px;   
}
</style>
<script>
$(function(){
	$("#pw").blur(function(){
		let pwRegex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[~!@#$%*\(\)^&+=\-_?]).*$/g;
		let pw = pwRegex.test($("#pw").val());
		if(pw){
			$("#regexPw").css("color","blue");
			$("#regexPw").text("사용가능한 비밀번호입니다.");
		}else{
			$("#regexPw").css("color","red");
			$("#regexPw").text("8~15자리 영문 소문자, 숫자, 특수문자를 사용하세요.");
		}
	});
	
	$("#ch").keyup(function(){
		let pw = $("#pw").val();
		let ch = $("#ch").val();
		if(pw != ch){
			$("#val").css("color","red");
			$("#val").text("비밀번호가 일치하지 않습니다.");
		}else{
			$("#val").css("color","blue");
			$("#val").text("비밀번호가 일치합니다.");
		}
	})
});
</script>
</head>
<body id="body">
<div id="login-card" class="card">
<div class="card-body">
  <h2 class="text-center">비밀번호변경</h2>
  <br>
<form action="/person/pwProc" method=post>
   	<div class="form-group">
      <input type="password" class="form-control" id="pw" placeholder="변경할 비밀번호입력" name="pw">
    </div>
    <span class="next_box" id=regexPw aria-live="assertive"></span>
    <div class="form-group">
      <input type="password" class="form-control" id="ch" placeholder="비밀번호확인" name="ch">
    </div>
    <span class="next_box" id=val aria-live="assertive"></span>
    <button type="submit" id="checkID" class="btn btn-primary deep-purple btn-block ">비밀번호변경</button><br>
    <input type=password value=${id } id=hidden name=id>
</form>
</div>
</div>

</body>
</html>