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
	window.onload = function(){
		let email = $("#email")
		let ch1 = $("#ch")
		let phoneNumber1 = $("#phoneNumber")
		
		let id = document.getElementById("email");  
        let ch2 = document.getElementById("ch");
		let phoneNumber = document.getElementById("phoneNumber");
		let val = document.getElementById("val");
		
		let idRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let pwRegex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		let phoneNumberRegex = /^010\d{3,4}\d{4}$/;
		
		document.getElementById("ch").oninput = function(){
			let pw = document.getElementById("pw").value;
	        let ch = document.getElementById("ch").value;
            if(pw != ch){
                val.innerHTML = "패스워드가 일치하지 않습니다.."
            }else{
             	val.innerHTML = "패스워드가 일치합니다." 
            }
        }	
				
		ch1.blur(function(){
	        let resultpw = pwRegex.test(ch2.value);
            if(resultpw){
                return;
            }else{
                alert("비밀번호 형식을 확인하세요.")
    			document.getElementById("pw").value = "";
    	        document.getElementById("ch").value = "";
            }
		})
		
		phoneNumber1.blur(function(){
			let resultphoneNumber = phoneNumberRegex.test(phoneNumber.value);
			if(resultphoneNumber){
				return;
			}else{
				alert("핸드폰 형식을 확인하세요.")
				document.getElementById("phoneNumber").value="";
			}
		})
	}
	$(function(){
		$('#sendphoneNumber').click(function(){
            let phone = $('#phone').val();
            alert('인증번호 발송 완료!')

            $.ajax({
                type: "GET",
                url: "/person/send",
                data: {"phone" : phone},
                success: function(res){
                    $('#checkBtn').click(function(){
                        if($.trim(res) ==$('#inputCertifiedNumber').val()){
                            alert(
                                '인증성공!',
                                '휴대폰 인증이 정상적으로 완료되었습니다.',
                                'success'
                            )
                        }else{
                            alert('인증번호를 다시 확인해주세요')
                        }
                    })


                }
            })
        });
		
		$("#duplCheck").on("click",function(){
			$.ajax({
				url:"/person/duplCheck",
				data:{id:$("#id").val()}
			}).done(function(resp){
				if(resp=="1"){
					alert("이미 사용중인 ID입니다.")
				}else{
					alert("사용가능한 ID입니다.");
				}
			})
		}) 
		
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
                        <input id="id" name=id type="text"></input>
                    </span>
                    <span class="cnum-btn-wrap">
                        <button type=button id=duplCheck class="cnum-btn">ID중복확인</button>
                    </span>
                </div>

                <h3>비밀번호</h3>
                <span class="signup-input">
                    <input id="pw" name=pw type="password"></input>
                </span>

                <h3>비밀번호 재확인</h3>
                <span class="signup-input">
                    <input id="ch" type="password"></input>
                </span>
                <div id=val></div>

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
                        <input id="phone" name=phone type="text" placeholder="전화번호 입력"></input>
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