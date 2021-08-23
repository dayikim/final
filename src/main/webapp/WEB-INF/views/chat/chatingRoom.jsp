<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/chatnav.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2cfa7967f01741c3dc098172b2a39ee7&libraries=services"></script>
</head>
<script>
let ws = new WebSocket("ws://175.116.7.99/chat/main"); 
let existing_roomid =[];

$(function(){
	
	for(let i =0; i<$(".user").length; i++){
		existing_roomid.push($($(".user")[i]).attr("id"));
	}

	let roomid;
	
	window.addEventListener('message',handleDocHeightMsg,false);
	
	function handleDocHeightMsg(eventObj){
		ws.send(eventObj.data);
	}
	
	ws.onmessage=function(event){
		
		let text  = JSON.parse(event.data);
		console.log(existing_roomid);
		console.log(existing_roomid.indexOf(text.roomid));
		if(text.unread != 0){
			if(existing_roomid.indexOf(text.roomid)!= -1){
				for(let i =0; i<$(".user").length; i++){
					if($($(".user")[i]).attr("id")==text.roomid){
						$($(".user")[i]).children("#unread").css("display","block");
						$($(".user")[i]).children("#unread").text(text.unread);
					}
				}
			}else{
				$.ajax({
					url: "/chat/additionRoom",
					method:"get",
					data:{"roomid":text.roomid},
					dataType: "json"
				}).done(function(result){
					console.log("응답옴");
					console.log(result);
					let node = "";
		            node += "<li class=person data-chat=person1 style=\"margin-left:2%; margin-bottom:6%;\">";
		               node+= " <div class=user id = "+result.roomid+">";
		                 node += "<div class=\"rounded-circle badge-danger\" id=unread style= \"display:block\">1"
		     				node += "</div>"
		     				
		     					$.ajax({
		     						url: "/chat/additionprofile",
		     						method:"get",
		     						data:{"roomid":result.roomid},
		     						async: false,
		     						dataType: "TEXT"
		     					}).done(function(profile){
		     						if(profile != null){
		     							node += "<img class=rounded-circle src=\"data:image/png;base64,"+profile+"\">"
		     						} else{
		     							node += "<img class=rounded-circle src=/imgs/nomalProfile.jpg>"
		     						}
		     					})
		               
		                     node+= "<span class=title>"+result.sessions+"</span>" <!-- 상태 표시가 가능함!-->
		                  node += "</div>"           
		             node += "</li>"
		            $(".RoomList").append(node);
		             
		            existing_roomid.push(text.roomid); <!-- 이거 지우면 overflow 확인 가능함-->
				})
		}
	

		}else{
			for(let i =0; i<$(".user").length; i++){
				if($($(".user")[i]).attr("id")==text.roomid){
					$($(".user")[i]).children("#unread").css("display","none");
				}
			}
		}
		
	}
	
	
	$(document).on("click",".user",function(){	
			$("#chatdisplay").css("display","block");
			$("#chatFrame").attr("src","/chat?roomid="+$(this).attr("id"));	
			$("#waiting").css("display","none");
	})
	
	for(let i =0; i< $(".user").length; i++){
		if(Number(($($(".user")[i]).children("#unread")).text()) == 0){
			$($(".user")[i]).children("#unread").css("display","none");
		}else{
			$($(".user")[i]).children("#unread").css("display","block");
		}
	}
	

})

</script>

<style>

.users {
padding: 0;
}

.person {
position: relative;
width: 100%;
padding:1rem;
cursor: pointer;
border-bottom: 1px solid #f0f4f8;
}

.person:hover {
background-color: #ffffff;
/* Fallback Color */
background-image: -webkit-gradient(linear, left top, left bottom, from(#D9E5FF), to(#ffffff));
/* Saf4+, Chrome */
background-image: -webkit-linear-gradient(right,#D9E5FF, #ffffff);
/* Chrome 10+, Saf5.1+, iOS 5+ */
background-image: -moz-linear-gradient(right,#D9E5FF, #ffffff);
/* FF3.6 */
background-image: -ms-linear-gradient(right,#D9E5FF, #ffffff);
/* IE10 */
background-image: -o-linear-gradient(right,#D9E5FF, #ffffff);
/* Opera 11.10+ */
background-image: linear-gradient(right,#D9E5FF, #ffffff);
}

#body {
    font-family: 'Nunito';
	background-color:  #5d8fc9;
}

*{ z-index:0;}
.chat-container{
overflow-y: scroll;
min-height: 600px;
max-height: 600px;
}

#waiting{
height:803px;
background-color: rgba(0,0,0,0.5);
text-align: center;
color:white;
}

.chatinfo{
position: relative;
top:35%;
font-size: 30px;
}

.card{
text-align: left;
}


.preview_picture_box{
width:100%;
position:absolute;
bottom:13%;
z-index:99;
background-color:rgba(0, 0, 0,0.5);
}
.preview_picture{
		margin-right:3%;
        width:  75px;
        height: 125px;
        display: inline-block;
    }
    img{
     width:75px;
     height: 100px;
    }
    .preview_close{
    height:25px;
    overflow:hidden;
    position:relative;
    top:5%;
    float: right;
    background-color: red;
    color:red;
    }
.media-meta-day {
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    margin-bottom: 0;
    color: #8b95a5;
    opacity: .8;
    font-weight: 400
}
.media-meta-day::before {
    margin-right: 16px
}

.media-meta-day::before,
.media-meta-day::after {
    content: '';
    -webkit-box-flex: 1;
    flex: 1 1;
    border-top: 1px solid #ebebeb
}

.media-meta-day::after {
    content: '';
    -webkit-box-flex: 1;
    flex: 1 1;
    border-top: 1px solid #ebebeb
}

.media-meta-day::after {
    margin-left: 16px
}

#chat-image{
width:100%;
height:100%;
}
.transferImage
{
	max-width:150px;
	max-height:225px;
}

#option{

display:none;
}

.form-group{
margin-top:2%;
	margin-left:2%;
	padding:0px;
}
#file_CC{
	margin:0px;
	padding:0px;
	position: relative;
	left:5%;
	top: 15px;
}
i{
font-size: 20px;
}
#transfer_btn{

width:100%;
height:100%;
}
#Nav_img{
	width:100%;
	height:100%;
}

#unread{

width:25px;
height: 25px;
font-size: 12px;
text-align: center;
line-height: 25px;
position: absolute;
left: 85%;
}
#chatdisplay{

	height:834px;
	display: none;

}
.users-container{
background-color:#FAFAFA;
overflow-y: scroll;
height:834px;
}


img{

width:60px;
height:60px;

}


</style>

<body oncontextmenu="return false" id =body>


<div class="container shadow p-3 mb-5 bg-body rounded" style ="z-index : 1; background-color:#FAFAFA; padding:10px">
    <!-- Page header start -->
    <div class="page-title">
        <div class="row gutters">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                <h5 class="title" id = "titlename">돈-다 Chat</h5>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12"> </div>
        </div>
    </div>
    <!-- Page header end -->

    <!-- Content wrapper start -->
    <div class="content-wrapper">

        <!-- Row start -->
        <div class="row gutters">

            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

                <div class="card m-0">

                    <!-- Row start -->
                    <div class="row no-gutters">
                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3">
                            <div class="users-container">
                                <ul class="RoomList">
                                 <!--    <li class="person" data-chat="person1">
                                        <div class="user">
                                            <img src="https://www.bootdey.com/img/Content/avatar/avatar3.png" alt="Retail Admin"> 프로필 사진 삽입
                                            <span class="status busy"></span> 상태 표시가 가능함!
                                        </div>
                                        <p class="name-time">
                                            <span class="name">Steve Bangalter</span> 네임
                                           <span class="time">05/02/2019</span>  날짜/ ETC 기입 가능. (이름 옆에 붙음) 
                                        </p>
                                    </li> -->
                                    <c:forEach var="item" items="${list }" varStatus="status">
		                                  <li class="person" data-chat="person1">
		                                       <div class="user" id = ${item.roomid }>
		                                       <div class="rounded-circle badge-danger" id="unread">
		                                       		${unread_count.getUnread_count(item.roomid,loginID)}
		                                       </div>
		                                       		<c:choose>
		                                       			<c:when test="${profile.get(status.index) != null}">
		                                       				<img class=rounded-circle src="data:image/png;base64,${profile.get(status.index)} " alt="Retail Admin"> 
		                                       			</c:when>
		                                       			<c:otherwise>
		                                       				<img class=rounded-circle src="/imgs/nomalProfile.jpg">
		                                       			</c:otherwise>
		                                       		</c:choose>
		                           
		                                            <span class="title">${item.sessions }</span> <!-- 상태 표시가 가능함!-->
		                                        </div>           
		                                   </li>
                                    </c:forEach>          
                                </ul>
                            </div>
                        </div>
                        
                        
    
                        
	         
	                       		<div class="col-9" id="waiting">
	                       			<div class=chatinfo>
		                       			<p>안녕하세요! <span id=titlename>돈-다 Chat</span> 입니다!</p>
		                       			<p> <i class="fas fa-arrow-left"></i> 왼쪽 채팅방 목록을 확인해주세요! <p>
	                       			</div>
	                       		
	                       		</div>
	                   
		                       	<div class="col-xl-9 col-lg-9 col-md-9 col-sm-9 col-9" id=chatdisplay>
		                       		<iframe src="" style="width:100%; height:100%;" id= chatFrame></iframe>
		                       	</div>

	                        
  
<%-- 	                        <div class="col-xl-8 col-lg-8 col-md-8 col-sm-9 col-9" id = drag_display>
                            <div class="selected-user">
                                <span>To: <span class="name">피기천사얌</span></span>
                            </div>
                            <div class="chat-container" id ="chat-container" >
                           	 	<input type=hidden id=testinput value = ${loginID }> <!--테스트용으로 만든 세션 아이디 확인 추후 세션 분기점 설정.-->
                                <ul class="chat-box chatContainerScroll">
                                	<c:forEach var="item" items="${pastMessage}">
                                		<div class="media media-meta-day">${item.key }</div>
		                                	 		<c:forEach var="pack" items="${item.value }">
		                                	 			<c:choose>
		                                	 				<c:when test="${pack['class'].name == 'kh.spring.dto.MessageDTO'}">
		                                	 					<c:choose>
				  													<c:when test="${pack.id != loginID}">
				  														<li class="chat-left">
									                                        <div class="chat-avatar">
									                                            <img src="https://www.bootdey.com/img/Content/avatar/avatar3.png" alt="Retail Admin">
									                                            <div class="chat-name">${pack.id }</div>
									                                        </div>
										                                       <div class="chat-text">${pack.message }</div> 
									                                        	<div class="chat-hour">${time.format(pack.reg_date) }</div>
									                                 
									                                    </li>
				  													</c:when>
				  													<c:otherwise>
				  														   <li class="chat-right">
										                                        <div class="chat-hour">${time.format(pack.reg_date) }</div>
										                                        <div class="chat-text">${pack.message }</div>
										                                        <div class="chat-avatar">
										                                            <img src="https://www.bootdey.com/img/Content/avatar/avatar3.png" alt="Retail Admin">
										                                            <div class="chat-name">${pack.id }</div>
										                                        </div>
									                                    	</li>
				  													</c:otherwise>
		  														</c:choose>	
		                                	 				</c:when>
		                                	 				
		                                	 				<c:otherwise>
		                                	 					<c:choose>
				  													<c:when test="${pack.id != loginID}">
				  														<li class="chat-left">
									                                        <div class="chat-avatar">
									                                            <img src="https://www.bootdey.com/img/Content/avatar/avatar3.png" alt="Retail Admin">
									                                            <div class="chat-name">${pack.id }</div>
									                                        </div>
									                                        <div class="chat-text">${pack.oriName }</div>
									                                        <div class="chat-hour">${time.format(pack.reg_date)}</div>
									                                    </li>
				  													</c:when>
				  													<c:otherwise>
				  														   <li class="chat-right">
										                                        <div class="chat-hour">${time.format(pack.reg_date) }</div>
										                                        <div class =option_picture>
										                                        	<div class = transferImage>
										                                        		<img src ="data:image/png;base64,${pack.sysName}" id = chat-image>
										                                        	</div>
										                                        	<div class=option id=option style = "text-align:center">
										                                        		<a href="/file/download?seq=${pack.seq }">다운로드</a>
										                                        	</div>
										                                        </div>
										                                        <div class="chat-avatar">
										                                            <img src="https://www.bootdey.com/img/Content/avatar/avatar3.png" alt="Retail Admin">
										                                            <div class="chat-name">${pack.id }</div>
										                                        </div>
									                                    	</li>
				  													</c:otherwise>
		  												</c:choose>				
		                                	 				
		                                	 				</c:otherwise>
		                                	 			</c:choose>	 
  													</c:forEach>
                                	</c:forEach>
                     
                                </ul>
                            </div>
                            	<div class ="preview_picture_box"></div>
                            	<div class =row>
                            		 <div class="form-group col-9" id= file_CC><i class="far fa-images" id=image_cc_btn></i></div>
                            		  <input type="file" name="file" id="file" style="display:none" multiple="multiple"/>	
	                                <div class="form-group col-9">
	                                    <textarea class="form-control" rows="3" placeholder="Type your message here..." id = "inputbox" ></textarea>
	                                </div>
	                                 <div class="form-group col-2">
	                                    <button class ="btn btn-outline-warning" type=button id = transfer_btn>Send</button>
	                                </div>
                                </div>
                        </div>
	                       	 --%>
                    </div>
                    <!-- Row end -->
                </div>

            </div>

        </div>
        <!-- Row end -->

    </div>
    <!-- Content wrapper end -->

</div>
    
</body>
</html>