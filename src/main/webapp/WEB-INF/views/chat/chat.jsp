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


<style>
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

#unread{

width:25px;
height: 25px;
font-size: 12px;
text-align: center;
line-height: 25px;
position: absolute;
left: 85%;
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
.content-wrapper{
background-color: #FAFAFA;
}

</style>

<script>
function doNotReload(){
    if(    (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82))
        || (event.keyCode == 116) )
    {
      event.keyCode = 0;
      event.cancelBubble = true;
      event.returnValue = false;
 alert("새로고침");
    }
}
document.onkeydown = doNotReload;
/* http://175.116.7.99/ */
let ws = new WebSocket("ws://192.168.35.97/chat"); 
$(function(){
	
	let loginID;
	let time;
	let isfile;
	let sendfiles;
	let location_count=0;
	let drag_uploadfiles=[];
	let input_uploadfiles=[];
	ws.onmessage = function(event){
			
		let text = JSON.parse(event.data);
		
		console.log(text.createroom);
		
		if(text.isCheck != "true"){
			
			if(text.unreadcount != null){
				window.parent.postMessage(text.unreadcount+
						":"+text.roomid,'http://192.168.35.97/chat/waitingroom');
			}
			
			if(text.isNaver == "true"){
				let hashimage = JSON.parse(text.HashImage);
				let hashblog = JSON.parse(text.HashBlog);
				console.log(hashimage);
				console.log(hashblog);
				
				let div = $("<div class= card style=\"width: 18rem;\">");
				let div_body = $("<div class= card-body>");
				
				let card_title = $("<h5 class =card-title>")
				card_title.text("#"+text.search)
				
				let div_body_img = $("<div class= card-subtitle>");
				let img = $("<img id=Nav_img>")
				img.attr("src",hashimage.items[0].thumbnail);
				div_body_img.append(img);
				
				let p_text_one = $("<p class = card-text>")
				let search_blog_1 = $("<a class = card-link target=_blank>"); 
				search_blog_1.text("# "+hashblog.items[1].title.replace(/<\/b>/gi," ").replace(/<b>/gi," "));
				search_blog_1.attr("href",hashblog.items[1].link)
				p_text_one.append(search_blog_1)
				
				let p_text_two = $("<p class = card-text>")
				let search_blog_2 = $("<a class = card-link target=_blank>"); 
				search_blog_2.text("# "+hashblog.items[2].title.replace(/<\/b>/gi," ").replace(/<b>/gi," "));
				search_blog_2.attr("href",hashblog.items[2].link)
				p_text_two.append(search_blog_2)
				
				
				let p_text_three = $("<p class = card-text>")
				let search_blog_3 = $("<a class = card-link target=_blank>"); 
				search_blog_3.text("# "+hashblog.items[3].title.replace(/<\/b>/gi," ").replace(/<b>/gi," "));
				search_blog_3.attr("href",hashblog.items[3].link)
				p_text_three.append(search_blog_3)
				
				let searchmore = $("<button type=button class=\"btn btn-outline-success\">")
				searchmore.text("검색 결과 더보기")
				searchmore.css("width","100%")
				let searchmore_link = $("<a target=_blank>")
				searchmore_link.attr("href","https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query="+text.search);
				searchmore_link.append(searchmore);
				
				div_body.append(card_title)
				div_body.append(div_body_img)
				div_body.append(p_text_one)
				div_body.append(p_text_two)
				div_body.append(p_text_three)
				
				
				div.append(div_body)
				div.append(searchmore_link)
				
				let chat_container_li = $("<li>");
				let chat_avatar= $("<div class=chat-avatar>");
				
				let chat_avatar_name= $("<div class=chat-name>"); 
				let chat_avatar_img = $("<img>"); 
				let chat_text = $("<div class =chat-text>");
				let chat_hour = $("<div class =chat-hour>");
			
				chat_hour.text(text.trans_time);
				chat_text.text(text.message);
				chat_avatar_name.text(text.loginID);
				console.log(text.profile_image+"이건 뭘까.");
				if(text.profile_image != null){
					chat_avatar_img.attr("src","data:image/png;base64,"+text.profile_image);
				}else{
					chat_avatar_img.attr("src","/imgs/nomalProfile.jpg")
				}
				
				chat_avatar.append(chat_avatar_img);
				chat_avatar.append(chat_avatar_name);
				
				let chat_text_add = $("<div class=chat-text box>");
				chat_text_add.append(chat_text)
				chat_text_add.append(div)
				if($("#testinput").val() ==text.loginID ){
					chat_container_li.attr("class","chat-right");
					chat_container_li.append(chat_hour);
					/* chat_container_li.append(chat_text);
					chat_container_li.append(div); */
					chat_container_li.append(chat_text_add);
					chat_container_li.append(chat_avatar);
				}else{
					chat_container_li.attr("class","chat-left");					
					chat_container_li.append(chat_avatar);
					chat_container_li.append(chat_text_add);
					chat_container_li.append(chat_hour);
				}
				$(".chat-box").append(chat_container_li);
			}
			else if(text.isLocation == "true"){
				
				let location_search = text.search;
				
				let div = $("<div class= card style=\"width: 18rem;\">");
				let div_body = $("<div class= card-body>");
				
				let card_title = $("<h5 class =card-title>")
				card_title.text("@"+text.search)
				
				let div_loca_body = $("<div class=card-subtitle>");
				let div_map = $("<div id=map"+location_count+"  style=\"width:100%;height:350px;\">")
				
				div_loca_body.append(div_map);
				
				let p_text= $("<p class = card-text>")
				let location_a = $("<a target=_blank, id=location_link>");
				let location_btn = $("<button type =button class=\"btn btn-outline-success\">")
				location_btn.css("width","100%")
				location_btn.text("길찾기");
				location_a.append(location_btn);
				p_text.append(location_a);
				
				
			
				div.append(card_title)
				div.append(div_loca_body)
				div.append(p_text)
				
				let chat_container_li = $("<li>");
				let chat_avatar= $("<div class=chat-avatar>");
				
				let chat_avatar_name= $("<div class=chat-name>"); 
				let chat_avatar_img = $("<img>"); 
				let chat_text = $("<div class =chat-text>");
				let chat_hour = $("<div class =chat-hour>");
			
				chat_hour.text(text.trans_time);
				chat_text.text(text.message);
				chat_text.css({"text-decoration": "underline", 
								"text-underline-position":"under" ,
								"color":"dodgerblue",
								"font-weight":"bolder"});
				chat_avatar_name.text(text.loginID);
				if(text.profile_image != null){
					chat_avatar_img.attr("src","data:image/png;base64,"+text.profile_image);
				}else{
					chat_avatar_img.attr("src","/imgs/nomalProfile.jpg")
				}
				
				chat_avatar.append(chat_avatar_img);
				chat_avatar.append(chat_avatar_name);
				
				let chat_text_add = $("<div class=chat-text box>");
				chat_text_add.append(chat_text)
				chat_text_add.append(div)
				if($("#testinput").val() ==text.loginID ){
					chat_container_li.attr("class","chat-right");
					chat_container_li.append(chat_hour);
					/* chat_container_li.append(chat_text);
					chat_container_li.append(div); */
					chat_container_li.append(chat_text_add);
					chat_container_li.append(chat_avatar);
				}else{
					chat_container_li.attr("class","chat-left");					
					chat_container_li.append(chat_avatar);
					chat_container_li.append(chat_text_add);
					chat_container_li.append(chat_hour);
				}
				
				$(".chat-box").append(chat_container_li);
				
				
				var mapContainer =document.getElementById('map'+location_count);
				mapOption = {
				         center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				         level: 3 // 지도의 확대 레벨
				     };  
				
					 // 지도를 생성합니다    
					 var map = new kakao.maps.Map(mapContainer, mapOption); 
					 map.setZoomable(false);
					// 장소 검색 객체를 생성합니다
					 var ps = new kakao.maps.services.Places(); 
					 
					// 키워드로 장소를 검색합니다
					 ps.keywordSearch(location_search,placesSearchCB)
					 
					 
					 function placesSearchCB (data, status, pagination) {
						    if (status === kakao.maps.services.Status.OK) {

						        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						        // LatLngBounds 객체에 좌표를 추가합니다
						        var bounds = new kakao.maps.LatLngBounds();
						        
						        displayMarker(data[0]);    
						        bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
						     
						        location_a.attr("href","https://map.kakao.com/link/to/"+location_search+","+data[0].y+","+data[0].x)
				   

						        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
						        map.setCenter(new kakao.maps.LatLng(data[0].y, data[0].x));
						    } 
						}
					 
					 function displayMarker(place) {
						 
						  var marker = new kakao.maps.Marker({
						        map: map,
						        position: new kakao.maps.LatLng(place.y, place.x) 
						    });
						  
						  var infowindow = new kakao.maps.InfoWindow({
					             content: '<div style="width:150px;text-align:center;padding:6px 0;">'+location_search+'</div>'
					         });
						  
						  infowindow.open(map, marker)
					 }
					 
					 location_count++;
				
			}else{
					let chat_container_li = $("<li>");
					let chat_avatar= $("<div class=chat-avatar>");
					
					let chat_avatar_name= $("<div class=chat-name>"); 
					let chat_avatar_img = $("<img>"); 
					let chat_text = $("<div class =chat-text>");
					let chat_hour = $("<div class =chat-hour>");
				
					chat_hour.text(text.trans_time);
					chat_text.text(text.message);
					chat_avatar_name.text(text.loginID);
					if(text.profile_image != null){
						chat_avatar_img.attr("src","data:image/png;base64,"+text.profile_image);
					}else{
						chat_avatar_img.attr("src","/imgs/nomalProfile.jpg")
					}
					
					chat_avatar.append(chat_avatar_img);
					chat_avatar.append(chat_avatar_name);
					
					if($("#testinput").val() ==text.loginID ){
						chat_container_li.attr("class","chat-right");
						chat_container_li.append(chat_hour);
						chat_container_li.append(chat_text);
						chat_container_li.append(chat_avatar);
					}else{
						chat_container_li.attr("class","chat-left");					
						chat_container_li.append(chat_avatar);
						chat_container_li.append(chat_text);
						chat_container_li.append(chat_hour);
						
					}
					
					$(".chat-box").append(chat_container_li);
			}
		}else{
			console.log(sendfiles.length);
		
		
           		let chat_container_li = $("<li>");
        		let chat_avatar= $("<div class=chat-avatar>");
        		
        		let chat_avatar_name= $("<div class=chat-name>"); 
        		let option_picture = $("<div class =option_picture >");
        		let option = $("<div class=option id=option>");
        		let download = $("<a>");
        		download.attr("href","/file/download?seq="+text.seq);
        		download.text("다운로드");
        		option.append(download);
        		
        		let chat_avatar_img = $("<img>"); 
        		let chat_div_img= $("<div class =transferImage>");
        		let chat_img= $("<img src=data:image/jpeg;base64,"+text.message+">");
        		chat_img.attr("id","chat-image");
        	
        		
        		chat_div_img.append(chat_img);
        		option_picture.append(chat_div_img);
        		option_picture.append(option);
        		
        		let chat_hour = $("<div class =chat-hour>");
        		
        		chat_hour.text(text.trans_time);
        		
        		chat_avatar_name.text(text.loginID);
        		if(text.profile_image != null){
					chat_avatar_img.attr("src","data:image/png;base64,"+text.profile_image);
				}else{
					chat_avatar_img.attr("src","/imgs/nomalProfile.jpg")
				}
        		
        		chat_avatar.append(chat_avatar_img);
        		chat_avatar.append(chat_avatar_name);
        		
        		if($("#testinput").val()==text.loginID ){
        			chat_container_li.attr("class","chat-right");
        			chat_container_li.append(chat_hour);
        			chat_container_li.append(option_picture);
        			chat_container_li.append(chat_avatar);
        		}else{
        			chat_container_li.attr("class","chat-left");					
        			chat_container_li.append(chat_avatar);
        			chat_container_li.append(option_picture);
        			chat_container_li.append(chat_hour);
        			
        		}
        		
        		$(".chat-box").append(chat_container_li);
        		drag_uploadfiles=[];
           		input_uploadfiles=[];
       		

		} 
		updateScroll();
	}
	
	function updateScroll(){
		var element = document.getElementById("chat-container");
		element.scrollTop = element.scrollHeight+400;
	}
	
/* 	$("#send").on("click", function(){
		ws.send($("#message").val()); 
		$("#message").val(" ");
		
	}) */
		
		
		//드래그앤드랍
		$("#chat-container").on("dragenter", function(e){
		    e.preventDefault();
		    e.stopPropagation();
		    console.log("드래그 엔터")
		}).on("dragover", function(e){
		    e.preventDefault();
		    e.stopPropagation();
		    console.log("드래그 오버")
		    $(this).css("background-color", "#BDBDBD");
		}).on("dragleave", function(e){
		    e.preventDefault();
		    e.stopPropagation();
		    console.log("드래그 떠남")
		    $(this).css("background-color", "#FAFAFA");
		}).on("drop", function(e){
			 $(this).css("background-color", "#FAFAFA");
		    e.preventDefault();
		    console.log("드랍")
		    var files = e.originalEvent.dataTransfer.files;
		    var before_index = drag_uploadfiles.length;
		    console.log("인덱스 저장."+before_index);
		    console.log(files);
		    for(let i =0; i<files.length; i++){
		    	drag_uploadfiles.push(files[i]);
		    }
		    for(let i =before_index; i<drag_uploadfiles.length; i++){
		        preview(drag_uploadfiles[i],i,"drag");
		    }
		});
		
		$("#save").on("click", function(){
			drag_uploadfiles = drag_uploadfiles.filter(function(item){
				  return item !== null && item !== undefined && item !== '';
			});
			input_uploadfiles = input_uploadfiles.filter(function(item){
				  return item !== null && item !== undefined && item !== '';
			});
			
			var sumFile = drag_uploadfiles.concat(input_uploadfiles);
			
		    F_FileMultiUpload(sumFile);
		})

		$(document).on("click",".preview_close" ,function(){
			let delete_index=console.log($(this).attr("data-idx"));
			if($(this).attr("data-cate") == "drag"){
				//drag_uploadfiles = drag_uploadfiles.slice(delete_index,1);
				drag_uploadfiles[$(this).attr("data-idx")] = null;
				console.log(drag_uploadfiles);
			}else{
				//input_uploadfiles = input_uploadfiles.slice(delete_index,1);
				input_uploadfiles[$(this).attr("data-idx")] = null;
			}
			
			$(this).closest(".preview_picture").remove();
			
		})
		
		/* $("#input_files").on("change", function(){
			let input_files= $(this)[0].files; 
			var before_index = input_uploadfiles.length;
			for(let i =0; i<input_files.length; i++){
				input_uploadfiles.push(input_files[i]);
			}
			for(let i =before_index; i<input_uploadfiles.length; i++){
		        preview(input_uploadfiles[i],i,"input");
		    }
		
		}) */
		

	function preview(file, idx, category) {
		var reader = new FileReader();
		reader.onload = (function(f, idx) {
		return function(e) {
	/* 	var div = '<div class="thumb"> \
		<div class="close" data-idx="' + idx + '">X</div> \
		<img src="' + e.target.result + '" title="' + escape(f.name) + '"/> \
		</div>'; */
		let preview_div = $("<div class =preview_picture>");
		//let preview_close = $("<div class =preview_close data-idx="+idx+" data-cate="+category+">");
		let preview_close = $("<button type=button class='close preview_close' aria-label=Close data-idx="+idx+" data-cate="+category+">")
		preview_close.text("x");
		let preview_img = $("<img>"); 
		preview_img.attr("src",e.target.result)
		preview_img.attr("name", escape(f.name));
		
		preview_div.append(preview_close);
		preview_div.append(preview_img);
		
		
		$(".preview_picture_box").append(preview_div);
		
		};
		})(file, idx ,category);
		
		reader.readAsDataURL(file);
	}
		
		function imgSend(files){
			for(let i=0; i<files.length; i++){
				reader.onload = function(e){
	    			console.log(e.target.result);
	    		}
			}
		} 
		
		
		
		function F_FileMultiUpload(files, obj) {
		      
		    	/*  ws.binaryType="arraybuffer";
		    	 var reader = new FileReader();
		    	 var rawData = new ArrayBuffer();
		    	 for(let i =0; i< files.length; i++){
		    	     reader.onload = function(e){ 
		    		 rawData = e.target.result;
		    		 ws.send(rawData);
		    		}
		    	} */
		    	var formData = new FormData();
		         for (var i = 0; i < files.length; i++) {
		         	formData.append("file",files[i]);
		         }
	
		    $.ajax({
		            url: "/file/upload",
		            enctype: 'multipart/form-data',
		            method: 'post',
		            data: formData,
		            dataType: 'TEXT',
		            processData: false,
		            contentType: false,
		            success: function(res) {
		            	 sendfiles = files;
		            	 if(files.length > 0){
		      	 		   for(let i=0; i<files.length; i++){
		      	 			  var reader = new FileReader();
		      	 		 	  reader.onload= function(e){
		      	 			  ws.send(e.target.result);
		      	        	  }
		      	 			 reader.readAsArrayBuffer(files[i]); 
		      	 			 /*   (function(file) {
		      	 		            var reader = new FileReader();
		      	 		            reader.onload = (e) => {
		      	 		            	ws.send(e.target.result);
		      	 		            }
		      	 		            reader.readAsArrayBuffer(file)
		      	 		          })(sumFile[i]); */
		      	 		   }
		      	 	
		      		    }
		            	
		            	drag_uploadfiles=[];
		           		input_uploadfiles=[];
		           		let success_file_list = $(".preview_picture");
		           		console.log(success_file_list);
		           		for(let i =0;i<success_file_list.length; i++){
		           			$(success_file_list[i]).remove();
		           		}
		       
		            }
		         }); 
		         
		         
		     }
		$("#transfer_btn").on("click", function(){
			drag_uploadfiles = drag_uploadfiles.filter(function(item){
				  return item !== null && item !== undefined && item !== '';
			});
			input_uploadfiles = input_uploadfiles.filter(function(item){
				  return item !== null && item !== undefined && item !== '';
			});	
			var sumFile = drag_uploadfiles.concat(input_uploadfiles);
			console.log("버튼 클릭 할때"+sumFile.length);
			F_FileMultiUpload(sumFile);
		})
		
		$("#inputbox").on("keyup",function(e){
	 		 if(e.keyCode === 13){
	        	 drag_uploadfiles = drag_uploadfiles.filter(function(item){
					  return item !== null && item !== undefined && item !== '';
	 			});
	 			input_uploadfiles = input_uploadfiles.filter(function(item){
	 				  return item !== null && item !== undefined && item !== '';
	 			});	
	 			var sumFile = drag_uploadfiles.concat(input_uploadfiles);
	 			/*  var reader = new FileReader(); */
	 		/*     if(sumFile.length > 0){
		 		   for(let i=0; i<sumFile.length; i++){
		 			  reader.onload = function(e){
		 			  ws.send(e.target.result);
		        	  }
		 			reader.readAsDataURL(sumFile[i]);
		 		   } */
		 		  console.log("엔터 클릭"+sumFile.length);
		 		  F_FileMultiUpload(sumFile);
		 		
	 		   //}
	 			
	 			let naver = /(#\S*)/gi;
	 			if(naver.test($("#inputbox").val())){
	 				console.log(naver.test($("#inputbox").val()));
	 				$($("#inputbox").val()).css("color","green");
	 			}else{
	 				$("#inputbox").css("color","black");
	 			}
	 		   if(!$("#inputbox").val().replace(/(^\s*)|(\s*$)/gi, " ")){
	 			   	console.log("공백입니다.");
	 			}else{
	 		    	ws.send($("#inputbox").val());
	            	$("#inputbox").val("");
	         	}
	 		 }
		})
		
		
		$(document).on("mouseover",".option_picture",function(){
			$(this).children("#option").css("display","block")
		})
		$(document).on("mouseleave",".option_picture",function(){
			$(this).children("#option").css("display","none")
		})
		
		$("#image_cc_btn").on("click", function(){
			
			$("#file").click();
			$("#file").on("change",function(){
				let input_files= $(this)[0].files; 
				console.log(input_files);
				var before_index = input_uploadfiles.length;
				for(let i =0; i<input_files.length; i++){
					input_uploadfiles.push(input_files[i]);
				}
				for(let i =before_index; i<input_uploadfiles.length; i++){
			        preview(input_uploadfiles[i],i,"input");
			    }
				
				$("#file").val("");
				
			})
		})

})

</script>
<body oncontextmenu="return false">

<input type="hidden" id=roomid value = ${roomid }>
<%-- <div class="container">
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
                        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-3 col-3">
                            <div class="users-container">
                                <div class="chat-search-box">
                                    <div class="input-group">
                                        <input class="form-control" placeholder="Search">
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-info">
                                                <i class="fa fa-search"></i>  <!--검색-->
                                            </button>
                                        </div>
                                    </div>
                                </div>
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
                                    <c:forEach var="item" items="${list }">
		                                  <li class="person" data-chat="person1">
		                                       <div class="user" id =${item.roomid } >
		                                       	   <div class="rounded-circle badge-danger" id="unread"></div>
		                                           <img src="https://www.bootdey.com/img/Content/avatar/avatar3.png" alt="Retail Admin"> <!-- 판매라는 이미지 십입-->
		                                        </div>
		                                        <p class="name-time">
		                                           <span class="title"><a href = "/chat?roomid=${item.roomid }" >${item.title }</a></span>
		                                        </p>
		                                   </li>
                                    </c:forEach>
                                    
                                </ul>
                            </div>
                        </div>
                        
                        
                        <c:choose>
                        
	                       	<c:when test="${waiting ==true }">
	                       		<div class="col-xl-8 col-lg-8 col-md-8 col-sm-9 col-9" id="waiting">
	                       			<div class=chatinfo>
		                       			<p>안녕하세요! <span id=titlename>돈-다 Chat</span> 입니다!</p>
		                       			<p> <i class="fas fa-arrow-left"></i> 왼쪽 채팅방 목록을 확인해주세요! <p>
	                       			</div>
	                       		
	                       		</div>
	                       	
	                       	</c:when>
                       	
	                       	<c:otherwise> --%>
	                       	
	       
	                   <div class="content-wrapper">
	                      <div class="col-12" id = drag_display>
                            <div class="selected-user">
                                <div class="media">
								  <img src="..." class="align-self-center mr-3" alt="..."> <!-- 이미지 출력 -->
								  <div class="media-body">
								    <a><h5 class="mt-0">타이틀 제목 출력</h5></a>
								    <p>가격 출력<p>
								  </div>
								</div>
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
									                                        	<c:choose>
									                                        		<c:when test="${friend_profile_img != null}">
									                                        			<img src="data:image/png;base64,${friend_profile_img}" alt="Retail Admin">
									                                        		</c:when>
									                                        		
									                                        		<c:otherwise>
									                                        			<img src="/imgs/nomalProfile.jpg">
									                                        		</c:otherwise>
									                                        	</c:choose>
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
										                                            <c:choose>
									                                        		<c:when test="${profile_img != null}">
									                                        			<img src="data:image/png;base64,${profile_img}" alt="Retail Admin">
									                                        		</c:when>
									                                        		
									                                        		<c:otherwise>
									                                        			<img src="/imgs/nomalProfile.jpg">
									                                        		</c:otherwise>
									                                        	</c:choose>
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
									                                           <c:choose>
									                                        		<c:when test="${friend_profile_img != null}">
									                                        			<img src="data:image/png;base64,${friend_profile_img}" alt="Retail Admin">
									                                        		</c:when>
									                                        		<c:otherwise>
									                                        			<img src="/imgs/nomalProfile.jpg">
									                                        		</c:otherwise>
									                                        	</c:choose>
									                                            <div class="chat-name">${pack.id }</div>
									                                        </div>
									                                        <div class =option_picture>
										                                        	<div class = transferImage>
										                                        		<img src ="data:image/png;base64,${pack.sysName}" id = chat-image>
										                                        	</div>
										                                        	<div class=option id=option style = "text-align:center">
										                                        		<a href="/file/download?seq=${pack.seq }">다운로드</a>
										                                        	</div>
										                                        </div>
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
										                                          <c:choose>
									                                        		<c:when test="${profile_img != null}">
									                                        			<img src="data:image/png;base64,${profile_img}" alt="Retail Admin">
									                                        		</c:when>
									                                        		
									                                        		<c:otherwise>
									                                        			<img src="/imgs/nomalProfile.jpg">
									                                        		</c:otherwise>
									                                        	</c:choose>
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
	                       	
     </div>
                    <!-- Row end -->
                 

     
        <!-- Row end -->

   
    <!-- Content wrapper end -->


    
</body>
</html>