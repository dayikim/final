<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
@charset "utf-8";

* {
	margin: 0;
	padding: 0;
}

ul, li {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.board_wrap {
	/*     width: 1000px; */
	margin: 50px auto;
}

.board_title {
	margin-bottom: 30px;
	padding-left: 18px;
}

.board_title strong {
	font-size: 3rem;
}

.board_title form {
	/* 	float: right;
	position : relative;
	top : -20px;	
	width: 350px;
	height: 35px; */
	
}

.board_title .search {
	/* width: 350px;
	height: 40px; */
	text-align: right;
}

.inp_slct {
	display: inline-block;
	width: 130px;
	vertical-align: top;
}

.inp_slct+input {
	width: 260px;
	vertical-align: top;
}

.board_title p {
	margin-top: 5px;
	font-size: 1.4rem;
}

.bt_wrap {
	/* 	float : right; */
	/*     margin-top: 30px; */
	/*     text-align: center; */
	/*     font-size: 0; */
	text-align: right;
	margin: 5px;
	/* margin : 20px 0 20px; */
}

.bt_wrap .writeBtn {
	background: white;
	border: 0px;
	font-size: 1.7rem
}

/* .writeBtn .btn-img { */
/*         background: url( "resources/css/noticecss/write.png" ) no-repeat; */
/*         border: none; */
/*         width: 32px; */
/*         height: 32px; */
/*         cursor: pointer; */
/*       } */

/* .bt_wrap a { */
/*     display: inline-block; */
/*     min-width: 80px; */
/*     margin-left: 3px; */
/*     padding: 10px; */
/*     font-size: 1.4rem; */
/* } */

/* .bt_wrap a:first-child { */
/*     margin-left: 0; */
/* } */
.bt_wrap a.on {
	background: #000;
	color: #fff;
}

.ntrp-comments {
	text-align: center;
	margin-left: 100px;
	margin-top: 50px;
}

.reply-container .ntrp_writer {
	float: left;
	width: 10%;
	line-height: 35px;
}

.reply-container .ntrp_contents {
	float: left;
	width: 50%;
	line-height: 35px;
	height: auto;
	word-break: break-all;
}

.ntrp_contents .hiddenCon {
	width: 100%;
	height: 100%;
}

.reply-container .ntrp_reg_date {
	float: left;
	width: 15%;
	line-height: 35px;
}

.reply button {
	float: right;
	margin-right: 5px;
}

.comments-row {
	width: 90%;
	overflow: hidden;
	border-radius: 5px;
}

.replyFrm {
	width: 91%;
	margin-left: 50px;
}

.comments-row textarea {
	float: left;
	padding: 5px;
	display: block;
	border: 1px solid #ffa5a5;
	width: calc(100% - 70px);
}

.comments-row div {
	overflow: hidden;
	margin: 0;
	padding: 0;
	width: 80px;
}

.comments-row button {
	width: 60px;
	height: 75px;
	float: right;
	margin-left: 5px;
	border: 1px solid #ffa5a5;
	color: #ffa5a5;
	background-color: white;
}

.board_list {
	width: 100%;
	border-top: 2px solid #000;
}

.board_list>div {
	border-bottom: 1px solid #ddd;
	font-size: 0;
}

.board_list>div.top {
	border-bottom: 1px solid #999;
}

.board_list>div:last-child {
	border-bottom: 1px solid #000;
}

.board_list>div>div {
	display: inline-block;
	padding: 15px 0;
	text-align: center;
	font-size: 1rem;
}

.board_list>div.top>div {
	font-weight: 600;
}

.board_list .num {
	float: left;
	width: 10%;
}

.board_list .title {
	width: 60%;
}

.board_list .top .title {
	text-align: center;
	float: left;
}

.board_list .writer {
	width: 10%;
}

.board_list .date {
	width: 10%;
}

.board_list .count {
	width: 10%;
}

.replyFrm .reply {
	overflow: hidden;
	padding: 20px 0;
	border-bottom: 1px solid #ffa5a5;
	text-align: center;
	border-radius: 5px;
	color: #254E7C;
}

.board_page {
	margin-top: 10px;
	text-align: center;
	/*     font-size: 0; */
}

.board_page a {
	display: inline-block;
	width: 32px;
	height: 32px;
	box-sizing: border-box;
	vertical-align: middle;
}

.board_page a.bt {
	padding-top: 10px;
	font-size: 1.2rem;
	letter-spacing: -1px;
}

.board_page a.num {
	padding-top: 9px;
	font-size: 1.4rem;
}

.board_page a.num.on {
	border-color: #000;
	background: #000;
	color: #fff;
}

/* .board_page a:first-child { */
/*     border-left: 1px solid #ddd; */
/* } */
.board_view {
	width: 98%;
	margin: auto;
	border-top: 2px solid #000;
}

.board_view .title {
	padding: 20px 15px;
	border-bottom: 1px dashed #ddd;
	font-size: 1.5rem;
}

.board_view .file {
	text-align: right;
	padding: 0 20px;
}

.board_view .info {
	text-align: right;
	padding: 15px;
	border-bottom: 1px solid #999;
	border-top: 1px solid #999;
	font-size: 0;
}

.board_view .info dl {
	position: relative;
	display: inline-block;
	padding: 0 20px;
}

.board_view .info dl:first-child {
	padding-left: 0;
}

.board_view .info dl::before {
	content: "";
	position: absolute;
	top: 1px;
	left: 0;
	display: block;
	width: 1px;
	height: 13px;
	background: #ddd;
}

.board_view .info dl:first-child::before {
	display: none;
}

.board_view .info dl dt, .board_view .info dl dd {
	display: inline-block;
	font-size: 1rem;
}

/* .board_view .info dl dt { */

/* } */
.board_view .info dl dd {
	margin-left: 10px;
	color: #777;
}

.board_view .cont {
	padding: 15px;
	border-bottom: 1px solid #000;
	line-height: 160%;
}

.board_write {
	border-top: 2px solid #000;
}

.board_write .title, .board_write .info {
	padding: 15px;
}

.board_write .info {
	border-top: 1px dashed #ddd;
	border-bottom: 1px solid #000;
}

.board_write .modiFile {
	float: left;
	width: 265px;
	height: 33px;
	line-height: 33px;
}

.board_write .title dl {
	font-size: 0;
}

.board_write .info dl {
	display: inline-block;
	width: 50%;
	vertical-align: middle;
}

.board_write .title dt, .board_write .title dd, .board_write .info dt,
	.board_write .file dt {
	display: inline-block;
	vertical-align: middle;
	font-size: 1.4rem;
}

.board_write .title dt, .board_write .info dt {
	width: 100px;
}

.board_write .title dd {
	width: calc(100% - 100px);
}

.board_write .title input[type="text"] {
	padding: 10px;
	box-sizing: border-box;
}

.board_write .title input[type="text"] {
	width: 80%;
}

.board_write .cont {
	border-bottom: 1px solid #000;
}

.board_write .cont textarea {
	display: block;
	width: 100%;
	height: 300px;
	margin: 5px;
	padding: 15px;
	box-sizing: border-box;
	border: 0;
	resize: vertical;
}
</style>
<script>
$(function(){
	$("#registerBtn").on("click",function(){
		location.href="/tBoard/toSelling";
	})
	
	$("#requestBtn").on("click",function(){
		location.href="/tBoard/toRequest";
	})
	
	$("#back").on("click", function() {
		location.href = '/my/mypageProc';
	})		
})
	
</script>


</head>
<body>
	<div class="board_wrap">
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">번호</div>
					<div class="title">제목</div>
				</div>
				<c:forEach var="boardAll" items="${boardAll}">
					<div>
						<input type="hidden" class="num" name="seq"
							value="${boardAll.seq}">
						<div class="num">${boardAll.seq}</div>
						<div class="title">
							<a href="/tBoard/RequestView?seq=${boardAll.seq}&id=${boardAll.writer}">${boardAll.title}</a>
						</div>
					</div>
				</c:forEach>
				<div class="text-right footer">
					<input type=button class="btn btn-dark" value="재능판매"
						id="registerBtn"> <input type=button class="btn btn-dark"
						value="재능요청" id="requestBtn"> <input type=button
						class="btn btn-dark" value="메인으로" id="back">
				</div>
			</div>
		</div>
	</div>
</body>
</html>