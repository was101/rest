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

td {
	padding: 10px 20px;
	background-color: lightgray;
	cursor: pointer;
	border: 1px solid white;
}
</style>
<script>
$(document).ready(function() {
	
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
});
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
						style="width: 20px; height: 18px; margin-right: 5px"></a>
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

	<div class="row d-flex justify-content-center"
		style="text-align: center; margin-top: 20px;">
		<div class="p-4">
			<table class="1">
				<thead>
					<tr>
						<th>AM</th>
						<th>PM</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="start-6:00end-6:20">6:00</td>
						<td class="start-12:00end-12:20">12:00</td>
					</tr>
					<tr>
						<td class="start-6:20end-6:40">6:20</td>
						<td class="start-12:20end-12:40">12:20</td>
					</tr>
					<tr>
						<td class="start-6:40end-7:00">6:40</td>
						<td class="start-12:40end-1:00">12:40</td>
					</tr>
					<tr>
						<td class="start-7:00end-7:20">7:00</td>
						<td class="start-1:00end-1:20">1:00</td>
					</tr>
					<tr>
						<td class="start-7:20end-7:40">7:20</td>
						<td class="start-1:20end-1:40">1:20</td>
					</tr>
					<tr>
						<td class="start-7:40end-8:00">7:40</td>
						<td class="start-1:40end-2:00">1:40</td>
					</tr>
					<tr>
						<td class="start-8:00end-8:20">8:00</td>
						<td class="start-2:00end-2:20">2:00</td>
					</tr>
					<tr>
						<td class="start-8:20end-8:40">8:20</td>
						<td class="start-2:20end-2:40">2:20</td>
					</tr>
					<tr>
						<td class="start-8:40end-9:00">8:40</td>
						<td class="start-2:40end-3:00">2:40</td>
					</tr>
					<tr>
						<td class="start-9:00end-9:20">9:00</td>
						<td class="start-3:00end-3:20">3:00</td>
					</tr>
					<tr>
						<td class="start-9:20end-9:40">9:20</td>
						<td class="start-3:20end-3:40">3:20</td>
					</tr>
					<tr>
						<td class="start-9:40end-10:00">9:40</td>
						<td class="start-3:40end-4:00">3:40</td>
					</tr>
					<tr>
						<td class="start-10:00end-10:20">10:00</td>
						<td class="start-4:00end-4:20">4:00</td>
					</tr>
					<tr>
						<td class="start-10:20end-10:40">10:20</td>
						<td class="start-4:20end-4:40">4:20</td>
					</tr>
					<tr>
						<td class="start-10:40end-11:00">10:40</td>
						<td class="start-4:40end-5:00">4:40</td>
					</tr>
					<tr>
						<td class="start-11:00end-11:20">11:00</td>
						<td class="start-5:00end-5:20">5:00</td>
					</tr>
					<tr>
						<td class="start-11:20end-11:40">11:20</td>
						<td class="start-5:20end-5:40">5:20</td>
					</tr>
					<tr>
						<td class="start-11:40end-12:00">11:40</td>
						<td class="start-5:40end-6:00">5:40</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="p-4">
			<table class="2">
				<thead>
					<tr>
						<th>AM</th>
						<th>PM</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="start-6:00end-6:20">6:00</td>
						<td class="start-12:00end-12:20">12:00</td>
					</tr>
					<tr>
						<td class="start-6:20end-6:40">6:20</td>
						<td class="start-12:20end-12:40">12:20</td>
					</tr>
					<tr>
						<td class="start-6:40end-7:00">6:40</td>
						<td class="start-12:40end-1:00">12:40</td>
					</tr>
					<tr>
						<td class="start-7:00end-7:20">7:00</td>
						<td class="start-1:00end-1:20">1:00</td>
					</tr>
					<tr>
						<td class="start-7:20end-7:40">7:20</td>
						<td class="start-1:20end-1:40">1:20</td>
					</tr>
					<tr>
						<td class="start-7:40end-8:00">7:40</td>
						<td class="start-1:40end-2:00">1:40</td>
					</tr>
					<tr>
						<td class="start-8:00end-8:20">8:00</td>
						<td class="start-2:00end-2:20">2:00</td>
					</tr>
					<tr>
						<td class="start-8:20end-8:40">8:20</td>
						<td class="start-2:20end-2:40">2:20</td>
					</tr>
					<tr>
						<td class="start-8:40end-9:00">8:40</td>
						<td class="start-2:40end-3:00">2:40</td>
					</tr>
					<tr>
						<td class="start-9:00end-9:20">9:00</td>
						<td class="start-3:00end-3:20">3:00</td>
					</tr>
					<tr>
						<td class="start-9:20end-9:40">9:20</td>
						<td class="start-3:20end-3:40">3:20</td>
					</tr>
					<tr>
						<td class="start-9:40end-10:00">9:40</td>
						<td class="start-3:40end-4:00">3:40</td>
					</tr>
					<tr>
						<td class="start-10:00end-10:20">10:00</td>
						<td class="start-4:00end-4:20">4:00</td>
					</tr>
					<tr>
						<td class="start-10:20end-10:40">10:20</td>
						<td class="start-4:20end-4:40">4:20</td>
					</tr>
					<tr>
						<td class="start-10:40end-11:00">10:40</td>
						<td class="start-4:40end-5:00">4:40</td>
					</tr>
					<tr>
						<td class="start-11:00end-11:20">11:00</td>
						<td class="start-5:00end-5:20">5:00</td>
					</tr>
					<tr>
						<td class="start-11:20end-11:40">11:20</td>
						<td class="start-5:20end-5:40">5:20</td>
					</tr>
					<tr>
						<td class="start-11:40end-12:00">11:40</td>
						<td class="start-5:40end-6:00">5:40</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="p-4">
			<table class="3">
				<thead>
					<tr>
						<th>AM</th>
						<th>PM</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="start-6:00end-6:20">6:00</td>
						<td class="start-12:00end-12:20">12:00</td>
					</tr>
					<tr>
						<td class="start-6:20end-6:40">6:20</td>
						<td class="start-12:20end-12:40">12:20</td>
					</tr>
					<tr>
						<td class="start-6:40end-7:00">6:40</td>
						<td class="start-12:40end-1:00">12:40</td>
					</tr>
					<tr>
						<td class="start-7:00end-7:20">7:00</td>
						<td class="start-1:00end-1:20">1:00</td>
					</tr>
					<tr>
						<td class="start-7:20end-7:40">7:20</td>
						<td class="start-1:20end-1:40">1:20</td>
					</tr>
					<tr>
						<td class="start-7:40end-8:00">7:40</td>
						<td class="start-1:40end-2:00">1:40</td>
					</tr>
					<tr>
						<td class="start-8:00end-8:20">8:00</td>
						<td class="start-2:00end-2:20">2:00</td>
					</tr>
					<tr>
						<td class="start-8:20end-8:40">8:20</td>
						<td class="start-2:20end-2:40">2:20</td>
					</tr>
					<tr>
						<td class="start-8:40end-9:00">8:40</td>
						<td class="start-2:40end-3:00">2:40</td>
					</tr>
					<tr>
						<td class="start-9:00end-9:20">9:00</td>
						<td class="start-3:00end-3:20">3:00</td>
					</tr>
					<tr>
						<td class="start-9:20end-9:40">9:20</td>
						<td class="start-3:20end-3:40">3:20</td>
					</tr>
					<tr>
						<td class="start-9:40end-10:00">9:40</td>
						<td class="start-3:40end-4:00">3:40</td>
					</tr>
					<tr>
						<td class="start-10:00end-10:20">10:00</td>
						<td class="start-4:00end-4:20">4:00</td>
					</tr>
					<tr>
						<td class="start-10:20end-10:40">10:20</td>
						<td class="start-4:20end-4:40">4:20</td>
					</tr>
					<tr>
						<td class="start-10:40end-11:00">10:40</td>
						<td class="start-4:40end-5:00">4:40</td>
					</tr>
					<tr>
						<td class="start-11:00end-11:20">11:00</td>
						<td class="start-5:00end-5:20">5:00</td>
					</tr>
					<tr>
						<td class="start-11:20end-11:40">11:20</td>
						<td class="start-5:20end-5:40">5:20</td>
					</tr>
					<tr>
						<td class="start-11:40end-12:00">11:40</td>
						<td class="start-5:40end-6:00">5:40</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- <div id='calendar'></div> -->
	<!-- <div class="alert"></div> -->
</body>
</html>