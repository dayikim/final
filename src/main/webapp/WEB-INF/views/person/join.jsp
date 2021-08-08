<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<script>
	$(function(){
		let count = 0;
		
		$('#sendphoneNumber').click(function(){
			count ++;
			let phoneNumberRegex = /^010\d{3,4}\d{4}$/;
			let phoneNumber = phoneNumberRegex.test($("#phone").val());
			if($("#phone").val() == ""){
        		alert("핸드폰번호 입력후 진행해주세요.");
        	}else{
        		if(phoneNumber){
    				let phone = $('#phone').val();
    	            alert('인증번호 발송 완료!')

    	            $.ajax({
    	                type: "GET",
    	                url: "/person/send",
    	                data: {"phone" : phone},
    	                success: function(res){
    	                    $('#checkBtn').click(function(){
    	                    	if($("#inputCertifiedNumber").val()==""){
    	                    		alert("인증번호를 입력해주세요.")
    	                    	}else{
    	                    		if($.trim(res) ==$('#inputCertifiedNumber').val()){
        	                            alert(
        	                                '인증성공!',
        	                                '휴대폰 인증이 정상적으로 완료되었습니다.',
        	                                'success'
        	                            )
        	                        }else{
        	                            alert('인증번호를 다시 확인해주세요')
        	                            $('#inputCertifiedNumber').val("");
        	                        }
    	                    	}
    	                    })
    	                }
    	            })
    			}else{
    				alert("핸드폰 형식을 확인 후 다시 인증을 시도해주세요.")
    				$("#phone").val("");
    			}
        	}
        });
		
		$("#id").blur(function(){
			let idRegex = /^[a-z]+[a-z0-9]{5,19}$/g;
			let id = idRegex.test($("#id").val());
			if(id){
				$.ajax({
					url:"/person/duplCheck",
					data:{id:$("#id").val()}
				}).done(function(resp){
					if(resp=="1"){
						$("#idcheck").css("color","red");
						$('#idcheck').text("이미사용중인 아이디입니다.");
					}else{
						$("#idcheck").css("color","blue");
						$('#idcheck').text("사용가능한 아이디입니다.");
					}
				})
			}else{
				$("#idcheck").css("color","red");
				$("#idcheck").text("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			}
		})
		
		$("#pw").blur(function(){
			let pwRegex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[~!@#$%*\(\)^&+=\-_?]).*$/g;
			let pw = pwRegex.test($("#pw").val());
			if(pw){
				$("#regexPw").css("color","blue");
				$("#regexPw").text("사용가능한 비밀번호입니다.");
			}else{
				$("#regexPw").css("color","red");
				$("#regexPw").text("8~15자리 영문 소문자, 숫자, 특수문자를 사용하세요.");
			}
		})
		
		$("#ch").blur(function(){
			let pw = $("#pw").val();
			let ch = $("#ch").val();
			if(pw != ch){
				$("#val").css("color","red");
				$("#val").text("비밀번호가 일치하지 않습니다.");
			}else{
				$("#val").css("color","blue");
				$("#val").text("비밀번호가 일치합니다.");
			}
		})
		let isYear = false; 
		let isMonth = false; 
		let isDay = false; 
		
		
		/* $("#signup-birth-yy").on("blur",function(){
			let yearRegex = /[0-9]{4}/g;
			let year = yearRegex.test($("#signup-birth-yy").val());
			if(year){
				if($("#signup-birth-yy").val() < 1920){
					$("#birthday").css("color","red");
					$("#birthday").text("정말이세요?");
				}else if($("#signup-birth-yy").val() > 2021){
					$("#birthday").css("color","red");
					$("#birthday").text("미래에서 오셨군요!");
				}else{
					isYear = true; 
				}
			}else{
				$("#birthday").css("color","red");
				$("#birthday").text("태어난 년도 4자리를 정확하게 입력하세요.");
			}			
		}) 
			
		$("#signup-birth-mm").on("blur",function(){
			console.log($("#signup-birth-mm").val())
			if($("#signup-birth-mm").val() == "month"){
				$("#birthday").css("color","red");
				$("#birthday").text("태어난 월을 선택하세요.");
			}else{
				isMonth =true; 
			}
		})
		
		$("#signup-birth-dd").on("blur",function(){
			if( $("#signup-birth-dd").val()<1 || $("#signup-birth-dd").val()>31) {
				$("#birthday").css("display","block");
				$("#birthday").css("color","red");
				$("#birthday").text("날짜를 잘못 입력하셨네요!");
		    }else{
		    	isDay = true;
		    }
		}) */
		
		 $(".birth").on("change", function(){
	          for(let i=0; i<$(".birth").length; i++){
	            if($($(".birth")[i]).val() != null){
	            	var birth_day = $("#signup-birth-dd").val();
	            	if(birth_day.length == 1){
	            		birth_day = "0"+birth_day;
	            	}
	                $("#birth").val($("#signup-birth-yy").val()+$("#signup-birth-mm").val()+birth_day);
	            }
	          }
	        })
	        
	        $(".birth").on("blur", function(){
	        	 for(let i=0; i<$(".birth").length; i++){
	        		 if($($(".birth")[i]).val() != null){
	        			 $("#birthday").css("display","block");
	        			 if($("#signup-birth-yy").val() < 1920){
	        				 isYear = false; 
	     					$("#birthday").css("color","red");
	     					$("#birthday").text("정말이세요?");
	     				}else if($("#signup-birth-yy").val() > 2021){
	     					isYear = false;
	     					$("#birthday").css("color","red");
	     					$("#birthday").text("미래에서 오셨군요!");
	     				}else{
	     					 isYear = true; 
	     				}
	        			 if( $("#signup-birth-dd").val()<1 || $("#signup-birth-dd").val()>31) {
	        				 	isDay =false;
	        					$("#birthday").css("color","red");
	        					$("#birthday").text("날짜를 잘못 입력하셨네요!");
	        			    }else{
	        			    	isDay = true;
	        			    }
	        			 if($("#signup-birth-mm").val() == "month"){
	        					 isMonth =false; 
	        					$("#birthday").css("color","red");
	        					$("#birthday").text("태어난 월을 선택하세요.");
	        	 			}else{
	        					isMonth =true; 
	        				}
	        			 if(isYear && isMonth && isDay){
	        				 $("#birthday").css("display","none");
	        				 console.log("여기 들어오면 안됌")
	        			 }
	        	 }
	        	 }
	        })
		
		document.getElementById("search").onclick = function() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var roadAddr = data.roadAddress;

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address1").value = roadAddr;               
                }
            }).open();
        }
		
		$("#signup-btn").on("click",function(){
			if($("#id").val() == "" || $("#pw").val() == "" || $("#ch").val() == "" || $("#name").val() == "" || $("#signup-birth-yy").val() =="" || $("#signup-birth-dd").val() =="" || $("#signup-birth-mm").val() ==""
					|| $("#email").val() == "" || $("#phone").val() == "" || $("#inputCertifiedNumber").val()=="" || $("#postcode").val() == "" || $("#address1").val() == ""){
				alert("입력하지 않은 항목이 있는지 확인해주세요.")
				return false;
			}
			let color = $(".next_box").css("color");
			if(color == "rgb(255, 0, 0)"){
				alert("가입시 형식에 맞게 기입하셨는지 확인해주세요.");
				return false;
			}
			/*if(count <= 0){
				alert("핸드폰인증을 진행해주세요.")
				return false;
			}*/
		})
		 
	})
</script>
<style>
body{
    background-color: #f5f6f7;
}
select{
    width:85px;
    height:25px;
    outline: none;
    background: #f5f6f7;
    border: 1px solid #999;
}


/*회원가입 부분*/
.main-signup{
    text-align: center;
    width: 460px;
    margin: auto;
}
h3{
    margin:19px 0px 8px;
    text-align: left;
    font-size: 14px;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
.signup-input{
    display:flex;
    /* margin: 0px 10px 8px 10px; */
    padding: 10px;
    border: solid 1px #dadada;
    background: #fff;
    cursor: pointer;
}

#id, #pw, #ch{
    height: 29px;
    border: none;
    outline:none;
    width:100%;
}

.signup-input-birth{
    display: block;
    position: relative;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px;
    background: #fff;
    box-sizing: border-box;
}
#signup-birth-yy, #signup-birth-mm, #signup-birth-dd{
    width: 113px;
    height: 29px;
    border: none;
    outline:none;
}
#name, #signup-email, #phone, #inputCertifiedNumber, #postcode, #address1, #address2{
    width:100%;
    height: 29px;
    border: none;
    outline:none;
}

#signup-birth-mm{
    background-color: white;
}
/*본인 확인 이메일*/
.choice{
    display: flex;
}
.choice span{
    margin-top: 20px;
    color: rgb(150, 150, 150);
    font-size: 13px;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
/*회원가입버튼박스*/
.signup-btn-wrap{
    height: 58px;
    line-height: 55px;
    margin: 10px 0px 50px 0px;
    border: solid 1px rgba(0,0,0,.1);
    background-color: #334257;
    color: #fff;
    cursor: pointer;
}
/*회원가입버튼*/
#signup-btn{
    width:100px;
    background-color: #334257;
    border: none;
    color:#fff;
    font-size: 18px;
    outline:none;
    cursor: pointer;
}
/*인증번호버튼박스*/
.cnum-btn-wrap{
    height: 52px;
    line-height: 48px;
    margin: 10px 0px 0px 10px;
    border: solid 1px rgba(0,0,0,.1);
    background-color: #334257;
    color: #fff;
    cursor: pointer;
}
/*인증번호버튼*/
.cnum-btn{
    width:115px;
    background-color: #334257;
    border: none;
    color:#fff;
    font-size: 15px;
    outline:none;
    cursor: pointer;
}
p{
    font-size: 50px;
    font-family: 'Gugi', cursive;
}
input:-webkit-autofill {
	 -webkit-box-shadow: 0 0 0 30px #fff inset ; 
	 -webkit-text-fill-color: #000; 
} 
input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus, input:-webkit-autofill:active {
	 transition: background-color 5000s ease-in-out 0s; 
}
.next_box {
    margin-top: 9px;
    font-size: 12px;   
}

</style>
</head>
<body>
    <div class="main-signup">
        <!--웹페이지 상단-->
        <header>
            <!--LOGO-->
            <div class="logo">
                <p>돈<span>-</span>다</p>
            </div>
        </header>

        <!--회원가입 부분-->
	<form action="/person/joinProc" method="post">
        <section class="signup-wrap">

            <div>
                <!--아이디,비번,비번재확인-->

                <h3>아이디</h3>
                <div style="display: flex;">
                    <span class="signup-input" style="width:100%; margin: 10px 0px 0px 0px">
                        <input id="id" name=id type="text" ></input>
                    </span>
                </div>
                <span class="next_box" id="idcheck" aria-live="assertive"></span>

                <h3>비밀번호</h3>
                <span class="signup-input">
                    <input id="pw" name=pw type="password"></input>
                </span>
                <span class="next_box" id=regexPw aria-live="assertive"></span>

                <h3>비밀번호 재확인</h3>
                <span class="signup-input">
                    <input id="ch" type="password"></input>
                </span>
                <span class="next_box" id=val aria-live="assertive"></span>

            </div>

            <div style="margin-top: 35px;">
                <!--이름,생년월일,성별,이메일-->
                <h3>이름</h3>
                <span class="signup-input">
                    <input id="name" name=name type="text"></input>
                </span>

                <h3>생년월일</h3>
                <span style="display: flex;">
                    <span class="signup-input-birth">
                        <input class = birth id="signup-birth-yy" type="text"placeholder="년(4자)" maxlength="4"></input>
                    </span>
                    <span class="signup-input-birth" style="margin-left: 10px;">
                        <select id="signup-birth-mm" class="selectbox birth" onchange="">
                            <option value="month">월</option>
                            <option value="01">1</option>
                            <option value="02">2</option>
                            <option value="03">3</option>
                            <option value="04">4</option>
                            <option value="05">5</option>
                            <option value="06">6</option>
                            <option value="07">7</option>
                            <option value="08">8</option>
                            <option value="09">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                    </span>
                    <span class="signup-input-birth" style="margin-left: 10px;">
                        <input class = birth id="signup-birth-dd" type="text" placeholder="일" maxlength="2"></input>
                    </span>
                    <input type = "hidden" name = birth id = birth>
                </span>
                <span class="next_box" id=birthday aria-live="assertive"></span>

                <span class="choice">
                    <h3>이메일</h3>
                </span>
                <span class="signup-input">
                    <input id="signup-email" type="email" name=email placeholder="이메일"></input>
                </span>

            </div>

            <div style="margin-top: 35px;">
                <!--휴대전화-->
                <h3>휴대전화</h3>
                <div style="display: flex;">
                    <span class="signup-input" style="width:100%; margin: 10px 0px 0px 0px">
                        <input id="phone" name=phone type="text" placeholder="전화번호 입력 '-' 제외"></input>
                    </span>
                    <span class="cnum-btn-wrap">
                        <button type=button id=sendphoneNumber class="cnum-btn">인증번호 받기</button>
                    </span>
                </div>
                
                <div style="display: flex;">
                    <span class="signup-input" style="width:100%; margin: 10px 0px 0px 0px">
                        <input id="inputCertifiedNumber" type="text" placeholder="인증번호 입력"></input>
                    </span>
                    <span class="cnum-btn-wrap">
                        <button type=button id=checkBtn class="cnum-btn">인증번호 확인</button>
                    </span>
                </div>

				<!--주소-->
                <h3>주소</h3>
                <div style="display: flex;">
                    <span class="signup-input" style="width:100%; margin: 10px 0px 0px 0px">
                        <input id="postcode" name=postcode type="text" placeholder="우편번호" readonly></input>
                    </span>
                    <span class="cnum-btn-wrap">
                        <button type=button id=search class="cnum-btn">우편번호 찾기</button>
                    </span>
                </div>
				<div style="display: flex;">
                    <span class="signup-input" style="width:100%; margin: 10px 0px 0px 0px">
                        <input id=address1 name=address1 type="text" placeholder="주소" readonly></input>
                    </span>
                </div>

				<div style="display: flex;">
                    <span class="signup-input" style="width:100%; margin: 10px 0px 0px 0px">
                        <input id=address2 name=address2 type="text" placeholder="상세주소"></input>
                    </span>
                </div>
            </div>

            <div>
                <!--가입하기-->
                <div class="signup-btn-wrap">
                	<input type=submit id="signup-btn" value=가입하기>
                </div>
            </div>
        </section>
    </form>
    </div>		
</body>
</html>