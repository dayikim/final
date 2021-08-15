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
}

/* 프로필 업로드 글씨체 */
#titleNextName {
	color: white;
}

.margin1 {
	height: 70px;
}

/* 사진 업로드 */
.profilebox {
	width: 200px;
	height: 170px;
	margin: auto;
}

.profilebox>img {
	width: 165px;
	height: 165px;
	border-radius: 100px;
}

/* 파일 업로드 */
.margin2 {
	height: 20px;
}

/* 버튼 업로드 */
.margin3 {
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
<script>
	$(function() {
		// 파일업로드 눌렀을때 사진 체인지
		$("#fileUpload").on('change',function() { // 파일 업로드눌렀을때(확인말고)
		let before = $("#profile").attr("src"); // 내 현재 프사의 정보를 갖고와서 before 변수에 담기
		const extension = [ "png", "jpg", "jpeg", "gif" ]; // 사진 속성의 정보 다 갖고와서 리스트에 담기
		
		if (typeof (FileReader) != "undefined") { // 만약에 파일타입이 비어있지 않다면
			var image_holder = $(".profilebox"); // 현재 before 프사에 담겨있는 사진의 div class를 갖고와서 image_holder 변수에 담기
			image_holder.empty(); // 그리고 image_holder를 비워서 전에 있던 내 프사 지워라
			
			var reader = new FileReader(); // 그리고 새로운 파일을 담기위한 인스턴스 생성후
			reader.onload = function(e) {
				$("<img />", { // 새로운 사진에 속성 부여 중...
					"src" : e.target.result,
					"class" : "thumb-image",
					"id" : "profile",
					"name" : "profile"
					}).appendTo(image_holder); // 그리고 그 속성을 image_holder 변수에 추가
					}
			let upload_extension = $(this)[0].files[0].name.split('.').pop().toLowerCase();
			console.log(upload_extension); // 뭔진 모르겠지만 위의 변수를 콘솔에 출력해서 잘 나오는지 확인

			if (extension.indexOf(upload_extension) === -1) { // 만약에 값이 -1이 나온다면(대충 사진이 아닌걸 넣었나봄)
				alert("사진/이미지만 업로드 해주세요!(.png, .jpg, .jpeg .gif만 가능합니다.)");
				$("#fileUpload").val(""); // 그리고 값 비우기
			}
			
			if (!($(this)[0].files[0].size >= (1024 * 1024 * 5))) { // 만약에 일반 사진의 용량 크기가 아니라면
				image_holder.show();
				reader.readAsDataURL($(this)[0].files[0]);
				console.log($(this)[0].files[0]);
			} else {
				alert("사진 용량은 5mb이하로 등록해주세요!");
				$("#fileUpload").val("");
				}
			} else {
				alert("This browser does not support FileReader.");
				}
		});
		
		// 업로드 취소 버튼 눌렀을 때
		$("#cencle").on("click",function(){
			opener.location.reload();
			parent.window.close();
		})
		
	})
</script>
</head>

<body>
	<div class="row container-fulid">
		<div class="col-6" align=center>
			<a href="#" class="navbar-brand">
				<p id=titlename>돈-다</p>
			</a> <b id=titleNextName>프로필 변경</b>
		</div>
		<div class="col-6"></div>
	</div>

	<div class="margin1"></div>

	<form action="/my/profileUpdate" method="post" enctype="multipart/form-data">

		<div class="container">
			<!-- 프로필 업로드 -->
			<div class="profilebox" align=center>
				<img src=${origin } id="profile" name="profile">
			</div>
			<div class="margin2"></div>

			<!-- 파일 업로드 -->
			<div align=center>
				<input type="file" id="fileUpload" name="after_profile">
			</div>
			<div class="margin3"></div>
			<hr>

			<!-- 버튼 -->
			<div class="okBtn" align=center>
				<input type=button id=cencle class="cnum-btn1" value="취소">
				<button type=submit id=update class="cnum-btn2">수정</button>
			</div>
		</div>

	</form>
</body>

</html>