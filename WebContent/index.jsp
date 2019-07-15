<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set value="<%=(String)request.getSession().getAttribute(\"nickname\") %>" var="nickname"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>휴게실 예약 시스템</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="shortcut icon" type="image/x-icon" href="./images/comma.ico">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="./particles/jparticles.js"></script>
<script src="./particles/particle.js"></script>
<script src="./particles/event.js"></script>

<style>
#instance {
	width: 100%;
	height: 100%;
	z-index: -100;
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

@font-face {
	font-family: 'Seoul';
	src: url('./images/SEOULHANGANGM.TTF') format('truetype');
}

body {
	font-family: 'NBG', sans-serif;
}

.gp-header {
	font-family: georgia;
	font-size: 40px;
	color: #5FD698;
	font-style: italic;
	text-align: center;
	margin-top: 25px;
}

.gp-footer {
	position: fixed;
	color: rgba(95, 214, 152, 0.7);
	bottom: 10px;
	left: 50%;
	font-family: georgia;
	font-style: italic;
	transform: translateX(-50%);
}

.gp-footer .soc_icons {
	display: inline-block;
	color: #5FD698;
	margin: 0px 10px;
}

::-moz-selection {
	background: transparent;
}

::selection {
	background: transparent;
}

.switchContainer1 {
	display: inline-block;
	filter: url("index.html#gooey");
	-webkit-filter: url("#gooey");
	position: absolute;
	left: 60%;
	top: 27%;
	cursor: pointer;
}

.switchContainer2 {
	display: inline-block;
	filter: url("index.html#gooey");
	-webkit-filter: url("#gooey");
	position: absolute;
	left: 60%;
	top: 54%;
	cursor: pointer;
}

.switchContainer3 {
	display: inline-block;
	filter: url("index.html#gooey");
	-webkit-filter: url("#gooey");
	position: absolute;
	left: 60%;
	top: 81%;
	cursor: pointer;
}

.switchBg {
	width: 60px;
	height: 7px;
}

.switchBtn {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	display: inline-block;
	position: absolute;
	left: 0px;
	top: -12px;
	transform: translate3d(0, 0, 0);
}

.switchBg, .switchBtn {
	background: #DC4848;
	transition: 300ms all ease;
}

.switchContainer1.switchOn .switchBtn, .switchContainer1.switchOn .switchBg
	{
	background: #5FD698;
}

.switchContainer1.switchOn .switchBtn {
	animation: switchOn 250ms linear forwards;
}

.switchContainer1.switchOff .switchBtn {
	animation: switchOff 250ms linear forwards;
}

.switchContainer2.switchOn .switchBtn, .switchContainer2.switchOn .switchBg
	{
	background: #5FD698;
}

.switchContainer2.switchOn .switchBtn {
	animation: switchOn 250ms linear forwards;
}

.switchContainer2.switchOff .switchBtn {
	animation: switchOff 250ms linear forwards;
}

.switchContainer3.switchOn .switchBtn, .switchContainer3.switchOn .switchBg
	{
	background: #5FD698;
}

.switchContainer3.switchOn .switchBtn {
	animation: switchOn 250ms linear forwards;
}

.switchContainer3.switchOff .switchBtn {
	animation: switchOff 250ms linear forwards;
}


@keyframes switchOn { 
	0%{transform: scale3d(1, 1, 1) translate3d(0px, 0, 0);transform-origin: left center;}
	40%{transform:scale3d(1.4,0.7,0) translate3d(20px,0,0);transform-origin:right center;}
	70%{transform:scale3d(0.9,1.15,1) translate3d(33px,0,0);}
	100%{transform:scale3d(1,1,1) translate3d(30px,0,0);}
}
@keyframes switchOff {
	0%{transform: scale3d(1, 1, 1) translate3d(30px, 0, 0);transform-origin: right center;}
	40%{transform:scale3d(1.4,0.7,0) translate3d(10px,0,0);transform-origin:right center;}
	70%{transform:scale3d(0.9,1.15,1) translate3d(-3px,0,0);}
	100%{transform: scale3d(1,1,1) translate3d(0px,0,0);}
}

.jumbotron {
	background-image: linear-gradient(to right, RGB(7, 152, 207),
		RGB(132, 125, 175), RGB(245, 101, 146));
	border-bottom: 1px solid RGB(210, 210, 210);
	font-family: 'Nanum Square', sans-serif;
	font-size: 20px;
	height: 130px;
	padding: 20px;
}

.logo {
	font-weight: bolder;
	margin: 0px 0px 0px 5px;
	padding: 5px 10px 5px 5px;
}

nav a {
	color: RGB(64, 64, 64);
}

nav a:hover {
	color: RGB(64, 64, 64);
	background-color: RGB(210, 210, 210);
}

li.active a, .show>.nav-link {
	color: RGB(64, 64, 64);
	background-color: RGB(210, 210, 210);
}

.navbar {
	border-bottom: 2px solid RGB(210, 210, 210);
	margin: 0px;
	padding: 0px;
}

.navbar2 {
	border-bottom: 0px solid RGB(210, 210, 210);
	margin: 0px;
	padding: 0px;
}

td {
	padding: 10px 20px;
	background-color: white;
	cursor: pointer;
	border: 1px solid lightgray;
}

.rm01 {
	width: 1645px;
	margin-left: 110px;
	margin-bottom: 90px;
}

.rm02 {
	width: 1645px;
	margin-left: 110px;
	margin-bottom: 90px;
}

.rm03 {
	width: 1645px;
	margin-left: 110px;
	margin-bottom: 90px;
}

.t1 {
	margin-top: 20px;
	float: right;
}

.t2 {
	margin-top: 20px;
	float: right;
}

.t3 {
	margin-top: 20px;
	float: right;
}

.t1 .active {
	background-color: RGB(7, 152, 207);
}

.t2 .active {
	background-color: RGB(132, 125, 175);
}

.t3 .active {
	background-color: RGB(245, 101, 146);
}

.default, .disable {
	background-color: gray;
}

.notice {
	padding: 10px;
	text-align: center;
	width: 100%;
	height: 36px;
}

.dnotice1 {
	width: 1424.55px;
	height: 90px;
	background-color: #099CD3;
	z-index: 20;
	position: relative;
	opacity: 1;
	color: white;
	font-family: NBG;
	font-weight: bold;
	font-size: 30px;
	padding: 25px 0px;
	text-align: center;
	float: right;
	top: -99px;
	right: 0%;
}

.dnotice2 {
	width: 1424.55px;
	height: 90px;
	background-color: #867EB1;
	z-index: 20;
	position: relative;
	opacity: 1;
	color: white;
	font-family: NBG;
	font-weight: bold;
	font-size: 30px;
	padding: 25px 0px;
	text-align: center;
	float: right;
	top: -100px;
	right: 0%;
}

.dnotice3 {
	width: 1424.55px;
	height: 90px;
	background-color: #F36692;
	z-index: 20;
	position: relative;
	opacity: 1;
	color: white;
	font-family: NBG;
	font-weight: bold;
	font-size: 30px;
	padding: 25px 0px;
	text-align: center;
	float: right;
	top: -97px;
	right: 0%;
}

.commaimages1 {
	margin-right: 30px;
	width: 120px;
	height: 120px;
}

.commaimages2 {
	margin-right: 30px;
	width: 120px;
	height: 120px;
}

.commaimages3 {
	margin-right: 30px;
	margin-left: 9px;
	width: 107px;
	height: 117px;
}

.commaimage1 {
	width: 58px;
	height: 71px;
	float: left;
	margin: 0px 20px 20px 30px;
}

.admin {
	font-family: NBG;
	font-weight: bold;
	font-size: 15px;
	position: fixed;
	width: 200px;
	height: 336.5px;
	right: -190px;
	top: 39%;
	transition: all ease 0.5s;
	border-bottom-left-radius: 20px;
	border-top-left-radius: 20px;
}

.admin:hover {
	right: 0%;
	background-color: white;
	border: 2px solid lightgray;
}

.cancel {
	border-radius: 100px;
	background-color: #DC4848;
	margin-left: 6px;
	font-size: 9px;
	padding: 0px 1px;
	font-weight: bold;
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
	font-size: 27px;
	padding: 15px 15px 10px 15px;
}

.modal-content {
	width: 652px;
	position: absolute;
	top: 46.3%;
	left: 45.4%;
	transform: translate(-50%, -50%);
}

.modal-fade{
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 3000; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.mleft {
	float: left;
    margin-top: 5px;
    margin-left: 60px;
	color : RGB(64, 64, 64);
}

.mright {
	float: right;
    margin-right: 60px;
    margin-top: 12px;
	color : RGB(64, 64, 64);
}

.mtext {
	font-family: 'Nanum Square', sans-serif;
	color : RGB(64, 64, 64);
	border: 2px solid lightgray;
	border-radius: 10px;
	padding-top: 50px;
	padding-bottom: 20px;
	padding-left: 24px;
	padding-right: 24px;
	margin-top: -30px;
}

.text {
	margin-bottom: 30px;
}

.mlogo {
	margin-top: 7px;
	float: right;
	width: 130px;
	height: 24px;
}

.navbar-nav, .dropdown-item {
	font-size: 25px;
}

.today{
    font-size: 40px;
    text-align: center;
    font-weight: bold;
}

.support {
	text-align:center;
	font-weight:bold; 
	font-size: 20px;"
}

}
/* #calendar {
	width: 500px;
	position: relative;
	top: 50%;
	left: 14%;
} */

/* .rm1 {
	background: url(./images/RM_1_none.png) no-repeat;
	background-position: 6px 10px;
	padding: 60px;
	outline: 0;
	border: 0;
}

.rm2 {
	background: url(./images/RM_2_none.png) no-repeat;
	background-position: 8px 10px;
	padding: 60px;
	outline: 0;
	border: 0;
	margin: 0 150px;
}

.rm3 {
	background: url(./images/RM_3_none.png) no-repeat;
	background-position: 6px 10px;
	padding: 60px;
	outline: 0;
	border: 0;
}

.rm1:hover, .active1 {
	background: url(./images/RM_1_bt.png) no-repeat;
	padding: 60px;
	outline: 0;
	border: 0;
}

.rm2:hover, .active2 {
	background: url(./images/RM_2_bt.png) no-repeat;
	padding: 60px;
	outline: 0;
	border: 0;
}

.rm3:hover, .active3 {
	background: url(./images/RM_3_bt.png) no-repeat;
	padding: 60px;
	outline: 0;
	border: 0;
} */
</style>
<script>
$(document).ready(function() {

	var today = new Date();
	$('.today').text(today.getFullYear() + "년 " + (today.getMonth() + 1) + "월 " + today.getDate() + "일");
	
	if(localStorage.getItem('popup') == 0) {
		console.log(localStorage.getItem('popup'));
		localStorage.setItem('popup', localStorage.getItem('popup')+1);
	$('#noticepopup').show();
	}
	
	var time = ${time};
	for(var i = 0; i < time.length; i++) {
		console.log('.t' + time[i][0] + ' .' + time[i][1]);
		$('.t' + time[i][0] + ' tr .' + time[i][1]).addClass('active');
	}
	
	$.ajax({
    	type: 'post',
    	url: '/Rest/Disabled',
    	success : function(result) {
    	var arr = [[],[],[]];
    		var str = result.split("@");
    		for(var i = 0; i < str.length; i++) {
    			arr[i] = str[i].split("/");
    		}
    		for(var i = 0; i < arr.length; i++) {
    			if(arr[i][1] == "0") {
    				$('.dnotice' + arr[i][0]).hide();
    				$('.switchContainer' + arr[i][0]).addClass('switchOff');
    			}
    			else if (arr[i][1] == "1") {
    				$('.dnotice' + arr[i][0]).show();
    				$('.switchContainer' + arr[i][0]).addClass('switchOn');
    			}
    		}
    	}
    });
	
	$('td').not('.default, .active, .AM, .PM').click(function() {
		var res = $(this);
		var reservationCheck = confirm(res.attr('class').replace("m","시 ") + "분에 예약 하시겠습니까?");
		if(reservationCheck) {
		$.ajax({
			type: 'post',
			url: '/Rest/Reservation',
			data : {
				'time' : res.attr('class'),
				'rm_no' : res.parent().parent().parent().attr('class')
			},
		success : function(result) {
			if(result == "x") alert("예약을 2번 이상 예약할 수 없습니다.");
			else if(result == "d") alert("연속으로 예약할 수 없습니다.");
			else if(result == "s") alert("동일한 시간대에 다른 방을 예약할 수 없습니다.");
			else if(result == "v") alert("지난 시간대는 예약할 수 없습니다.");
			else if(result == "o") location.reload();
			}
		});
		}
	});
	
	$('.active').click(function() {
		var cancel = $(this);
		$.ajax({
			type: 'post',
			url: '/Rest/Delete',
			data : {
				'time' : cancel.attr('class').replace(' active', '')
			},
			success : function(result) {
				console.log(result);
				if(result == '1') {
				alert('에약이 취소 되었습니다.');
				location.reload();
				} else alert('예약자가 다릅니다.');
			}
		});
	});
	
	$('.default').click(function() {
		alert("예약하실 수 없습니다.");
	});
	
	$('.delete').click(function() {
		var del = $(this);
		var deleteCheck = confirm("예약을 취소하시겠습니까?");
		var time = del.text().substring(3, del.text().indexOf(':')+3).replace(":", "m");
		if(deleteCheck) {
			 $.ajax({
				type: 'post',
				url: '/Rest/Delete',
				data : {
					'time' : time
				},
				success : function() {
					location.reload();
				}
			});
		}
	});
	
    bind('#instance', function () {
        return new JParticles.particle('#instance',
        {
         color: ['#0798CF','#847daf','#f56592'],
         num: .05,
            range: 2000,
            maxR: 2.5,
            minR: 2.5,
            lineWidth: .5,
            maxSpeed: 0.05,
            proximity: 100,
            parallax: false,
            parallaxStrength: 1
        });
    });
    
    <c:if test="${nickname == '오픈핸즈'}">
    var container = document.querySelector("#switchContainer1");
    var container2 = document.querySelector("#switchContainer2");
    var container3 = document.querySelector("#switchContainer3");

    function onOffSwitch(){
      if(container.classList.contains("switchOn")){
        container.classList.remove("switchOn");
        container.classList += " switchOff";
        $('.dnotice1').hide();
        $.ajax({
        	type: 'post',
        	url: '/Rest/Disable',
        	data : {
        		'rm_no' : 1,
        		'used' : 0
        	}
        });
      }
      else{
        container.classList.remove("switchOff");
        container.classList += " switchOn";
        $('.dnotice1').show();
        $.ajax({
        	type: 'post',
        	url: '/Rest/Disable',
        	data : {
        		'rm_no' : 1,
        		'used' : 1
        	}
        });
      }
      
    }
    container.addEventListener("click", onOffSwitch, false);

    function onOffSwitch2(){
       if(container2.classList.contains("switchOn")){
         container2.classList.remove("switchOn");
         container2.classList += " switchOff";
         $('.dnotice2').hide();
         $.ajax({
         	type: 'post',
         	url: '/Rest/Disable',
         	data : {
         		'rm_no' : 2,
         		'used' : 0
         	}
         });
       }
       else{
         container2.classList.remove("switchOff");
         container2.classList += " switchOn";
         $('.dnotice2').show();
         $.ajax({
         	type: 'post',
         	url: '/Rest/Disable',
         	data : {
         		'rm_no' : 2,
         		'used' : 1
         	}
         });
       }
    }
    container2.addEventListener("click", onOffSwitch2, false);
    
    function onOffSwitch3(){
        if(container3.classList.contains("switchOn")){
          container3.classList.remove("switchOn");
          container3.classList += " switchOff";
          $('.dnotice3').hide();
          $.ajax({
          	type: 'post',
          	url: '/Rest/Disable',
          	data : {
          		'rm_no' : 3,
          		'used' : 0
          	}
          });
        }
        else{
          container3.classList.remove("switchOff");
          container3.classList += " switchOn";
          $('.dnotice3').show();
          $.ajax({
          	type: 'post',
          	url: '/Rest/Disable',
          	data : {
          		'rm_no' : 3,
          		'used' : 1
          	}
          });
        }
      }
    container3.addEventListener("click", onOffSwitch3, false);
      </c:if>

});
		function close_pop(flag) {
			$('#noticepopup').hide();
		};
</script>
</head>
<body>
	<div id="instance" style="position: fixed">
		<canvas class="instance" width="1920" height="1080"
			style="width: 100%; height: 100%;"></canvas>
	</div>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1 class="text-white" style="font-size: 75px;">휴게실 예약 시스템</h1>
	</div>
	<nav class="navbar navbar-expand-sm navbar-white bg-white sticky-top">
		<a class="navbar-brand logo" href="http://www.openhands.co.kr" target="_sub"><img
			src="./images/openhands_logo.png" style="width: 140px"></a>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">휴게실 예약</a></li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">편의기능</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="http://www.sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list;jsessionid=dIzKcanodX9wf2LeRYcek775PIStW75nQZw2Jf7qshFWXZh5_AA8!550924408?zoneId=AS&menuTime=lunch" target="_sub">delacourt(식당메뉴)</a>
						<a class="dropdown-item" href="http://70.30.169.36:8080/RS/#" target="_sub">회의실 예약 시스템</a>
							<!-- <a class="dropdown-item" href="#" target="_sub">전결라인</a> -->
					</div>
				</li>
			</ul>
		</div>
		<div class="navbar2">
			<ul class="navbar-nav">
				<li class="nav-item dropdown" style="position: relative; right: 0;">
					<a class="nav-link" data-toggle="dropdown" href="#"><strong style="font-size:25px;">내 예약 정보</strong></a>
					<div class="dropdown-menu" style="position: absolute; left: -80%;width:248px;">
					<div style="margin: 0px 3px 6px 15px; font-size : 25px;">
					<img src="./images/person.png" style="margin-right:5px;"> <strong><%=request.getSession().getAttribute("nickname") %> </strong>예약 정보
					</div>
					<a class="dropdown-item target" href="Logout"></a>
							${status}
						<a class="dropdown-item" href="Logout"><img src="./images/logout.png" style="width:20px;margin-right:5px;">로그아웃</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	<br>
	<div class="today"></div>
	${html}

	<div class="support">
	※ 지원사원팀 휴게시간(AM 9: 30 ~ 10:00 / PM 2:30 ~ 3:00)으로 예약 불가이지만, 현장에 자리가 남아있으면 들어가셔도 됩니다.
	</div>
	
<c:if test="${nickname == '오픈핸즈'}">
	<div class="admin">
		<span><center style="margin: 6px 0 0 0; color: RGB(64, 64, 64); font-size: 20px;">Controls</center></span>
		<hr style="margin: 0;">
		<img class="commaimage1" src="./images/comman1.png"
			style="margin-top: 20px;">
		<div class="switchContainer1" id="switchContainer1">
			<div class="switchBg"></div>
			<div class="switchBtn"></div>
		</div>

		<img class="commaimage1" src="./images/comman2.png">
		<div class="switchContainer2" id="switchContainer2">
			<div class="switchBg"></div>
			<div class="switchBtn"></div>
		</div>

		<img class="commaimage1" src="./images/comman3.png">
		<div class="switchContainer3" id="switchContainer3">
			<div class="switchBg"></div>
			<div class="switchBtn"></div>
		</div>
		<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="0">
  <defs>
    <filter id="gooey">
      <feGaussianBlur in="SourceGraphic" stdDeviation="3" result="blur"></feGaussianBlur>
      <feColorMatrix in="blur" mode="matrix"
				values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 19 -9" result="goo" />
    </filter>
  </defs>
</svg>

	</div>
</c:if>
	<!-- <div id='calendar'></div> -->
	<!-- <div class="alert"></div> -->
	
	<div class="modal-fade" id="noticepopup">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<div class="modal-header">
					<h4 class="modal-title text-white"></h4>
					<button type="button" class="X" data-dismiss="modal" onClick="close_pop();">&times;</button>
				</div>

				<div class="modal-body">
					<div class="mleft"><font style="font-size : 50px; font-family: 'Seoul', sans-serif;">“</font></div>
					<div class="mright"><font style="font-size : 50px; font-family: 'Seoul', sans-serif;">”</font></div>
					<div style="font-family: 'Nanum Square', sans-serif; color : RGB(64, 64, 64); margin-top: 18px; margin-bottom: 25px; font-size: 38px;"><center>휴게실 예약 시스템 공지사항</center></div><br>
					<div class="mtext">
					<div class="text">1.다른 사람을 위해 시간을 지켜주시길 바랍니다.</div>
					<div class="text">2.휴게실 사용 후 커튼을 열어 주시길 바랍니다.</div>
					<div class="text">3.휴게실 사용 후 깨끗하게 이용해 주시길 바랍니다.</div>
					<div class="text">4.휴게실 사용 후 팻말을 돌려 주시길 바랍니다.</div>
					</div>
					<img class="mlogo" src="./images/openhands_logo.png">
				</div>
			</div>
			</div>
		</div>

</body>
</html>