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

<title>findID</title>
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

#phone,#inputCertifiedNumber,#name,#id{
    border-radius:30px;
    background-color: #ebf0fc;
    border-color: #ebf0fc;
    color: #9da3b0;
}

#sendphoneNumber{
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
.next_box {
    margin-top: 9px;
    font-size: 12px;   
}
</style>
<script>
$(function(){
	$('#sendphoneNumber').click(function(){
		let phoneNumberRegex = /^010\d{3,4}\d{4}$/;
		let phoneNumber = phoneNumberRegex.test($("#phone").val());
		if($("#phone").val() == ""){
    		alert("핸드폰번호 입력후 진행해주세요.");
    	}else if($("#name").val() == ""){
    		alert("이름을 입력후 진행해주세요.");
    	}else{
    		if(phoneNumber){
				let phone = $('#phone').val();
	            alert('인증번호 발송 완료!')

	            $.ajax({
	                type: "GET",
	                url: "/person/send",
	                data: {"phone" : phone},
	                success: function(res){
	                	$('#inputCertifiedNumber').keyup(function(){
	                    		if($.trim(res) ==$('#inputCertifiedNumber').val()){
	                    			$.ajax({
    	                        		type: "GET",
    	                        		url : "/person/findIdProc",
    	                        		data: {"name":$("#name").val(),"phone":$("#phone").val()}
    	                        	}).done(function(res){
    	                        		$("#val").css("display","none");
    	        						$("#id").val(res);
    	                        	})
    	                        }else{
    	                        	$("#val").css("color","red")
    	                            $("#val").text("인증번호를 확인해주세요.")
    	                        }
	                    	})
	                }
	            })
			}else{
				alert("핸드폰 형식을 확인 후 다시 인증을 시도해주세요.")
				$("#phone").val("");
			}
    	}
    });	
})
</script>
</head>
<body id="body">
<div id="login-card" class="card">
<div class="card-body">
  <h2 class="text-center">아이디찾기</h2>
  <br>

   	<div class="form-group">
      <input type="text" class="form-control" id="name" placeholder="이름입력" name="phone">
    </div>
    <div class="form-group">
      <input type="text" class="form-control" id="phone" placeholder="핸드폰입력" name="phone">
    </div>
    <button type="button" id="sendphoneNumber" class="btn btn-primary deep-purple btn-block ">인증번호발송</button><br>
    <div class="form-group">
      <input type="text" class="form-control" id="inputCertifiedNumber" placeholder="인증번호입력" name="pw">
    </div>
    <span class="next_box" id=val aria-live="assertive"></span>
    <div class="form-group">
      <input type="text" class="form-control" id="id" name="id" readonly>
    </div>

</div>
</div>

</body>
</html>