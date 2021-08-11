<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
style>body {
	background-color: #eeeeee;
}

.h7 {
	font-size: 0.8rem;
}

.gedf-wrapper {
	margin-top: 0.97rem;
}

@media ( min-width : 992px) {
	.gedf-main {
		padding-left: 4rem;
		padding-right: 4rem;
	}
	.gedf-card {
		margin-bottom: 2.77rem;
	}
}
/**Reset Bootstrap*/
.dropdown-toggle::after {
	content: none;
	display: none;
}
/*#hidden {
	display: none;
}*/
#del, #modi {
	color: black
}
</style>
<script>
	$(function() {
		$("#like").on("click", function() {
			$("#like").css("color", "red");
		})
		
		$("#button-addon2").on("click",function(){
			$.ajax({
				type = "GET",
				url : "/sns/main",
			})data : {"seq" : $("#hidden").val()}
		})
	})
</script>
</head>
<body>

	<nav class="navbar navbar-light bg-white"></nav>


	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 gedf-main">

				<!--- 글쓰기-->
				<form action="/sns/write" method=post>
					<div class="card gedf-card">
						<div class="card-header">
							<ul class="nav nav-tabs card-header-tabs" id="myTab"
								role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="posts-tab" data-toggle="tab" href="#posts" role="tab"
									aria-controls="posts" aria-selected="true">글 작성</a></li>
								<li class="nav-item"><a class="nav-link" id="images-tab"
									data-toggle="tab" role="tab" aria-controls="images"
									aria-selected="false" href="#images">사진첨부</a></li>
							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="posts"
									role="tabpanel" aria-labelledby="posts-tab">
									<div class="form-group">
										<label class="sr-only" for="contents">post</label>
										<textarea class="form-control" id="contents" name=contents
											rows="3" placeholder="사람들과 공유하고 싶은 내용을 작성해주세요"></textarea>
									</div>
								</div>
								<div class="tab-pane fade" id="images" role="tabpanel"
									aria-labelledby="images-tab">
									<div class="form-group">
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="customFile">
											<label class="custom-file-label" for="customFile">Upload
												image</label>
										</div>
									</div>
									<div class="py-4"></div>
								</div>
							</div>
							<div class="btn-toolbar justify-content-between">
								<div class="btn-group">
									<button type="submit" class="btn btn-success">작성하기</button>
								</div>
								<!-- 카테고리 -->
								<div class="btn-group">
									<select name=category>
										<option>우리동네질문</option>
										<option>동네홍보</option>
										<option>기타</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</form>

				<!--- 게시글-->
				<c:forEach var="item" items="${list}">
					<div class="card gedf-card">
						<div class="card-header">
							<div class="d-flex justify-content-between align-items-center">
								<div class="d-flex justify-content-between align-items-center">
									<div class="mr-2">
										<img class="rounded-circle" width="45"
											src="https://picsum.photos/50/50" alt="">
									</div>
									<div class="ml-2">
										<div class="h5 m-0">${item.id}</div>
										<div class="h7 text-muted">${item.region}</div>
										<c:choose>
											<c:when test="${loginID == item.id }">
												<a
													href="${pageContext.request.contextPath}/sns/delete?seq=${item.seq }"
													id=del><i class="fas fa-trash-alt"></i></a>
												<a
													href="${pageContext.request.contextPath}/sns/modify?seq=${item.seq }"
													id=modi><i class="fas fa-edit"></i></a>
											</c:when>
										</c:choose>
									</div>
								</div>
								<div></div>
							</div>
						</div>
						<div class="card-body">
							<div class="text-muted h7 mb-2">
								<i class="fa fa-clock-o"></i>${item.category }
							</div>
							<p class="card-text">${item.contents }</p>
						</div>
						<div class="card-footer">
							<a href="${pageContext.request.contextPath}/sns/like?seq=${item.seq }" class="card-link" id=like><i class="fas fa-heart"></i>${itme.love }</a>
							<a href="#" class="card-link" id=commenticon><i class="fa fa-comment"></i>Comment</a>
						</div>

						<!-- 댓글수정 -->
						<form action="/snscomm/write" method=post>
							<div class="input-group mb-3">
								<input type="text" class="form-control" name=contents
									placeholder="댓글을 작성해주세요" aria-label="Recipient's username"
									aria-describedby="button-addon2"> <input type="hidden"
									name="seq" value="${item.seq }">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="submit"
										id="button-addon2">
										<i class="fas fa-pen"></i>
									</button>
								</div>
							</div>
						</form>

						<!-- 댓글리스트 -->
						<c:forEach var="comment" items="${comment}">
							<ul class="comments-list" id=commentList>
								<div class="comment-body">
									<div class="comment-heading">
										<h5>${comment.id }</h5>
										<div type=hidden value=${comment.seq }></div>
										<c:choose>
											<c:when test="${loginID == comment.id }">
												<a href="${pageContext.request.contextPath}/snscomm/delete?seq=${comment.seq }" id=del><i class="fas fa-trash-alt"></i></a>
												<a href="${pageContext.request.contextPath}/snscomm/modify?seq=${comment.seq }" id=modi><i class="fas fa-exchange-alt"></i></a>
											</c:when>
										</c:choose>
									</div>
									<p>${comment.contents }</p>
								</div>
							</ul>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	</div>

</body>
</html>