<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" type="image/x-icon" href="./images/comma.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./jquery/jquery.cookie.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="./particles/jparticles.js"></script>
<script src="./particles/particle.js"></script>
<script src="./particles/event.js"></script>

<title>휴게실 예약 시스템</title>
<style>

#instance {
	width: 100%;
	height: 100%;
}

@font-face {
	font-family: 'Nanum Square';
	src: url('./images/NANUMSQUAREEB.eot') format('embedded-opentype'),
		url('./images/NANUMSQUAREEB.TTF') format('truetype');
}

@font-face {
	font-family: 'NBG';
	src: url('./images/NANUMBARUNGOTHICLIGHT.eot')
		format('embedded-opentype'), url('./images/NANUMBARUNGOTHICLIGHT.TTF')
		format('truetype');
}

@font-face {
	font-family: 'NBG';
	font-weight: bold;
	src: url('./images/NANUMBARUNGOTHICBOLD.eot')
		format('embedded-opentype'), url('./images/NANUMBARUNGOTHICBOLD.TTF')
		format('truetype');
}

body {
	font-family: 'NBG';
}

.nickname {
	background-image: url('./images/person.png');
	background-repeat: no-repeat;
	background-position: 15px center;
}

.password {
	background-image: url('./images/lock.png');
	background-repeat: no-repeat;
	background-position: 15px center;
	margin-top: 25px;
}

.nickname, .password {
	border-image: linear-gradient(to right, RGB(7, 152, 207),
		RGB(132, 125, 175), RGB(245, 101, 146));
	border-image-slice: 1;
	padding: 10px 10px 10px 50px;
	margin-left: 50px;
	width: 455px;
	border-width: 4px;
}

.findPW {
	border-style: solid;
	border-image: linear-gradient(to right, RGB(7, 152, 207),
		RGB(132, 125, 175), RGB(245, 101, 146));
	border-image-slice: 1;
	border-width: 2px 0 0 0;
}

.findPW, .findID {
	padding: 20px;
}

.nickname:focus, .password:focus {
	background-color: #E8FFFF;
}

.signNick, .signPW, .REsignPW {
	width: 290px;
	margin-top: 5px;
	padding: 5px;
	margin-left: 10px;
	margin-bottom: 1px;
}

.signEmail {
	width: 145px;
	padding: 5px;
	margin: 5px 5px 1px 10px;
}

input[type="checkbox"] {
	background-position: top right;
	background-repeat: no-repeat;
	display: none;
}

h1 {
	width: 440px;
	text-align: center;
	font-family: 'Nanum Square';
	font-size: 55px;
}

.fontColor {
	background: linear-gradient(to right, RGB(7, 152, 207),
		RGB(132, 125, 175), RGB(245, 101, 146));
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

label {
	margin-left: 50px;
}

.login {
	font-family: 'Nanum Square';
	width: 455px;
	height: 55px;
	border-radius: 30px;
	background: linear-gradient(to right, RGB(7, 152, 207),
		RGB(132, 125, 175), RGB(245, 101, 146));
	color: white;
	margin-left: 50px;
	margin-top: 10px;
	font-size: 35px;
	border: 0;
	outline: 0;
}

.signUp, .find {
	cursor: pointer;
}

.modal-header {
	background: linear-gradient(to right, RGB(7, 152, 207),
		RGB(132, 125, 175), RGB(245, 101, 146));
	height: 40px;
	padding: 10px 10px 5px 10px;
}

.modal-title {
	font-size: 17px;
	font-weight: bold;
}

.modal-body {
	padding: 10px 20px 20px 20px;
}

.modal-content {
	width: 462px;
	position: absolute;
	top: 46.3%;
	left: 45.4%;
	transform: translate(-50%, -50%);
}

input[type=checkbox]+label {
	left: 0;
	padding: 5px 0 5px 38px;
	background: url('./images/circle.png') no-repeat;
}

input[type=checkbox]:checked+label {
	background-image: url('./images/circle+check.png');
}

.bttn {
	margin-top: 20px;
	border-radius: 5px;
	width: 60px;
	border: 1px solid gray;
	outline: 0;
}

.cancel {
	margin-left: 30px;
}

.sign {
	margin-left: 120px;
}

.X {
	border: 0;
	outline: 0;
	padding: 0 0 0 0;
	background-color: lightgray;
	opacity: 1;
	border-radius: 100%;
	width: 20px;
	height: 20px;
	font-size: 15px;
	font-weight: bold;
}

.signText {
	width: 120px;
}

.alheader, .fnheader {
	background-image: linear-gradient(to right, RGB(7, 152, 207),
		RGB(132, 125, 175), RGB(245, 101, 146));
	width: 482px;
	height: 40px;
	color: white;
	padding: 5px;
	font-size: 20px;
	font-weight: bold;
}

.alertbody {
	padding-top: 10px;
	text-align: center;
}

.alX {
	position: absolute;
	left: 95%;
	border-radius: 100%;
	border: 0;
	width: 20px;
	height: 20px;
	font-size: 15px;
	font-weight: bold;
	margin: 3px 0 0 0;
	padding: 0;
}

.IDC {
	color: RGB(217, 93, 93);
	padding-top: 5px;
	margin-left: 123px;
	height: 29px;
}

.pass {
	color: RGB(40, 186, 141);
}
</style>

<script>


var check = false;
	function login() {
		 if(!check) $('.alertMain').show();
		return check;
	};
$(document).ready(function() {

	if($.cookie("nickname") != "undefined" && $.cookie("nickname") != null) {
		$('.remember').prop("checked", true);
	}
	
	bind('#instance', function() {
		return new JParticles.particle('#instance', {
			color : [ '#0798CF', '#847daf', '#f56592' ],
			num : .05,
			range : 2000,
			maxR : 2.5,
			minR : 2.5,
			lineWidth : .5,
			maxSpeed : 0.05,
			proximity : 100,
			parallax : false,
			parallaxStrength : 1,
			parallaxLayer : [ 1, 3, 5, 7 ]

		});
	});
	
	var alHeadHTML = "";
	
	$('.alertMain').hide();
	
	$('.alertClose').click(function() {
		$('.alertMain').hide();
	});
	
	
	$('.nickname, .password').keyup(function() {
		$.ajax({
			type:'POST',
			url:'/Test',
			 data : {
				 'nickname' : $('.nickname').val(),
				 'pw' : $('.password').val()
			 },
			 success : function(result) {
				 if(result == "true") check = true;
				 else check = false;
			 }
		});
	});

	$('.FnClose, .alertClose').click(function() {
		$('.FindMain').hide();
	});
	
	$('.signNick').keyup(function() {
		var test = /^[a-zA-Zㄱ-ㅎ가-힣0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(]{2,20}/;
		if (test.test($('.signNick').val())) {
			$.ajax({
				type: 'post',
				url:'/DuplCheck',
				data: {
					'type' : 'nickname',
					'answer' : $('.signNick').val()
				},
			success : function(result) {
				if(result == 'true') {
					$('.sNick').removeClass('pass');
					$('.sNick').text("중복된 닉네임입니다.");
				}else {
					$('.sNick').addClass('pass');
					$('.sNick').text("사용 가능한 닉네임입니다.");
				}
			}
			});
		}
		else {
			$('.sNick').removeClass('pass');
			$('.sNick').text("사용 불가능한 닉네임입니다.");
		}
	});
	
	$('.signPW').keyup(function() {
		var test = /^[a-zA-Z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(]{8,16}/;
		if (test.test($('.signPW').val())) {
			$('.sPW').addClass('pass');
			$('.sPW').text("사용 가능한 비밀번호입니다.");
		}
		else {
			$('.sPW').removeClass('pass');
			$('.sPW').text("사용 불가능한 비밀번호입니다.");
		}
	});
	
	$('.REsignPW').keyup(function() {
		var test = /^[a-zA-Z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(]{8,16}/;
		if ($('.signPW').val() == $('.REsignPW').val() && test.test($('.REsignPW').val())) {
			$('.sRePW').addClass('pass');
			$('.sRePW').text("비밀번호가 일치합니다.");
		}
		else {
			$('.sRePW').removeClass('pass');
			$('.sRePW').text("비밀번호가 일치하지 않습니다.");
		}
	});
	
	$('.signEmail').keyup(function() {
		var test = /^[a-zA-Z0-9]+[\.]{1}[a-z]+/;
		if (test.test($('.signEmail').val())) {
			$.ajax({
				type: 'post',
				url:'/DuplCheck',
				data: {
					'type' : 'email',
					'answer' : $('.signEmail').val()
				},
			success : function(result) {
				if(result == 'true') {
					$('.sEmail').removeClass('pass');
					$('.sEmail').text("중복된 이메일입니다.");
				}else {
					$('.sEmail').addClass('pass');
					$('.sEmail').text("사용 가능한 이메일입니다.");
				}
			}
			});
		}
		else {
			$('.sEmail').removeClass('pass');
			$('.sEmail').text("유효하지 않은 이메일입니다.");
		}
	});
	
	$('.pwfind').click(function() {
		$.ajax({
			type: 'post',
			url: '/FindPW',
			data: {
				'nickname' : $('.fpnick').val(),
				'email' : $('.fpemail').val()
			},
			success : function(result) {
				if(result != "") {
					$('.fnText').text($('.fpnick').val() + "님의 비밀번호는 " + result + "입니다.");
					$('.FindMain').show();
				}
				else {
					$('.fnText').text("잘못 입력하셨거나, 없는 회원입니다.");
					$('.FindMain').show();
				}
			}
		});
	});
	
	$('.nickfind').click(function() {
		$.ajax({
			type: 'post',
			url: '/FindNick',
			data: {
				'email' : $('.fnemail').val()
			},
			success : function(result) {
				if(result != "") {
					$('.fnText').text("찾으시는 회원님의 닉네임은 " + result + "입니다.");
					$('.FindMain').show();
				}
				else {
					$('.fnText').text("잘못 입력하셨거나, 없는 회원입니다.");
					$('.FindMain').show();
				}
			},
			error : function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	
	$('.signsubmit').click(function() {
		var testNick = /^[a-zA-Z가-힣0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(]{2,20}/;
		var testPW = /^[a-zA-Z0-9]{8,16}/;
		var testEmail = /^[a-zA-Z0-9]+[\.]{1}[a-z]+/;
		var signCheck = testNick.test($('.signNick').val()) && testPW.test($('.signPW').val()) && testPW.test($('.REsignPW').val()) && $('.signPW').val() == $('.REsignPW').val() && testEmail.test($('.signEmail').val());
		if(signCheck) {
		$.ajax({
			type : 'post',
			url : '/signUp',
			data : {
				'nickname' : $('.signNick').val(),
				'password' : $('.REsignPW').val(),
				'email' : $('.signEmail').val()
			},
			success : function(result) {
				if(result == '1') {
					$('.fnText').text("회원가입 되었습니다.");
					$('.FindMain').show();
					$('.modal').hide();
					$('.modal-backdrop').hide();
					$('.signNick, .signPW, .REsignPW, .signEmail').val("");
					$('.sEmail, .sRePW, .sPW, .sNick').removeClass('pass');
					$('.sEmail, .sRePW, .sPW, .sNick').text("");
					
				}else if(result == '0') {
					$('.fnText').text("중복된 아이디 입니다.");
					$('.FindMain').show();
				}
				
			}
		});
		}else {
			$('.fnText').text("양식에 맞게 입력해주세요.");
			$('.FindMain').show();
		}
	});

	/* 	$('.')  /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/ */
	
});
</script>
</head>
<body>
    <div id="instance" style="position: fixed">
    <canvas class="instance" width="1920" height="1080" style="width: 100%; height: 100%;"></canvas></div>
    
	<div style="position: absolute;top:45%;left:50%;transform: translate(-50%, -50%);width:600px;height:400px;">
		<svg height="130" width="520">
  <defs>
    <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:RGB(7, 152, 207);stop-opacity:1" />
      <stop offset="50%" style="stop-color:RGB(132, 125, 175);stop-opacity:1" />
      <stop offset="100%" style="stop-color:RGB(245, 101, 146);stop-opacity:1" />
    </linearGradient>
  </defs>
  <text font-family="Nanum Square" fill="url(#grad1)" font-size="65" font-family="Verdana" x="10" y="86">휴게실 예약 시스템</text>
</svg><img src="./images/comma.png" style="margin-top:4px;height:65px;">
<br>
<form action="login" method="post" onsubmit="return login();">
		<input class='nickname' type="text" name="nickname" placeholder="Nickname"><br>
		<input class="password" type="password" name="pw" placeholder="Password"><br><br>
		<input class="remember" id="remember" type="checkbox" name="remember" value="checked"><label for="remember">Remember me</label>
		<span style="margin-left: 95px;">
		<span data-toggle="modal" data-target="#signUp" class="signUp">회원가입</span>
		<span>&#32;/&#32;</span>
		<span data-toggle="modal" data-target="#find" class="find">닉네임  비밀번호 찾기</span><br>
		</span>
		<button class="login">LOGIN</button>
</form>
	</div>
		<div class="modal fade" id="signUp">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
				
					<div class="modal-header">
						<h4 class="modal-title text-white">회원가입</h4>
						<button type="button" class="X" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">
					<span style="margin-right:70px;">닉네임</span><input class="signNick" type="text" placeholder="Nickname" required><br>
					<div class="sNick IDC">사용 불가능한 닉네임입니다.</div>
					<span style="margin-right:56px;">비밀번호</span><input class="signPW" type="password" placeholder="Password" required><br>
					<div class="sPW IDC">사용 불가능한 비밀번호입니다.</div>
					<span style="margin-right:10px;">비밀번호 재확인</span><input class="REsignPW" type="password" placeholder="Password" required><br>
					<div class="sRePW IDC">비밀번호가 일치하지 않습니다.</div>
					<span style="margin-right:63px;">E-mail</span><input class="signEmail" type="text" placeholder="E-mail" required><span>@openhands.co.kr</span><br>
					<div class="sEmail IDC">유효하지 않은 이메일입니다.</div>
					<div style="width:415px;border-top:1px solid gray;margin-top:20px;">
						<button type="button" class="bttn sign signsubmit">가입</button>
						<button type="button" class="bttn cancel" data-dismiss="modal">닫기</button>
					</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="find">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title text-white">닉네임 / 비밀번호 찾기</h4>
        <button type="button" class="X" data-dismiss="modal">&times;</button>
      </div>

		

      <div class="findID">
      <img src="./images/person.png" style="margin-right:10px;"><span class="fnname" style="font-weight:bold;margin-top:10px;">닉네임 찾기</span><br>
		<div style="margin-top:10px;">
		<span style="margin-right:63px;">E-mail</span><input class="signEmail fnemail" type="text" placeholder="E-mail"><span>@openhands.co.kr</span><br>
		</div>
		<div style="width:415px;border-top:1px solid gray;margin-top:20px;">
			<button style="margin-left:173px;" type="button" data-target="#findresult" class="bttn nickfind">확인</button>
		</div>
      </div>
      
      <div class="findPW">
      <img src="./images/lock.png" style="margin-right:10px;"><span class="fnname" style="font-weight:bold;">비밀번호 찾기</span><br>
        
        <div style="margin-top:10px;">
        <span style="margin-right:70px;">닉네임</span><input class="signNick fpnick" type="text" placeholder="Nickname"><br>
        </div>
		<div style="margin-top:10px;">
		<span style="margin-right:63px;">E-mail</span><input class="signEmail fpemail" type="text" placeholder="E-mail"><span>@openhands.co.kr</span><br>
		</div>
		<div style="width:415px;border-top:1px solid gray;margin-top:20px;">
			<button type="button" data-target="#findresult" class="bttn sign pwfind">확인</button>
			<button type="button" class="bttn cancel" data-dismiss="modal">닫기</button>
		</div>
    </div>
  </div>
</div>
</div>

	<div class="alertMain" style="display:none;background-color:RGB(107, 107, 107, 0.5);position:fixed;top:0;left:0;z-index:1500;background-color;white;width:100%;height:100%;">
	<div style="position: absolute;top:46.5%;left:48.7%;transform: translate(-50%, -50%);border:1px solid gray;width: 482px;height:203px;opacity:1;">
		<div class="alheader">알림
            <button class="alX alertClose">&times;</button>
        </div>
		<div class="alertbody" style="background-color:white;width:482px;">
            <img src="./images/emo.png" style="width:60px;margin-bottom:10px;"><br>
            <div class="alertText">뭔가 잘못 된 것 같은데요!?</div>
            <div style="width:440px;margin:10px 20px 10px;border-top:1px solid gray;padding-top:10px;">
                <button class="alertClose" style="margin-bottom:10px;;border-radius: 6px;border:1px solid gray;width:60px;height:28px;outline:0;font-size:15px;">확인</button>
            </div>
        </div>
	</div>
	</div>
	
		<div class="FindMain" style="display:none;background-color:RGB(107, 107, 107, 0.5);position:fixed;top:0;left:0;z-index:1510;width:100%;height:100%;">
	<div style="position: absolute;top:46.5%;left:48.7%;transform: translate(-50%, -50%);border:1px solid gray;width: 482px;height:203px;opacity:1;">
		<div class="fnheader">알림
            <button class="alX fnClose">&times;</button>
        </div>
		<div class="alertbody" style="background-color:white;width:482px;">
            <div class="fnText"><p style="margin-top:10px;"></div>
            <div style="width:440px;margin:10px 20px 10px;border-top:1px solid gray;padding-top:10px;">
                <button class="FnClose" style="margin-bottom:10px;border-radius: 6px;border:1px solid gray;width:60px;height:28px;outline:0;font-size:15px;">확인</button>
            </div>
        </div>
	</div>
	</div>
</body>
</html>