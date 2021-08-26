<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
 <style>
 /*모달창  */
.modal-title {
	margin: auto;
	font-size: 24px;
	font-weight: 800;
}

.review_title {
	display: block;
	margin: 0;
	font-size: 20px;
	font-weight: 800;
	color: black;
	text-align: start;
}

.review_text {
	display: block;
	margin: 0;
	font-size: 18px;
	text-align: start;
}

.review_form img {
	position: absolute;
	top: 20px;
	right: 20px;
	margin-bottom: 10px;
	width: 100px;
	overflow: hidden;
}

.review_form img {
	position: absolute;
	top: 20px;
	right: 20px;
	margin-bottom: 10px;
	width: 100px;
	overflow: hidden;
}

.contents{
font-size:23px;
font-weight:800;
}

.writer {
	display: block;
	text-align: start;
}

.modalBtn {
	display: block;
	margin:auto;
}

 </style>

</head>
<body>
		<c:forEach var="i" items="${read}" varStatus="vs">
	<div class="modal_box" id="sendModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">내가 보낸 거래후기
										보기</h5>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<div class="mb-3 review_form">
											<label class="col-form-label review_title"><b>${i.name}</b>님에게
												감사인사를 남겼습니다.</label> <label class="col-form-label review_text"></label>
											<img src="/imgs/letter.png">
										</div>
										<hr>
										<div class="mb-3">
											<input class="form-control contents" value="${i.contents}"
												readonly="readonly"></input>
										</div>
									</div>
									<button type="button" class="btn btn-dark modalBtn text-right"
										onclick="window.close();">닫기</button>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
</body>
</html>