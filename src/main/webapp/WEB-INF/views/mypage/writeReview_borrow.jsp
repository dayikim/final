<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
 <style>
 /* 리뷰 */
.review {
	text-align: center;
	height: 45px;
}

.review>a {
	text-decoration: none;
	color: orange;
}
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

.writer {
	display: block;
	text-align: start;
}
.btn-wrap{
margin:0 auto;
text-align:center;
}

.modalBtn {
	padding-left:10px;
}

.send {
	margin:auto;
	margin-right:50px;
}
 
 
 
 </style>
 <script>
 
 $(function(){
	 $(".send")
		.on("click",
				function() {
					let message = $("#message-text");
					if (message.val() == "") {
						alert("메세지를 입력해주세요.");
						message.focus();
						return false;
					} else {
						let check = confirm("거래 후기를 보내시겠습니까?");
						let recipient = $("#recipient").val();
						let reviewer = $("#reviewer").val();
						let boardtype = $("#boardtype").val();
						let reviewable = $("#reviewable").val();
						let contents = $(".contents").val();
						let parentseq = $("#parentseq").val();
						if (check) {
							$
									.ajax({
										url : "/profile/checkReview",
										data : {
											parentseq : parentseq
										}
									})
									.done(
											function(resp) {
												console.log(resp);
												if (resp == 0) {
													$
															.ajax(
																	{
																		url : "/profile/review",
																		data : {
																			recipient : recipient,
																			parentseq : parentseq,
																			reviewer : reviewer,
																			reviewable : reviewable,
																			contents : contents,
																			boardtype : boardtype
																		}
																	})
															.done(
																	function(
																			resp) {
																		console
																				.log(resp);
																		if (resp == 1) {
																			alert("거래 후기 작성 완료!! \n해당 페이지를 새로 고침 해주세요.")
																			window.close();
																		} else {
																			alert("작성 실패!!")
																		}
																	})
												} else {
													alert("이미 후기를 작성하였습니다.\n마이페이지에서 거래완료 내역을 확인하세요.")
													window.close();
													return;
												}
											})
						} else {
							alert("거래 후기 작성 취소!")
							return;
						}
					}
				})
 })
 

 </script>
</head>
<body>

		<c:forEach var="i" items="${write}" >
<div class="modal_box" id="writeModal" >
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">거래후기 보내기</h5>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<div class="mb-3 review_form">
											<label class="col-form-label review_title">거래 경험이
												좋으셨나요?</label> <label class="col-form-label review_text"><b>${i.name}</b>님에게
												감사인사 남겨보세요.</label> <img src="/imgs/letter.png">
										</div>
										<hr>
										<div class="mb-3">
											<textarea class="form-control contents" name="contents"
												id="message-text" placeholder="거래 후기 남겨주세요"></textarea>
										</div>
									</div>
									<input type="hidden" name="reviewer" value="${loginID}"
										id="reviewer"> <input type="hidden" name="recipient"
										value="${i.seller}" id="recipient"> <input
										type="hidden" name="boardtype" value="${i.boardtype}"
										id="boardtype"> <input type="hidden" name="seq"
										value="${i.parentseq}" id="parentseq"> <input
										type="hidden" name="reviewable" value="y" id="reviewable">
										<div class="btn-wrap text-center">
											<button type="button" class="btn btn-dark modalBtn" onclick="window.close();"
										>취소</button>
									<button type="button"
										class="btn btn-outline-warning modalBtn send">보내기</button>
										
										</div>
								
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
</body>
</html>
