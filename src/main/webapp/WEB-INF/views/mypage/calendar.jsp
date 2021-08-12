<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>캘린더 API</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- calendar API -->
<link href='/css/calendar.css' rel='stylesheet' />
<script src='/js/calendar.js'></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">
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
	line-height: 60px;
}

/* 프로필 업로드 글씨체 */
#titleNextName {
	line-height: 60px;
	color: white;
}

/* 대여 기간을 선택하세요 */
.margin1>h4 {
	height: 70px;
	line-height: 75px;
	text-align: center;
}

.margin2 {
	height: 30px;
}

/* 버튼 */
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
<script>
	// 캘린더 API
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth'
		});
		calendar.render();
	});
	
	$(function(){
		// 취소 버튼을 눌렀을 때
		$("#cencle").on("click",function(){
			opener.location.reload();
			parent.window.close(); // 영어로 설명된 바와 같이, window.open()으로 열린 새 창만 window.close()로 닫을 수 있습니다. 일반 창에서는 원래 사용이 안 됩니다. 알아두세요!
		})
	})
	
</script>
</head>
<body>

	<!-- 맨 윗 상단 홈페이지 이름 표기 -->
	<div class="row container-fulid">
		<div class="col-2" align=right>
			<p id=titlename>돈-다</p>
		</div>
		<div class="col-2" align=left>
			<b id=titleNextName>대여 하기</b>
		</div>
		<div class="col-2"></div>
		<div class="col-2"></div>
		<div class="col-2"></div>
		<div class="col-2"></div>
	</div>

	<div class="margin1">
		<h4>
			<b>대여 기간을 선택하세요</b>
		</h4>
	</div>

	<!-- 캘린더 -->
	<div id='calendar'></div>

	<div class="margin2"></div>

	<!-- 제일 하단 -->
	<div class="row foot">
		<div class=col-1></div>
		
		<!-- 결제 예정 금액 -->
		<div class="col-3">
			결제 예정 금액 : 
		</div>
		<div class=col-4>
			<b>0원</b>
		</div>
		
		<!-- 버튼 -->
		<div class="col-3 okBtn" align=right>
			<input type=button id=cencle class="cnum-btn1" value="취소">
			<button type=submit id=next class="cnum-btn2">다음</button>
		</div>
		<div class="col-1"></div>
	</div>


</body>
</html>