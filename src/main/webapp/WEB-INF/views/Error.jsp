<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<style type="text/css">
.container{
width:1380px;
}
.contents{
position: relative;
top:30%;
}
p{
font-family: 'Gothic A1', sans-serif;
text-align: center;
margin-top:5%;
}
.head{
font-size: 30px;
font-weight: 600;
}
.body{
font-size: 25px;
font-weight: 200;
}
.tale{
font-size: 20px;
font-weight: 200;
}
div[class*="col"]{
margin:0px;
padding:0px;
}
.titlename{
  font-family: 'Gugi', cursive;
}

</style>
</head>
<script>
$(function(){
	$("#return").on("click", function(){
		 history.back();
	})
	$("#home").on("click", function(){
		 location.href = "/";
	})
})
</script>
<body>
	
	<div class=container>
		<div class = row>
			<div class = col-6>
				<img src="/imgs/Sorry.png">
			</div>
			<div class = "col-6">
				<div class ="contents">  
					<p class = "text head">서비스 이용에 불편을 드려 죄송합니다.</p>
					<p class = "text body">서비스 처리과정에서 오류가 발생되었습니다.</p>
					<p class = "text tale">빠르게 조치 하겠습니다. 감사합니다!</p>
					<p>
						<button class="btn btn-outline-info" type = button id = return>이전 페이지</button> <button class="btn btn-outline-dark" type = button id = home>홈으로 돌아가기</button>
					</p>
					<br/>
					<p class = titlename>돈-다(주) All rights reserved.</p>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>