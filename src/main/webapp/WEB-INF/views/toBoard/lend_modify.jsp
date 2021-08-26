<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="utf-8">
			<title>대여 하기</title>
			<meta content="width=device-width, initial-scale=1.0" name="viewport">
			<meta content="Free Website Template" name="keywords">
			<meta content="Free Website Template" name="description">

			<!-- Favicon -->
			<link href="img/favicon.ico" rel="icon">

			<!-- Google Font -->
			<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
				rel="stylesheet">

			<!-- CSS Libraries -->
			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">

			<!-- Template Stylesheet -->
			<link href="/css/style.css" rel="stylesheet">
			<style>
				/* 네비바 및 상단 고정 부분 */
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

				.subject {
					color: #1d2434;
					text-align: center;
					font-size: 40px;
					font-weight: 800;
				}

				.contents {
					margin-top: 5%;
					text-align: center;
					font-size: 25px;
					font-weight: bold;
				}

				.Main {
					margin-top: 5%;
				}

				/* 글쓰기 폼 */
				body {
					background-color: #f5f6f7;
				}

				#write {
					padding-top: 120px;
					padding-bottom: 30px;
				}

				.title {
					overflow: hidden;
					padding-top: 10px;
					padding-bottom: 10px;
					border-bottom: 1px solid #ddd;
				}

				.titel h3 {
					font-size: 2rem;
					text-align: center;
				}

				.wrapper {
					width: 100%;
					height: auto;
				}

				.form-control .input-group-text {
					color: #1d2434;
					font-weight: 800;
				}

				.input {
					margin-top: 20px;
				}

				#title_input {
					margin-top: 20px;
				}

				strong {
					color: red;
				}

				/* 이미지 파일 미리보기 */
				#preview {list-style-type: none; margin: 20px 0 0 0; padding: 0;}
			     #preview li {background-color: #fff; border: 1px solid #ccc; border-radius: 5px; float: left; margin: 20px 20px 0 0; width: 150px; height: 150px; line-height: 150px; position: relative;}
			     #preview li img.img-thumb {width: 100%; height: 100%;}
			     #preview .ui-selected {background: red;}
			     #preview .delete-btn {width: 13px; border: 0; position: absolute; top: -7px; right: -13px;}
        

				/* named upload */
				.filebox .upload-name {
					display: inline-block;
					padding: .5em .75em;
					/* label의 패딩값과 일치 */
					font-size: inherit;
					font-family: inherit;
					line-height: normal;
					vertical-align: middle;
					background-color: #f5f5f5;
					border: 1px solid #ebebeb;
					border-bottom-color: #e2e2e2;
					border-radius: .25em;
					-webkit-appearance: none;
					/* 네이티브 외형 감추기 */
					-moz-appearance: none;
					appearance: none;
				}


				#preview {
					width: 600px;
					margin-top: 20px;
				}

				#preview img {
					max-width: 200px;
					margin-right: 10px;
					margin-bottom: 10px;
				}
				
				.footer{
				margin:0}

			</style>
			<script>
			$(document).ready(function(){
				let address = "${myAd.address1}";
				let addressReg = /^[가-힣]*\s+[가-힣]*/g;
				let myaddress = address.match(addressReg);
				console.log(myaddress);
				if(myaddress != null){
					$("#Input3").removeAttr("readonly");
					$("#Input3").attr("value",myaddress);
					$("#Input3").attr("readonly",true);
				}
			})
			
			$(function() {
				$("#search").keyup(function(e) {
					if (e.keyCode == 13) {
						location.href = "/AllBoardList/lendList?choice=Allchoice&search="+$("#search").val()+"&cpage=1";
					}
				})
				
				$("#chat").on("click",function(){
					location.href = "/chat";
				})
			})

				function filesUpload() {
					console.log("fileupload");
					$("#file").trigger('click');
				}
				
				$(document).ready(function() {        
			           
		            var storedFiles = [];
		            var file = [];
		           
		            // 번호를 붙이는 함수
		            function cvf_reload_order() {
		                //order가 번호가 된다
		                //sortable("toArray", {attribute: 'item'}); 아이템속성읜 현재 순서를 배열로 가져온다
		                var order = $('#preview').sortable('toArray', {attribute: 'item'});
		                $('.custom-file-label').val(order);
		            }
		            //번호를 새로 생성하는 함수
		            //preview li에 있는 아이템의 수 만큼 번호를 생성한다
		            function cvf_add_order() {
		                $('#preview li').each(function(n) {
		                    $(this).attr('item', n);
		                    console.log(n);
		                });
		                // console.log(storedFiles);
		            }
		            let fileCount = 0;
		               //파일선택을 누르면 실행된다.    
		            $('body').on('change', '#file', function() {
		               //이미지 파일을 다 불러온다
		                var files = this.files;
		                var i = 0;
		                //불러온 파일 만큼 돌린다         
		                for (i = 0; i < files.length; i++) {
		                    var readImg = new FileReader();
		                    file = files[i];
		                    if (file.type.match('image.*')){
		                        //위에서 선언해준 storedFiles 배열에 이미지를 넣는다
		                        storedFiles.push(file);
		                        console.log(storedFiles.length);
		                        //onload는 문서가 전부 준비된 상황 이후에 발동하도록하는데
		                        //여기서 readImg = FileReader(); 이기 때문에 파일을 다 읽어오면 이미지를 어팬드시키도록한다
		                        readImg.onload = (function(file) {
		                            return function(e) {
		                                $('#preview').append(
		                                "<li file = '" + file.name + "'>" +                                
		                                    "<img class = 'img-thumb' src = '" + e.target.result + "' />" +
// 		                                    "<a href = '#' class = 'cvf_delete_image' title = 'Cancel'><img class = 'delete-btn' src = '/imgs/delete-btn.png' /></a>" +
		                                "</li>"
		                                ); 
		                                
		                                fileCount++
		                                $(".upload-hidden").attr("class","upen"+fileCount);
		                                $(".upen"+fileCount).attr("id","file"+fileCount);
		                                $(".upen"+fileCount).attr("onchange","");
		                                $(".upen"+fileCount).css("display","none");
		                                
		                                $(".custom-file").append("<input type='file' name='file' class='upload-hidden' id='file'  onchange='javascript:document.getElementById(\"fileName\").value = this.value'  multiple>")
		     	                       

		                            };
		                        })(file);
		                        //이미지파일을 URL로 읽어온다
		                        readImg.readAsDataURL(file);
		                       
		                    } else {
		                        alert('the file '+ file.name + ' is not an image<br/>');
		                        $("#fileName").val("");
		                        return;
		                    }
		                   //파일을 추가할때마다 실행해주는 테스트코드
		                   //1000미리세컨드로 준상태면 파일이 올라오자마자 이미지를 움직일경우 번호가 늘어나서 업로드할때 배열이 섞여버린다
		                    if(files.length === (i+1)){
		                        console.log("파일이 늘어남");
		                        setTimeout(function(){
		                            cvf_add_order();
		                        }, 100);
		                    }
		                }
		          	});
		           
		            // 이미지를 지우는 함수
		            $('body').on('click','a.cvf_delete_image',function(e){
		                e.preventDefault();
		                $(this).parent().remove('');       
		               
		                var file = $(this).parent().attr('file');
		                for(var i = 0; i < storedFiles.length; i++) {
		                    if(storedFiles[i].name == file) {
		                        storedFiles.splice(i, 1);
		                        break;
		                    }
		                }
		                $("#fileName").val("");
		                cvf_add_order();
		             });
									
		            let title = $("#title_input");
					let contents = $("#contents");
					let category = $("#category");
					let price = $("#price");


					$("#submitBtn").on("click", function () { //글 작성 전 제목 내용 입력여부 확인
						let priceReg = /^[0-9]/g;
						let resultprice = priceReg.test(price.val());

						if (title.val() == "") {
							alert("요청할 재능명을 입력해주세요.");
							title.focus();
							return false;

						} else if (category.val() == "0") {
							alert("카테고리를 선택해주세요.");
							category.focus();
							return false;

						} else if (price.val() == "") {
							alert("요청 가격을 입력해주세요.");
							price.focus();
							return false;

						} else if (contents.val() == "") {
							alert("세부내용을 입력해주세요.");
							contents.focus();
							return false;

						} else if (resultprice) {
							if (price.val() < 100) {
								alert("최소 가격은 100 상추입니다. 가격을 다시 입력해주세요.");
								price.val("");
								price.focus();
								return false;
							} else {
								$("#writeform").submit();

							}
						} else {
							alert("숫자만 입력해주세요.")
							price.val("");
							price.focus();
							return false;
							console.log(resultprice)
						}

					});
					
					$('body').on('click','a.delAttach',function(e){
						let seq = $(this).attr("seq");
						console.log("seq : " + seq);
						$(this).parent().remove();
						
						let html = "<input type='hidden' name='delSeq' value='"+seq+"'>";
						$("#preview").append(html);
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
							<a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
								class="fab fa-facebook-f"></i></a> <a href=""><i
								class="fab fa-instagram"></i></a>
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
                <a href="/" class="navbar-brand"><p id= titlename>돈-다</a></p>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <c:choose>
                	<c:when test="${loginID == null }">
                		<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    	<div class="navbar-nav ml-auto">
                        	<input class="form-control mr-sm-5" type="search" placeholder="물품, 지역을 검색해주세요." id =search aria-label="Search">
                        	<a href="/person/login" class="nav-item nav-link active">Login</a> <!-- Login Page 이동 -->
                        	<a href="/person/join" class="nav-item nav-link">Sign Up</a>  <!-- SignUp Page 이동 -->
                    	</div>
                		</div>
                	</c:when>
                	<c:otherwise>
                		<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    		<div class="navbar-nav ml-auto">
                        		<input class="form-control mr-sm-5" type="search" placeholder="물품, 지역을 검색해주세요." id =search aria-label="Search">
                        		<a href="/person/logout" class="nav-item nav-link active">Logout</a> <!-- Logout -->
                        		 <div class="collapse navbar-collapse" id="navbarNavDropdown">
	                        		 <ul class="navbar-nav">
	                        			<li class="nav-item dropdown">
									        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									         Menu
									        </a>
									        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									          <a class="dropdown-item" href="/AllBoardList/lendList?category=AllCategory&search=&cpage=1">Board</a>
									          <a class="dropdown-item" href="/sns/main">SNS</a>
									          <a class="dropdown-item" href="/my/mypageProc">My page</a>
									          <a class="dropdown-item" href="/point/ToCharging">Charging</a>
									        </div>
								      	</li>
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
			<section id="write">
				<div class="container">
					<form action="/lendBoard/ldModify" method="post" id="writeform" enctype="multipart/form-data">
						<div class="form-control wrapper ">
							<input type="hidden" value="${dto.seq}" name="seq">
							<div class="title">
								<h2>
									<b>대여 하기</b>
								</h2>

							</div>

							<div class="input-group mb-3 col-md-12 ">
								<label class="input-group-text input"
									for="inputGroupSelect02">대여 물품명<strong>＊</strong></label>
								<input type="text" class="form-control" id="title_input" name="title" value="${dto.title}"
									placeholder="대여할 물품을 입력하세요" required>
							</div>

							<div class="input-group mb-3 col-md-12">
								<label class="input-group-text" for="inputGroupSelect02">카테고리<strong>＊</strong></label>
								<select class="custom-select" id="category" name="category">
									<option value="${dto.category}" selected>${dto.category}</option>
									<option value="디지털/가전">디지털/가전</option>
									<option value="주방용품/가구">주방용품/가구</option>
									<option value="패션의류/악세사리">패션의류/악세사리</option>
									<option value="출산/유아">출산/유아</option>
									<option value="스포츠/레저">스포츠/레저</option>
									<option value="생활/건강">생활/건강</option>
									<option value="기타">기타</option>
								</select>
							</div>
							

							<div class="input-group mb-3 col-md-12">
								<h4>
									<b>이미지 미리 보기</b>
								</h4>
								<div class="input-group mb-3 col-md-12 " id="preview">
									<c:forEach var="f" items="${flist}">
										<li file="${f.oriName}">
											<img class = "img-thumb" src="/imgs/lend/${f.sysName}">
											<a href = '#' class ="delAttach" title ="Cancel" seq="${f.seq}">
												<img class = 'delete-btn' src = '/imgs/delete-btn.png' />
											</a>
										</li>
									</c:forEach>
								</div>

								<!-- onchange="javascript:document.getElementById('fileName').value = this.value" -->
								
									<div class="custom-file">
										<input type="file" name="file" class="upload-hidden" id="file"  onchange="javascript:document.getElementById('fileName').value = this.value"  multiple>
										<input type=text class="custom-file-label"  id="fileName" name="filename" style="width: 100%;" readonly>
																		</div>
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button" onclick="filesUpload();"class="uploadBtn">업로드</button>
									</div>
									<!-- </form> -->
								

							</div>

							
							<div class="input-group mb-3 col-md-12">
								<label class="input-group-text">거래 가격<strong>＊</strong></label>
								<!-- <input
							type="text" class="form-control" placeholder="가격 (ex: 100 상추/최소 금액은 100원)"
							id="price" name="price" required onkeypress="inNumber();" /> -->
								<input type="number" class="form-control" placeholder="(ex: 100 상추/최소 금액은 100 상추)"
									id="price" name="price" value="${dto.price}" required/>

							</div>

							<div class="input-group mb-3 col-md-12">
								<input type="text" class="form-control" id="Input3" name="address" readonly>
							</div>
							<div class="input-group mb-3 col-md-12">
								<textarea class="form-control" aria-label="With textarea" placeholder="세부 설명을 입력해주세요"
									rows="10" id="contents" name="contents" required>${dto.contents}</textarea>
							</div>
							<div class="btn_wrap text-right">
								<button type="button" class="btn btn-primary btn-lg" id="submitBtn">등록</button>
								<button type="button" id="cancel" onclick="history.back()" class="btn btn-secondary btn-lg">취소</button>

							</div>
						</div>
					</form>
				</div>

			</section>

			<!-- Footer Start -->
			<div class="footer">
				<div class="container">
					<div class="row">
						<div class="col-lg-6">
							<div class="row">
								<div class="col-12">
									<div class="footer-contact">
										<p>
											<i class="fa fa-map-marker-alt"></i>서울특별시 강남대로 123로
										</p>
										<p>
											<i class="fa fa-phone-alt"></i>02-123-4567
										</p>
										<p>
											<i class="fa fa-envelope"></i>DonDa@example.com
										</p>
										<div class="footer-social">
											<a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
													class="fab fa-facebook-f"></i></a> <a href=""><i
													class="fab fa-youtube"></i></a> <a href=""><i
													class="fab fa-instagram"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="row">
								<div class="col-6">
									<div class="footer-contact">
										<p>
											<i class="far fa-building"></i>회사소개
										</p>
										<p>
											<i class="far fa-user-circle"></i>채용
										</p>
									</div>
								</div>
								<div class="col-6">
									<div class="footer-contact">
										<p>
											<i class="fas fa-info"></i>이용약관
										</p>
										<p>
											<i class="far fa-id-badge"></i>개인정보처리방침
										</p>
										<p>
											<i class="fas fa-map-pin"></i>위치기반서비스 이용약관
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container copyright">
					<div class="row">
						<div class="col-12" style="text-align: center;">
							<p id=titlename>
								&copy; <a href="/">돈-다</a>, All Right Reserved.
							</p>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer End -->

			<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

			<!-- JavaScript Libraries -->
			<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
			<script src="/lib/easing/easing.min.js"></script>

			<!-- Template Javascript -->
			<script src="/js/main.js"></script>

		</body>

		</html>