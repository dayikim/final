<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>


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

#commenticon, #top, #love {
	cursor: pointer;
}

#commenticon {
	color: #AA96DA;
}
#love{
	color : #FFBCBC;
}

#del, #modi, #delcomm, #modicomm {
	font-size: 3px;
}

#top {
	position: fixed;
	bottom: 5%;
	right: 16%;
	width: 35px;
	display: none;
	font-size: 50px;
}
</style>
<script>
	$(function() {	
		//댓글버튼눌렀을때
		$(document).on("click","#commenticon",function(){
			let hidden_comment = $(this).parent().siblings("#hiddencomment");
			if($(this).parent().siblings("#hiddencomment").css("display")=="none"){
				$(this).parent().siblings("#hiddencomment").show();
				$.ajax({
					url : "/snscomm/replyList",
					type : "POST",
					data : {"parentSeq":$(this).parent().siblings("#hiddencomment").children(".input-group").children("#hidden").val()},
					dataType:"JSON",
				}).done(function(resp){
					console.log(resp[0])
					console.log(resp[1])
					console.log(resp.length)
					console.log(resp[0].id)
					for(var i = 0; i < resp.length; i++){
						
						let ul = $("<ul>")
						ul.attr("class","comment-list");
						ul.attr("id", "commentList");
						
						let body_div = $("<div>");
						body_div.attr("class","comment-body");
						
						let comment_head = $("<div>");
						comment_head.attr("class","comment-heading");
						
						
						let comment_writer = $("<h6>");
						comment_writer.text(resp[i].id);
						
						let delete_tag = $("<a>");
						delete_tag.attr("href","/snscomm/delete?seq="+resp[i].seq);
						delete_tag.attr("id","delcomm");
						delete_tag.text("삭제");
						
						let modify_tag = $("<a>");
						modify_tag.attr("href","/snscomm/modify?seq="+resp[i].seq);
						modify_tag.attr("id","modicomm");
						modify_tag.text("수정");
						
						
						let input = $("<input type=hidden id=commentseq>");
						
						let comment = $("<p>");
						comment.text(resp[i].contents);
						
						if(resp[i].id == $("#session").val()){
							comment_writer.append(delete_tag);
							comment_writer.append(modify_tag);
						}
						
						comment_head.append(comment_writer);
						comment_head.append(input);
						
						
						body_div.append(comment_head);
						body_div.append(comment);
						
						
						
						ul.append(body_div);
						console.log("Asdasdsadsa");
						
						$(hidden_comment).append(ul);
						
					}
					
				})
			}else{
				$(this).parent().siblings("#hiddencomment").hide();
				let delete_ul = $(hidden_comment).children(".comment-list");
				for(let i =0; i<delete_ul.length; i++){
					$(delete_ul[i]).remove();
				}
				
			}
		})
		
		//댓글뿌리기
//		$(document).on("click","#commenticon",function(){
//			$(document).on("click","#commenticon",function(){
//				$.ajax({
//					url : "/snscomm/replyList",
//					type : "POST",
//					data : {"parentSeq":$(this).parent().siblings("#hiddencomment").children(".input-group").children("#hidden").val()}
//				}).done(function(resp){
//					list = resp;
//					for(var i = 0; i < list.length; i++){
//						console.log(list);
//					}
//					
//				})
//			})
//		})
		
		//댓글작성
		$(document).on("click","#sendcomment",function(){	
			if(${loginID == null}){
	            alert('로그인 후 이용해주세요')
	         }else{
	            $.ajax({
	               url : "/snscomm/write",
	               type : "GET",
	               data : {"contents":$(this).parent().siblings("#comment").val(),"seq":$(this).parent().siblings("#hidden").val()}               
	            }).done(function(resp){
	               if(resp == 1){
	                  alert('댓글작성완료!')
	                  $("#comment").val("")	                  
	               }else{
	                  alert('작성실패')
	               }
	            })	            
	         }
		})
		
		$(document).on("click","#love",function(){
			if(${loginID == null}){
	            alert('로그인 후 이용해주세요')
	         }else{
	        	 $.ajax({
	        		 url : "/sns/love",
	        		 type : "POST",
	        		 data : {"seq":$(this).parent().siblings("#hiddencomment").children(".input-group").children("#hidden").val(),
	        			 "love":$(this).parent().siblings("#hiddencomment").children(".input-group").children("#lovecount").val()}
	        	 })
	         }
		})

    	$( window ).scroll( function() {
    		if ( $( this ).scrollTop() > 200 ) {
    			$( '#top' ).fadeIn();
    		} else {
    			$( '#top' ).fadeOut();
    		}
    	} );
    	$( '#top' ).click( function() {
    		$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
    		return false;
    	} );
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
										<div class="h5 m-0">
											${item.id}
											<c:choose>
												<c:when test="${loginID == item.id }">
													<a
														href="${pageContext.request.contextPath}/sns/delete?seq=${item.seq }"
														id=del>삭제</a>
													<a
														href="${pageContext.request.contextPath}/sns/modify?seq=${item.seq }"
														id=modi>수정</a>
												</c:when>
											</c:choose>
										</div>
										<div class="h7 text-muted">${item.region}</div>
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
							<a class="card-link" id=love><i class="far fa-heart"></i>${item.love }</a>
							<a class="card-link" id=commenticon><i class="fas fa-comment-dots"></i>Comment</a>
						</div>

						<!-- 댓글작성 -->
						<div id=hiddencomment style="display: none;">
							<div class="input-group mb-3">
								<input type="text" class="form-control" id=comment
									placeholder="댓글을 작성해주세요" aria-label="Recipient's username"
									aria-describedby="button-addon2">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										id="sendcomment">
										<i class="fas fa-pen"></i>
									</button>
								</div>
								<input type=hidden id=hidden value=${item.seq }>
								<input type=hidden id=lovecount value=${item.love }>
							</div>

							<!-- 댓글리스트 -->
							<%-- 	<ul class="comments-list" id=commentList>
									<div class="comment-body">
										<div class="comment-heading">
											<h6>list.id
												<c:choose>
													<c:when test="${loginID == comment.id }">
														<a
															href="${pageContext.request.contextPath}/snscomm/delete?seq=${comment.seq }"
															id=delcomm>삭제</a>
														<a
															href="${pageContext.request.contextPath}/snscomm/modify?seq=${comment.seq }"
															id=modicomm>수정</a>
													</c:when>
												</c:choose>
											</h5>
											<div type=hidden value=${comment.seq } id=commentseq></div>
										</div>
										<p>list.contents</p>
									</div>
								</ul> --%>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-md-3">
				<i class="fas fa-arrow-up" id=top></i>
			</div>
		</div>
	</div>
	</div>
	<input type = hidden id = session value = ${loginID }>
</body>
</html>