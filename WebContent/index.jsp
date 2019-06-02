<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>휴게실 예약 시스템</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link href="./fullCalendar/core/main.min.css" rel="stylesheet">
<link href="./fullCalendar/daygrid/main.min.css" rel="stylesheet">
<link href="./fullCalendar/timegrid/main.min.css" rel="stylesheet">
<link href="./fullCalendar/bootstrap/main.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="shortcut icon" type="image/x-icon" href="./images/comma.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="./fullCalendar/core/main.min.js"></script>
<script src="./fullCalendar/interaction/main.min.js"></script>
<script src="./fullCalendar/daygrid/main.min.js"></script>
<script src="./fullCalendar/timegrid/main.min.js"></script>
<script src='./fullCalendar/core/locales-all.min.js'></script>
<script src="./fullCalendar/bootstrap/main.min.js"></script>

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

body {
	font-family: 'NBG', sans-serif;
}



.gp-header{
	font-family: georgia;
	font-size: 40px;
	color: #5FD698;
	font-style: italic;
	text-align: center;
	margin-top: 25px;
}
.gp-footer{
	position: fixed;
	color: rgba(95,214,152,0.7);
	bottom: 10px;
	left: 50%;
	font-family: georgia;
	font-style: italic;
	transform: translateX(-50%);
}
.gp-footer .soc_icons{
	display: inline-block;
	color: #5FD698;
	margin: 0px 10px;
}

::-moz-selection { background: transparent;}
::selection {background: transparent;}

.switchContainer1{
	display: inline-block;
	filter: url("index.html#gooey");
	-webkit-filter: url("#gooey");
	position: absolute;
	left:60%;
	top:27%;
	cursor: pointer;
}

.switchContainer2{
	display: inline-block;
	filter: url("index.html#gooey");
	-webkit-filter: url("#gooey");
	position: absolute;
	left:60%;
	top:54%;
	cursor: pointer;
}

.switchContainer3{
	display: inline-block;
	filter: url("index.html#gooey");
	-webkit-filter: url("#gooey");
	position: absolute;
	left:60%;
	top:81%;
	cursor: pointer;
}

.switchBg{
	width:60px;
	height: 7px;
}
.switchBtn{
	width: 30px;
	height: 30px;
	border-radius: 50%;
	display: inline-block;
	position: absolute;
	left: 0px;
	top: -12px;
	transform: translate3d(0,0,0);
}

.switchBg, .switchBtn{background: #DC4848; transition: 300ms all ease;}
.switchContainer1.switchOn .switchBtn, .switchContainer1.switchOn .switchBg{background: #5FD698;}

.switchContainer1.switchOn .switchBtn{animation: switchOn 250ms linear forwards; }
.switchContainer1.switchOff .switchBtn{animation: switchOff 250ms linear forwards; }

.switchContainer2.switchOn .switchBtn, .switchContainer2.switchOn .switchBg{background: #5FD698;}

.switchContainer2.switchOn .switchBtn{animation: switchOn 250ms linear forwards; }
.switchContainer2.switchOff .switchBtn{animation: switchOff 250ms linear forwards; }

.switchContainer3.switchOn .switchBtn, .switchContainer3.switchOn .switchBg{background: #5FD698;}

.switchContainer3.switchOn .switchBtn{animation: switchOn 250ms linear forwards; }
.switchContainer3.switchOff .switchBtn{animation: switchOff 250ms linear forwards; }

@keyframes switchOn { 
  0%{transform: scale3d(1,1,1) translate3d(0px,0,0); transform-origin: left center;} 
  40%{transform: scale3d(1.4,0.7,0) translate3d(20px,0,0); transform-origin: right center;}
  70%{transform: scale3d(0.9,1.15,1) translate3d(33px,0,0); }
  100%{transform: scale3d(1,1,1) translate3d(30px,0,0); }
}
@keyframes switchOff { 
  0%{transform: scale3d(1,1,1) translate3d(30px,0,0); transform-origin: right center;} 
  40%{transform: scale3d(1.4,0.7,0) translate3d(10px,0,0); transform-origin: right center;}
  70%{transform: scale3d(0.9,1.15,1) translate3d(-3px,0,0); }
  100%{transform: scale3d(1,1,1) translate3d(0px,0,0); }
}



.jumbotron {
	background-image: linear-gradient(to right, RGB(7, 152, 207),
		RGB(132, 125, 175), RGB(245, 101, 146));
	border-bottom: 1px solid RGB(210, 210, 210);
	font-family: 'Nanum Square', sans-serif;
	font-size: 20px;
	height: 130px;
	padding: 30px;
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
.rm01{
width:1600px;
margin-left:110px;
margin-bottom:110px;
margin-top:30px;
}
.rm02{
width:1600px;
margin-left:110px;
margin-bottom:110px;
}
.rm03{
width:1600px;
margin-left:110px;
margin-bottom:110px;
}
.t1 {
float:right;
}
.t2 {
float:right;
}
.t3 {
float:right;
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
	width:100%;
	height:36px;
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
    top: -101px;
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
    top: -101px;
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
    top: -101px;
    right: 0%;
}
.commaimages {
	margin-right: 40px;
	width: 80px;
	height : 102px;
}
.commaimage1 {
	width: 58px;
	height : 71px;
	float:left;
	margin : 0px 20px 20px 30px;
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
.header {
	
}

.body {
	
}

.footer {
	
}

#calendar rd {
	height: 30px;
}
</style>
<script>
$(document).ready(function() {
	$('td').not('.default').click(function() {
		if($(this).attr('class').inclludes('active')) $(this).removeClass("active");
		else $(this).addClass("active");
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
    

    var container = document.querySelector("#switchContainer1");
    var container2 = document.querySelector("#switchContainer2");
    var container3 = document.querySelector("#switchContainer3");

    function onOffSwitch(){
      if(container.classList.contains("switchOn")){
        container.classList.remove("switchOn");
        container.classList += " switchOff";
      }
      else{
        container.classList.remove("switchOff");
        container.classList += " switchOn";
      }
      
    }
    container.addEventListener("click", onOffSwitch, false);

    function onOffSwitch2(){
       if(container2.classList.contains("switchOn")){
         container2.classList.remove("switchOn");
         container2.classList += " switchOff";
       }
       else{
         container2.classList.remove("switchOff");
         container2.classList += " switchOn";
       }
    }
    container2.addEventListener("click", onOffSwitch2, false);
    
    function onOffSwitch3(){
        if(container3.classList.contains("switchOn")){
          container3.classList.remove("switchOn");
          container3.classList += " switchOff";
        }
        else{
          container3.classList.remove("switchOff");
          container3.classList += " switchOn";
        }
      }
    container3.addEventListener("click", onOffSwitch3, false);
      
});
	<%-- var calendarEl = document.getElementById('calendar');
	var date = new Date();
    var rm_no = 1;
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	height: 550,
    	themeSystem:'bootstrap',
    	plugins: [ 'interaction', 'timeGrid', 'bootstrap' ],
    	locale: 'ko',
    	defaultView: 'timeGridDay',
    	selectable: true,
    	allDaySlot:false,
    	minTime:"08:00:00",
    	maxTime:"19:00:00",
    	nowIndicator: true,
    	defaultDate: date,
    	handleWindowResize: true,
    	windowResiseDelay:2000,
    	slotDuration: '00:20:00',
      	hiddenDays: [0, 6],
		select: function(info) {
			var reservationCheck = confirm(info.start.getHours() + "시 " + info.start.getMinutes() +"분에 예약하시겠습니까?");
			if(reservationCheck) {
			$.ajax({
				type: 'post',
				url: 'Reservation',
				data: {
					"time": "title : '<%=request.getSession().getAttribute("nickname")%>'"  + ",start : '" + info.startStr + "',end : '" + info.endStr + "'",
					"rm_no": rm_no
				},
			success: function(result) {
				if(result == "x") {
					alert("2번 이상 예약할 수 없습니다.");
				}else {
					
			calendar.addEvent({
				id:result,
				title:"<%=request.getSession().getAttribute("nickname")%>",
				start: info.startStr,
				end : info.endStr
			});
				}
			}
			});
			}
		},
		eventClick: function(info) {
			if(info.event.title == "<%=request.getSession().getAttribute("nickname")%>") {
				var deleteCheck = confirm("예약을 취소 하시겠습니까?");
				if(deleteCheck) {
					$.ajax({
						type: 'post',
						url: 'Delete',
						data: {
							"rm_id": info.event.id,
							"nickname" : info.event.title
						},
					});
					info.event.remove();
				}
			}
			else {
				alert("예약자가 다릅니다.");
			}
		},
      	header: {
        	left: '',
        	center: 'title',
        	right: ''
		},
		resourceLabelText: "Rooms",
		resources:[{
			id : '1',
			title : "rm.01"
		}],
		events : [${time}]
	});

	calendar.render();
	calendar.defaultDate = date; --%>
		
	/* $('.room').click(function() {
		$('#calendar').html("");
		$.ajax({
			type:'post',
			url:'Calendar',
			data : {
				'rm_no' : $(this).val(),
				'ajax' : "1"
			},
			success: function(result) {
				rm_no = $(this).val();
				console.log(result);
			}
		});
	}); */
</script>
</head>
<body>
	<div id="instance" style="position: fixed">
		<canvas class="instance" width="1920" height="1080"
			style="width: 100%; height: 100%;"></canvas>
	</div>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1 class="text-white" style="font-size: 65px;">휴게실 예약 시스템</h1>
	</div>
	<nav class="navbar navbar-expand-sm navbar-white bg-white sticky-top">
		<a class="navbar-brand logo" href="http://www.openhands.co.kr"><img
			src="./images/openhands_logo.png" style="width: 110px"></a>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">휴게실 예약</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">편의기능</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">delacourt(식당메뉴)</a> <a
							class="dropdown-item" href="#">회의실 예약 시스템</a> <a
							class="dropdown-item" href="#">전결라인</a>
					</div></li>
			</ul>
		</div>
		<div class="navbar2">
			<ul class="navbar-nav">
				<li class="nav-item dropdown" style="position: relative; right: 0;">
					<a class="nav-link" data-toggle="dropdown" href="#"> <img
						src="./images/person.png"
						style="margin-right: 5px"></a>
					<div class="dropdown-menu" style="position: absolute; left: -300%;">
						<a class="dropdown-item" href="#">
							<div>
								예약 현황<br> 오후2시 예약중<br> 오후3시 예약중
							</div>
						</a> <a class="dropdown-item" href="Logout">로그아웃</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	<br><br><br>
	${html}
	



	<div class="admin">
	<span><center style="margin:6px 0 0 0;color:RGB(64, 64, 64); font-size: 20px;">Controls</center></span><hr style="margin: 0;">
	<img class="commaimage1" src="./images/comma1.png" style="margin-top:20px;">
	<div class="switchContainer1" id="switchContainer1">
  <div class="switchBg"></div>
    <div class="switchBtn"></div>
</div>

	<img class="commaimage1" src="./images/comma2.png">
	<div class="switchContainer2" id="switchContainer2">
  <div class="switchBg"></div>
    <div class="switchBtn"></div>
</div>

	<img class="commaimage1" src="./images/comma3.png">
	<div class="switchContainer3" id="switchContainer3">
  <div class="switchBg"></div>
    <div class="switchBtn"></div>
</div>
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="0">
  <defs>
    <filter id="gooey">
      <feGaussianBlur in="SourceGraphic" stdDeviation="3" result="blur"></feGaussianBlur>
      <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 19 -9" result="goo" />
    </filter>
  </defs>
</svg>

	</div>
	<!-- <div id='calendar'></div> -->
	<!-- <div class="alert"></div> -->
</body>
</html>