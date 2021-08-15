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

<!-- calendar -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


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

<!-- icon css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	
<style>
* {
	box-sizing: border-box;
}

/* 홈페이지 가장 위에 있는 헤더 */
.container-fulid {
	height: 60px;
	background-color: #1d2434;
}



/* 맨 윗 상단 */

/* 홈페이지 로고 */
#titlename {
	margin-top: 1%;
	margin-bottom: 0;
	font-size: 30px;
	font-family: 'Gugi', cursive;
	color: white;
	line-height: 60px;
}
/* 대여하기 글씨체 */
#titleNextName {
	line-height: 60px;
	color: white;
}


/* body */

/* 대여 정보 */
/* 대여물품 이미지 */
.container{
	margin-top: 30px;
}
.imageDiv{
	margin: auto;
	margin-top: 7px;
	width: 150px;
	height: 150px;
	overflow: hidden;
}
.imageDiv>img{
	width: 100%;
	height: 100%;
}
/* 대여물품 정보 */
.infoDiv{
	margin-top: 20px;
}
.infoDivInformationTitle{
	margin-top: 20px;
	color: gray;
}
.endDateTitle{margin-top: 9px;}


/* 대여 기간을 선택하세요 */
.body2{
	margin-top: 20px;
	border: 5px solid #334257;
	padding:20px;
}
.body2Title{
	text-align: center;
}
.choice2{
	width: 230px;
}

.margin2 {
	height: 30px;
}

/* 맨 밑 하단 */
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
	width: 80px;
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
	$(function() {
		// 취소 버튼을 눌렀을 때
		$("#cencle").on("click", function() {
			opener.location.reload();
			parent.window.close(); // 영어로 설명된 바와 같이, window.open()으로 열린 새 창만 window.close()로 닫을 수 있습니다. 일반 창에서는 원래 사용이 안 됩니다. 알아두세요!
		})

		// 캘린더 API
		$.datepicker.setDefaults({
			closeText : "닫기",
			prevText : "이전달",
			nextText : "다음달",
			currentText : "오늘",
			monthNames : [ '1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)',
					'5월(MAY)', '6월(JUN)', '7월(JUL)', '8월(AUG)', '9월(SEP)',
					'10월(OCT)', '11월(NOV)', '12월(DEC)' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShot : [ '일', '월', '화', '수', '목', '금', '토' ],
			//dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],

			changeMonth : true, //  월 변경가능
			changeYear : true, //  년 변경가능
			showMonthAfterYear : true, //  년 뒤에 월 표시
			dateFormat : "yy-mm-dd", //  년월일 표시방법  yy-mm-dd 또는 yymmdd
			firstDay : 1, //  0: 일요일 부터 시작, 1:월요일 부터 시작
			autoSize : true, //  default: false, input 사이즈를 자동으로 리사이즈.
			showAnim : "fold", //  default: show , fold

			showWeek : false, //  주차 = true : 보이기 / false : 숨기기
			weekHeader : "주차", //  default: Wk, 주차 헤드 부분의 명칭 설정

			showButtonPanel : true, //  하단에 Today, Done 버튼 Display
			gotoCurrent : false
		//  default: false, true일 경우에는 Today버튼 클릭 시 현재 일자로 이동하지 못함

		});

		// 달력 하나씩 사용할때
		$("#datepicker").datepicker({
			//  기준일 옵션
			yearRange : "c-99:c+99",
			minDate : "+1d", //  기본선택일이 1일 이후가 선택되는 옵션
			maxDate : "+5d",

			//  선택날짜의 요일을 input 필드에 넣기
			altField : "#alternate",
			altFormat : "DD" //  altFormat: "DD, d MM, yy",
		});

		// 시작날짜와 끝나는 날짜를 함께 선택해서 사용할때
		var dates = $("#datepicker_from, #datepicker_to").datepicker(
				{
					//defaultDate: "+1w",  // 기본선택일이 1 week 이후가 선택되는 옵션
					changeMonth : true,
					numberOfMonths : 2, // 한눈에 보이는 월달력수
					onSelect : function(selectedDate) {
						var option = this.id == "datepicker_from" ? "minDate"
								: "maxDate", instance = $(this).data(
								"datepicker"), date = $.datepicker.parseDate(
								instance.settings.dateFormat
										|| $.datepicker._defaults.dateFormat,
								selectedDate, instance.settings);
						dates.not(this).datepicker("option", option, date);
					}
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


	<!-- 캘린더 -->
    <div class="container">
        <div class="row body">
            <div class="col-4">
				<div class="imageDiv">
					<img src="nomal.jpg">
				</div>
            </div>
            <div class="col-8">
				<div class="infoDiv">
					<div class="infoDivTitle"><h4>자전거 팝니다</h4></div>
                	<div class="infoDivInformationTitle">판매자정보</div>
                	<div class="infoName"><i class="fas fa-user-alt"></i> 이희정</div>
					<div class="infoAdd"><i class="fas fa-map-marker-alt"></i> 서울특별시 동대문구 서울시립대로14</div>
				</div>
            </div>
        </div>


        <div class="body2">
			<div class="body2Title">
				<b>대여 기간을 선택해주세요</b>
			</div>
			<hr>
			<div class="row choice">
				<div class="col-4 choice1" align=right>
					<div class="startDateTitle"><i class="far fa-calendar-alt"></i> 대여 시작일</div>
					<div class="endDateTitle"><i class="fas fa-calendar-alt"></i> 대여 종료일</div>
				</div>
				<div class="col-8 choice2">
					<div class="startDate">
						<input type="text" id="datepicker_from" style="width: 230px;" name="date1" value="" placeholder="대여시작일을 선택해주세요">
					</div>
					<div class="endDate">
						<input type="text" id="datepicker_to" style="width: 230px;" name="date2" value="" placeholder="대여종료일을 선택해주세요">
					</div>
				</div>
				
			</div>
            
        </div>
    </div>
	
	
	

	<div class="margin2"></div>
	<hr>

	<!-- 제일 하단 -->
	<div class="row foot">
		<div class=col-1></div>

		<!-- 결제 예정 금액 -->
		<div class="col-3">결제 예정 금액 :</div>
		<div class=col-3>
			<b>0원</b>
		</div>

		<!-- 버튼 -->
		<div class="col-4 okBtn" align=right>
			<input type=button id=cencle class="cnum-btn1" value="취소">
			<button type=submit id=next class="cnum-btn2">대여요청</button>
		</div>
		<div class="col-1"></div>
	</div>


</body>
</html>