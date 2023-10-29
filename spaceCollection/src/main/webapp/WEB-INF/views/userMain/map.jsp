<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html >
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

*{
	font-family: 'Pretendard-Regular';
}

#mapWrapper{
	width: 100%;
	height: 95%;
	left:0;
	top:0;
	margin:0;
	padding:0;
	position:absolute;
}
.carousel-item {
    position: relative;
    display: none;
    float: left;
    width: 100%;
    backface-visibility: hidden !important;
    transition: transform .6s ease-in-out;
}
 .mapHeader{
 	background:#193D76;
 	padding-bottom:0.5%;
 	padding-top:0.5%;
 	font-family: 'Noto Sans KR', sans-serif;
 }
 .spaceType{
	color : white;
	float:left; 
  	margin-left : 2%;
  	width: 10%;
  	1.5%
 }
 .closeBtn{
 	font-weight: bold;
 	font-size:30px;
 	color : white;
 	float:right;
	justify-content: center;
	position: absolute;
  	top: 16%;
  	margin-left:98.7%;
 }
 .goSpace{
 	font-weight:bolder;
 	font-size:18px;
 	text-decoration: none;
 	color :#193D76 ;
 }
 .goSpace:hover{
 	text-decoration: none;
 	color : #ffd014;
 }
 .spaceType h4{
 	display:inline-block;
 	margin-right:10%;
 	margin-top: 5.1%;
 }
 #sideBarBt{
 	display:inline-block;
 	padding:1% 1% 1% 1%;
 	margin-bottom:1%;
 	margin-left:25%;
 }
 .closeMap{
 	font-size:30px;
 	color:white;
 	font-weight:bold;
 	text-decoration: none;
 	float:right;
 	margin-right:2%;
 }
 .closeMap:hover{
 	color:#ffd014;
 }
 #sideBar{
 	font-size:21px;
 	background:#ffd014;
 	color:black;
 	padding:0.5% 2% 0.5% 2%;
 	font-weight: bold;
 	border:1px solid white;
 	display: inline-block;
 }
  @keyframes fadeInDown {
        0% {
            opacity: 0;
            transform: translate3d(0, 15%, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    	}
	 .center{background: #193D76; color:white; padding:14% 24% 14% 24%; text-decoration:none; font-size:18px;border:white; border-radius: 2rem;}
	 .center:hover{color:black; background: #ffd014}
	    
 	.wrap2 {animation : fadeInDown 0.5s;cursor:auto;border:3px solid #ffd014;border-top: 4px solid #ffd014; border-radius:1rem; position: absolute;left: 0;bottom: 40px;width: 330px;height: 350px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap2 * {padding: 0;margin: 0;}
    .wrap2 .info2 {width: 330px;height: 380px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap2 .info2:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info2 .title {background: white;color:white;
    				font-size: 18px;font-weight: bold;}
    .info2 .close {color: black !important;font-size:25px; float: right;
    margin-right: 18px;}
    .info2 .close:hover {cursor: pointer; color : #ffd014 !important;}
    .info2 .body2 {position: relative;overflow: hidden;}
    .info2 .desc {position: relative; margin-top:5px;margin-bottom:15px; margin-left:10px; font-weight: bold;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;margin-top:6px;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info2 .link {color: #5085BB;}
    
    
    
</style>
<header>
	
	<c:if test="${!empty spaceMap}">
		<c:set var="space" value="${spaceMap}" />
	</c:if>
</header>
<body>
<div id="mapWrapper">
	<div class = "mapHeader">
		<div class = "spaceType">
			<h4 style="font-weight: bold;">${title}</h4>
		</div>
			<button class="btn btn-primary" id="sideBar" type="button" data-bs-toggle="offcanvas" id="sideBarBt"data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
			  공간 리스트&nbsp;&nbsp;<i id="sideBar-icon" class="bi bi-layout-sidebar-inset"></i>
			</button>
		<a class="closeMap" href="#" onclick="goBack()">
			X
		</a>
	</div>
	<div id="map" style="width:100%;height:100%;">
		<%-- <c:set var="paramName" value="" />
			<c:set var="paramValue" value="" />
			<c:if test="${!empty param.spaceTypeNo}">
				<c:set var="paramName" value="spaceTypeNo"/>
				<c:set var="paramValue" value="${param.spaceTypeNo}"/>
			</c:if>
			<c:if test="${!empty param.spaceName}">
				<c:set var="paramName" value="spaceName"/>
				<c:set var="paramValue" value="${param.spaceName}"/>
			</c:if>
			<c:if test="${!empty param.order}">
				<c:set var="paramName" value="order"/>
				<c:set var="paramValue" value="${param.order}"/>
			</c:if>
			<c:if test="${!empty param.page}">
				<c:set var="paramName" value="page"/>
				<c:set var="paramValue" value="${param.page}"/>
			</c:if>
			<c:param name="${paramName}" value="${paramValue}"></c:param>
		--%>
		<c:import url="/mapSideMenu">
		</c:import>
	</div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=daa469d4ff476714bf26432374f5ebff"></script>
<script>
function addComma(value){
    value = value+"";
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return value; 
}

var mapContainer = document.getElementById('map'), // 지도의 중심좌표
mapOption = { 
    center: new kakao.maps.LatLng(37.498095, 127.027610), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
}; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var overlays = [];
var customOverlays = [];
var contents = [];
//33.450701+ (i/10)
//126.570667 + (i/10)
var a = 0;
<c:forEach var ="i" items="${spaceMap}">	//지도에 마커를 표시합니다 
	/*
	var marker = new kakao.maps.Marker({
	map: map, 
	position: new kakao.maps.LatLng(${i.key.latitude} , ${i.key.longitude})
	});
	*/
	
	//커스텀 오버레이에 표시할 컨텐츠 입니다
	//커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	//별도의 이벤트 메소드를 제공하지 않습니다 
	
	
	// 결과를 저장할 객체 생성
	
	
	
		// 정규 표현식과 매치하여 키-값 쌍 추출
		var space = {};
		var tempPrice = "${i.key}";
		var price = tempPrice.substr(tempPrice.lastIndexOf('=')+1, tempPrice.lastIndexOf('}') - tempPrice.lastIndexOf('=')-1);
		var avgPrice = parseInt(price);
		
		input = "${i.key}";
		var keyValueRegex = /(\w+)=(.*?)(?=, \w+=|$)/g;
		var matches = input.matchAll(keyValueRegex);

		for (const match of matches) {
		    var key = match[1];
		    var value = match[2];

		    // 값이 따옴표로 감싸져 있지 않으면 따옴표로 감싸기

		    // 결과 객체에 키-값 쌍 추가
		    space[key] = value;
		}
	
	console.log(space);
	var imgStr = '${i.value}';
	imgStr = imgStr.substr(1,imgStr.length-2);
	var img = imgStr.split(', ');
	console.log(img.length);
	
var content = '<div class="wrap2">' + 
	        '    <div class="info2">' + 
	        '        <div class="title">' + 
	        '        </div>' + 
	        '        	<div class="body2">' + 
						'	<div id="carouselExample" class="carousel carousel-fade">'+
					'		  	<div class="carousel-inner">';
								
								img.forEach(function(item,index){
									console.log(item);
									if(index != 0){
										content += '   <div class="carousel-item">'+
								  				'  			<img src="<c:url value="/space_images/'+item+'"/>" class="d-block" style="width:330px; height:220px;  box-shadow: -15px -15px 5px 5px;" alt="...">'+
								   				' 		</div>';
									}else{
										content += '   	<div class="carousel-item active">'+
											  		'  		<img src="<c:url value="/space_images/'+item+'"/>" class="d-block" style="width:330px; height:220px; box-shadow: -15px -15px 5px 5px;" alt="...">'+
											   		' 	</div>';
									}									
								});
					content += '			</div>'+
						'  			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">'+
					 	'		   		<span class="carousel-control-prev-icon" aria-hidden="true"></span>'+
					  '					<span class="visually-hidden">Previous</span>'+
						 ' 			</button>'+
						 ' 			<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">'+
						 '   			<span class="carousel-control-next-icon" aria-hidden="true"></span>'+
						 '   			<span class="visually-hidden">Next</span>'+
						 ' 			</button>'+
						'		</div>'+
	        '            <div class="desc">' + 
	        	'			<a class = "goSpace" href = "<c:url value = "/detail?spaceNum='+space.spaceNum+'"/>">'+space.spaceName+'</a> '+
	        '                <div class="ellipsis">'+space.spaceAddress + '&nbsp;' + space.spaceAddressDetail + '&nbsp;' + space.spaceLocation+'</div>' + 
	        '                <div class="jibun ellipsis" style="font-weight:bold; margin-bottom:5px;font-size:14px">(우) ' + space.spaceZipcode + ' (지번) 영평동 2181</div>' + 
	        '                <div><h5 class = "h5" style="color:#193D76;font-weight:bold;display:inline-block;">'+addComma(price)+'원</h5>'+
		           '			<div class="close" onclick="closeOverlay()" title="닫기" style="color:black; display:inline-block;">X</div>'+
	           '            </div>' + 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>';

	
	
    var markerPosition = new kakao.maps.LatLng(space.latitude, space.longitude); // 마커 위치
    
	var overlayz = new kakao.maps.CustomOverlay({
		content: content,
		map: map,
		position: markerPosition       
	});
	
	contents.push(content);
	overlays.push(overlayz);
	
	kakao.maps.event.addListener(overlayz, 'dragstart', function () {
        map.setDraggable(false);
    });
    kakao.maps.event.addListener(overlayz, 'dragend', function () {
        map.setDraggable(true);
    });
	

	
	var markerContent = '<div class ="overlabel" style="margin : -16px 0px 0px -10px">'
				        +  '<span class="left"></span>'
				        +	'<a href="javascript:void(0);"onclick="createOverlayToggleFunction('+overlays.length+')"  class="center">'
					   	+	addComma(price)	
				        +	'원</a>'
				        +	'<span class="right"></span>'
				        +	'</div>';

	var customOverlay = new kakao.maps.CustomOverlay({
	  position: markerPosition,
	  content: markerContent,
	});
	customOverlays.push(customOverlay);
	customOverlay.setMap(map);
</c:forEach>
closeOverlay();


//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function createOverlayToggleFunction(overlayIndex) {
    var overlay = overlays[overlayIndex-1];
    if (overlay) {
        overlay.setMap(map);
        for(var i = 0; i < overlays.length; i++){
        	if(i != overlayIndex-1){
        		overlays[i].setMap(null); // 모든 overlay를 닫음		
        	}
        }
    }
}

function closeOverlay() {
    for (var i = 0; i < overlays.length; i++) {
        overlays[i].setMap(null); // 모든 overlay를 닫음
    }
}

function goBack(){
	history.go(-1);
}

function findOverlayAtLocation(targetX, targetY, tolerance = 1e-6) {
	  for (var i = 0; i < overlays.length; i++) {
	    var overlay = overlays[i];
	    var overlayPosition = overlay.getPosition();

	    // 부동소수점 숫자를 비교할 때 일정한 범위 내에 있는지 확인합니다.
	    if (
	      Math.abs(overlayPosition.getLat() - targetX) < tolerance &&
	      Math.abs(overlayPosition.getLng() - targetY) < tolerance
	    ) {
	      return i+1; // 원하는 위치에 커스텀 오버레이를 찾았을 경우 반환합니다.
	    }
	  }
	  return null; // 원하는 위치에 커스텀 오버레이가 없을 경우 null을 반환합니다.
	}

function panTo(x,y) {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(x, y);
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    
    var overlayAtLocation = findOverlayAtLocation(x, y);
    if (overlayAtLocation) {
      // 원하는 위치에 커스텀 오버레이를 찾았을 경우 조작 또는 사용합니다.
        createOverlayToggleFunction(overlayAtLocation);
    } else {
      console.log('해당 위치에 커스텀 오버레이를 찾을 수 없습니다.');
    }
        $('#sideBarClose').click();
    map.panTo(moveLatLon);    
}        
</script>
</html>