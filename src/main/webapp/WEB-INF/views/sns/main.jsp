<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free Website Template" name="keywords">
<meta content="Free Website Template" name="description">
<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
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

<script src="/js/main.js"></script>


<style>
.navbar {
	position: absolute;
}

#SnSbody {
	position: absolute;
	top: 20%;
	margin-left: 4%;
}

#titlename {
	margin-top: 1%;
	margin-bottom: 0;
	font-size: 30px;
	font-family: 'Gugi', cursive;
	color: white;
}

img {
	width: 100%;
}

#search {
	width: 500px;
	position: relative;
}

.Explanation {
	position: relative;
	top: 30%;
}

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
		position: relative;
		top: 100px;
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

#commenticon, #top, #love, #modicomm {
	cursor: pointer;
}

#commenticon {
	color: #AA96DA;
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

#hiddencomment{
	display : none;
}

#photo {
	max-width: 300px;
	max-height: 400px;
}
</style>
<script>
	var count = 2;
	$(function() {
		console.log(count);
		//무한스크롤
		var isScroll = true;
		let loadNewPage = $(window).on("scroll",(function() {
			if (((window.innerHeight + window.scrollY) >= document.body.offsetHeight)&& isScroll) {
				$.ajax({
					url : "/sns/page",
					type : "get",
					data : {"count" : count},
					dataType : "json"
				}).done(function(e){
					if (count > Number($("#length").val()) / 5) isScroll = false;
					console.log(isScroll);
					for(let i =0; i<e.length; i++){
					if(isScroll){
					var node ="";
					
					node += "<div class=\"card gedf-card\">"
					node +="<div class=card-header>"
					     node +="<div class=\"d-flex justify-content-between align-items-center\">"
					         node +="<div class=\"d-flex justify-content-between align-items-center\">"
						node +="<div class=mr-2>"
						
							  $.ajax({
						    	  url: "/sns/snsprofileimage",
						    	  type : "get",
								  data : {"id":e[i].id},
								  async: false,
								  dataType : "TEXT"
						      }).done(function(result){
						    	  if(result !=null){
						    		  node += "<img class=rounded-circle style =\"width :50px; height :50px;\" src=\"data:image/png;base64,"+result+"\">";
						    	  }else{
						    		  node +="<img class=rounded-circle style =\"width :50px; height :50px;\" src = \"/imgs/nomalProfile.jpg\">";
						    	  }

						      })

						node += "</div>"
							node +="<div class=ml-2>"
								node +="<div class=\"h5 m-0\">"+e[i].id + "<input type=hidden id=hiddenseq value=114>"
								
								if(e[i].id == $("#session").val()){
									node +="<a href=/sns/delete?seq="+e[i].seq+" id=del style =\"position:relative; left:5%\">삭제</a>"
									node +="<a href=/sns/modify?seq="+e[i].seq+" id=modi style =\"position:relative; left:10%\">수정</a>"
								}						
														
							node +="</div>"

									node +="<div class=\"h7 text-muted\">"+e[i].region+"</div>"
						node +="</div>"
					node += "</div>"
				node +="<div></div>"
				node +="</div>"
			node +="</div>"
					node +="<div class=card-body id="+e[i].seq+">"
						node +="<div class=\"text-muted h7 mb-2\">"
						      node +="<i class=\"fa fa-clock-o\"></i>"+e[i].category+"</div>"
						      $.ajax({
						    	  url: "/sns/snspicture",
						    	  type : "get",
								  data : {"firstseq":e[e.length-1].seq  , "lastseq" :e[0].seq},
								  async: false,
								  dataType : "json"
						      }).done(function(result){
						    	  for(let p=0; p<result.length; p++){
						    		  if(result[p].parent == e[i].seq){
						  
						    			  node += "<a href=\"/sns/download?oriName="+result[p].oriName+"\">";
						    			  node += "<img src=\"data:image/png;base64,"+result[p].sysName+"\" id=photo>";
						    			  node += "</a>";

						    		  }

						    	  }

						      })
						      
									 node +="<p class=card-text>"+e[i].contents+"</p>"
									 node +="</div>"
									 node +="<div class=card-footer>"
										
											
						if(Number(e[i].love) ==0){				
						 node +="<a class=card-link id=love style=\"color: #FDD2BF\">"
						 node +="<i class=\"far fa-heart\"></i>"+e[i].love+"</a>"
						}else{
						 node +="<a class=card-link id=love style=\"color: #FF6B6B\">"
						 node +="<i class=\"fas fa-heart\"></i>"+e[i].love+"</a>"
						}
																					
				 node += "<a class=card-link id=commenticon>"
			     node +="<i class=\"fas fa-comment-dots\"></i>"
			 node += "Comment</a>"
						 node +="</div>"

									<!-- 댓글작성 -->
									 node += "<div id=hiddencomment>"
										 node += "<div class=\"input-group mb-3\">"
			 node += "<input type=text class=form-control id=comment placeholder=\"댓글을 작성해주세요\" aria-label=Recipient's username aria-describedby=button-addon2>"
											 node +="<div class=input-group-append>"
						 node += "<button class=\"btn btn-outline-secondary\" type=button id=sendcomment>"
													 node += "<i class=\"fas fa-pen\"></i>"
												 node += "</button>"
											 node += "</div>"
					 node += "<input type=hidden id=hidden value="+e[i].seq+"> <input type=hidden id=lovecount value="+e[i].love+">"
										 node += "</div>"

										<!-- 댓글리스트 -->
										
									 node += "</div>"
								 node += "</div>"

					$("#snsbody").append(node); 
							 
								 
					}
				}
					count++;
				})
				
			}
		}));	
		
		//파일명출력
	     $('#file').change(function(){	            
	            var files=$('input[name="file"]')[0].files;
	            
	            for(var i= 0; i<files.length; i++){
	            	let name = files[i].name
	            	
	            	let delDiv = $("<div>");
	                let delBtn = $("<button>");
	                delBtn.addClass("delfile");
	                delBtn.text("-")
	                delDiv.append(delBtn);

	                let rowDiv = $("<div>");
	                rowDiv.addClass("row");

	                rowDiv.append(name);
	                rowDiv.append(delDiv);
	            	
	            	let br = $("<br>");
	            	
	            	$("#upload").append(rowDiv);
	            	$("#upload").append(br);
	            }
	            
	        });
	     
		//출력한 파일 삭제
	     document.getElementById
         $("#upload").on("click", ".delfile", function(){ //동적바인딩
             $(this).closest(".row").remove();
         })
		
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
					//댓글뿌리기
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
						modify_tag.attr("href","#");
						modify_tag.attr("id","modicomm");
						modify_tag.text("수정");
											
						let input = $("<input type=hidden id=commentseq>");
						input.text(resp[i].seq);
						
						let comment = $("<div>");
						comment.attr("id","comment");
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
		
		//댓글수정
		$(document).on("click","#modicomm",function(){
			console.log($(this).parents(".comment-heading").siblings("#comment").attr("contenteditable"));
			console.log($(this).parent().siblings("#commentseq").text());
			if($(this).parents(".comment-heading").siblings("#comment").attr("contenteditable") === "false" || $(this).parents(".comment-heading").siblings("#comment").attr("contenteditable") == undefined  ){ // 첫 클릭 했을 때 
				$(this).parents(".comment-heading").siblings("#comment").attr("contenteditable","true");
				$(this).parents(".comment-heading").siblings("#comment").focus();	//수정 시작
			} else{
				$(this).parents(".comment-heading").siblings("#comment").blur();
				$.ajax({
					url: "/snscomm/modify",
					data:{"seq":$(this).parent().siblings("#commentseq").text(),"contents":$(this).parents(".comment-heading").siblings("#comment").text()},
					dataType:"TEXT",
				}).done(function(e){
					if(e == 'success'){
						$(this).parents(".comment-heading").siblings("#comment").attr("contenteditable","false");
					}else{
						alert('수정실패')
					}
				})
			}
		})	
		
		//댓글작성
		$(document).on("click","#sendcomment",function(){
			let hidden_comment = $(this).parents("#hiddencomment");
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
	                  $(this).parents("#hiddencomment").load(window.location.href + $(this).parents("#hiddencomment"));
//	                  let ul = $("<ul>")
//					ul.attr("class","comment-list");
//						ul.attr("id", "commentList");
//						
//						let body_div = $("<div>");
//						body_div.attr("class","comment-body");
//						
//						let comment_head = $("<div>");
//						comment_head.attr("class","comment-heading");
//												
//						let comment_writer = $("<h6>");
//						comment_writer.text($("#session").val());
//						
//						let delete_tag = $("<a>");
//						delete_tag.attr("href","/snscomm/delete?seq="+$(this).parent().siblings("#hidden").val());
//						delete_tag.attr("id","delcomm");
//						delete_tag.text("삭제");
//						
//						let modify_tag = $("<a>");
//						modify_tag.attr("href","/snscomm/modify?seq="+$(this).parent().siblings("#hidden").val());
//						modify_tag.attr("id","modicomm");
//						modify_tag.text("수정");						
//						
//						let input = $("<input type=hidden id=commentseq>");
//						input.text(resp[i].seq);
//						
//						let comment = $("<div>");
//						comment.text($(this).parent().siblings("#comment").val());
//									
//						comment_writer.append(delete_tag);
//						comment_writer.append(modify_tag);						
//						
//						comment_head.append(comment_writer);
//						comment_head.append(input);					
//						
//						body_div.append(comment_head);
//						body_div.append(comment);												
//						
//						ul.append(body_div);					
//						$(#hidden_comment).prepend(ul);     
						
	               }else{
	                  alert('작성실패')
	               }
	            })            
	            $(this).parent().siblings("#comment").val("");
	         }
		})
		
		
		//좋아요
		$(document).on("click","#love",function(){
			if(${loginID == null}){
	            alert('로그인 후 이용해주세요')
	         }else{
	        	 $.ajax({
	        		 url : "/sns/love",
	        		 type : "POST",
	        		 data : {"seq":$(this).parent().siblings("#hiddencomment").children(".input-group").children("#hidden").val(),
	        			 "love":$(this).parent().siblings("#hiddencomment").children(".input-group").children("#lovecount").val()}
	        	 }).done(function(resp){
	        		location.reload();
	        	 })
	         }
		})

		//화면올리기
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
    	
    	$("#search").keyup(function(e) {
			if (e.keyCode == 13) {
				location.href = "/AllBoardList/allList?search="+ $("#search").val();
			}
		})
		
		$("#chat").on("click",function(){
			location.href = "/chat";
		})
		
	})
</script>
</head>
<body>

	<!-- Top Bar Start -->
	<div class="top-bar d-none d-md-block">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="top-bar-left">
						<div class="text">
							<h2>AM 9:00 - PM 7:00</h2>
						</div>
						<div class="text">
							<h2>02 123 4567</h2>
							<p>고객 센터</p>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="top-bar-right">
						<div class="social">
							<a href="/sns/main"><i class="fab fa-twitter"></i></a> <a
								href="/sns/main"><i class="fab fa-facebook-f"></i></a> <a
								href="/sns/main"><i class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Top Bar End -->

	<!-- Nav Bar Start -->
	<div class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
			<a href="/" class="navbar-brand"><p id=titlename>돈-다</a>
			</p>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<c:choose>
				<c:when test="${loginID == null }">
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav ml-auto">
							<input class="form-control mr-sm-5" type="search"
								placeholder="물품, 지역을 검색해주세요." id=search aria-label="Search">
							<a href="/person/login" class="nav-item nav-link active">Login</a>
							<!-- Login Page 이동 -->
							<a href="/person/join" class="nav-item nav-link">Sign Up</a>
							<!-- SignUp Page 이동 -->
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav ml-auto">
							<input class="form-control mr-sm-5" type="search"
								placeholder="물품, 지역을 검색해주세요." id=search aria-label="Search">
							<a href="/person/logout" class="nav-item nav-link active">Logout</a>
							<!-- Logout -->
							<div class="collapse navbar-collapse" id="navbarNavDropdown">
								<ul class="navbar-nav">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#"
										id="navbarDropdownMenuLink" role="button"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> Menu </a>
										<div class="dropdown-menu"
											aria-labelledby="navbarDropdownMenuLink">
											<a class="dropdown-item" href="#">Board</a> <a
												class="dropdown-item" href="/sns/main">SNS</a> <a
												class="dropdown-item" href="#">My page</a> <a
												class="dropdown-item" href="#">Charging</a>
										</div></li>
								</ul>
								<button type="button" class="btn btn-outline-warning" id="chat">Chatting</button>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- Nav Bar End -->


	<div class="container-fluid gedf-wrapper">
		<div class="row" id=row>
			<div class="col-md-3"></div>
			<div class="col-md-6 gedf-main">
				<!--- 글쓰기-->
				<form action="/sns/write" method=post enctype="multipart/form-data">
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
											<input type=file name=file id=file accept=".gif, .jpg, .png"
												multiple>
											<div id=upload></div>
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
				<div id=snsbody>
					<c:forEach var="item" items="${list}" varStatus="status">
						<div class="card gedf-card">
							<div class="card-header">
								<div class="d-flex justify-content-between align-items-center">
									<div class="d-flex justify-content-between align-items-center">
										<div class="mr-2">
											<c:choose>
												<c:when test="${initprofile.get(status.index) != null}">
													<img class="rounded-circle"
														src="data:image/png;base64,${initprofile.get(status.index) }"
														alt="" style="width: 50px; height: 50px;">
												</c:when>
												<c:otherwise>
													<img class=rounded-circle
														style="width: 50px; height: 50px;"
														src="/imgs/nomalProfile.jpg">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="ml-2">
											<div class="h5 m-0">
												${item.id} <input type=hidden id=hiddenseq
													value=${item.seq }>
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
								<c:forEach var="file" items="${file}">
									<c:choose>
										<c:when test="${file.parent == item.seq }">
											<a
												href="/sns/download?oriName=${file.oriName}&sysName=${file.sysName}">
												<img src="data:image/png;base64,${file.sysName}" id=photo>
											</a>
										</c:when>
									</c:choose>

								</c:forEach>
								<p class="card-text">${item.contents }</p>
							</div>
							<div class="card-footer">
								<c:choose>
									<c:when
										test="${isLove.indexOf(String.valueOf(item.seq)) != -1}">
										<a class="card-link" id=love style="color: #FF6B6B"><i
											class="fas fa-heart"></i>${item.love }</a>
									</c:when>
									<c:otherwise>
										<a class="card-link" id=love style="color: #FDD2BF"><i
											class="far fa-heart"></i>${item.love }</a>
									</c:otherwise>
								</c:choose>

								<a class="card-link" id=commenticon><i
									class="fas fa-comment-dots"></i>Comment</a>
							</div>

							<!-- 댓글작성 -->
							<div id=hiddencomment>
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
									<input type=hidden id=hidden value=${item.seq }> <input
										type=hidden id=lovecount value=${item.love }>
								</div>
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
	<input type=hidden id=session value=${loginID }>
	<input type=hidden id=length value=${snslength }>
</body>
</html>