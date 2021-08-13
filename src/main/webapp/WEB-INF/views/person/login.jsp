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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>

<title>login</title>
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

#id,#pw{
    border-radius:30px;
    background-color: #ebf0fc;
    border-color: #ebf0fc;
    color: #9da3b0;
}

#button{
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

.find{
	color : #9da3b0;
}

#f{
	text-align: center;
}

#recaptcha{
	display : none;
}
</style>
<script>
$(function(){
	
	$("#login").on("click",function(){
		$.ajax({
			url : "/person/loginProc",
			data :{id:$("#id").val(), pw1:$("#pw").val()}
		}).done(function(resp){
			if(resp == 1){
				alert('로그인성공')
				location.href = "${pageContext.request.contextPath}/"
			}else{
				$.ajax({
					url : "/person/checkid",
					data : {id:$("#id").val()}
				}).done(function(resp){
					if(resp == 1){
						alert('비밀번호를 확인해주세요')
						$.ajax({
							url : "/person/checkcount",
							data : {id:$("#id").val()}
						}).done(function(resp){
							if(resp > 3){
								$("#recaptcha").show();
							}
						})
					}else{
						alert('가입되어있지 않는 정보입니다. 회원가입을 진행해주세요')
					}
				})                                      
			}
		})
	});
				
		$(document).ready(function() {
            $("#button_1").click(function() {
                $.ajax({
                    url: '/person/VerifyRecaptcha',
                    type: 'post',
                    data: {recaptcha: $("#g-recaptcha-response").val()},
                    success: function(data) {
                        switch (data) {
                            case 0:
                                alert("자동 가입 방지 봇 통과");
                                break;
 
                            case 1:
                                alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                                break;
 
                            default:
                                alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                                break;
                        }
                    }
                });
            });
        });
		
	})
</script>
</head>
<body id="body">
<div id="login-card" class="card">
<div class="card-body">
  <h2 class="text-center">Login</h2>
  <br>

    <div class="form-group">
      <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
    </div>
    <div class="form-group">
      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
    </div>
    <div class="g-recaptcha" data-sitekey="6Ldka9IbAAAAAGr2VBj7DtFK-OErvhtHh5MWRris" id=recaptcha></div>
    <button type="button" id="login" class="btn btn-primary deep-purple btn-block ">Login</button><br>

	<div id=f>
  	<a href="/person/findId" class=find>아이디찾기</a> | <a href="/person/findPw" class=find>비밀번호찾기</a>
  </div>
</div>
</div>

</body>
</html>