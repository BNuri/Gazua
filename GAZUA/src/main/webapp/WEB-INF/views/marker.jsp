<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>여러개 마커 표시하기</title>
        <style>

        #sidemenu{
           	width:450px;
           	height:100vh;
           	padding-top:70px;
        	float:right;  
        	background-color:#393939;      		
        }
		#map{
		 	position: absolute;
		 	/* padding-left: 100px; */
			width: calc(100% - 450px);
			height:100%;
			float:left;
		}        
        
        *{ margin: 0; padding: 0;}
		.accodian {list-style: none }
		.accodian--box { margin-bottom: 5px;}
		.accodian--box h3 { background: #333; padding: 5px; color: #fff; cursor: pointer}
		.accodian--box h4 { background: #ccc; padding: 5px; display: none; }
    </style>	
    
</head>
<body>
<div id="map"></div>




	<div id="setDiv">
		<div id="mask"></div>
		<div id="window"></div>
		<div id="map"></div>	
		<div id="sidemenu">	        
			<ul class="accodian">
				<li class="accodian--box">
					<h3>모바일 웹을 이용하려면</h3>
					<input type="submit" value="거리별 추천">
				</li>
				<li class="accodian--box">
					<h3>질문 있어요~~</h3>
					<h4>답변입니다요~~</h4>
				</li>
				<li class="accodian--box">
					<h3>Lorem ipsum dolor sit.</h3>
					<h4>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Dignissimos, voluptatibus?</h4>
				</li>
			</ul>
		</div>		
	</div>
	
	



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1993b1e3b0175008e57aef80bfdd05b0"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {title : "카카오", latlng: new daum.maps.LatLng(33.450705, 126.570677)},
     {title : "제주공항", latlng : new daum.maps.LatLng(33.5066211, 126.492810)},
     {title : "테마파크", latlng : new daum.maps.LatLng(33.2906595, 126.322529)},
     {title : "수목원", latlng : new daum.maps.LatLng(33.4696849, 126.493305)}
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title,
        image : markerImage // 마커 이미지 
    });
}


var linePath;
var lineLine = new daum.maps.Polyline();
var distance;
	
	for (var i = 0; i < positions.length; i++) {
		if (i != 0) {
			linePath = [ positions[i - 1].latlng, positions[i].latlng ]
		}
		;
		lineLine.setPath(linePath);

		var clickLine = new daum.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : linePath,
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});

		distance = Math.round(lineLine.getLength());
		displayCircleDot(positions[i].latlng, distance);
		if(i!=0){
//		alert(positions[i-1].title + ":" + positions[i].title + ":" + distance);
		}
		//경로 추천 클릭하면 childappend로 hidden 추가해서 java파일에 post전
		//AJAX JSON으로 {"title":"경로순서"} 받기  -- JS파일 생성
				
	}



	
	function displayCircleDot(position, distance) {
		if (distance > 0) {
			// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
			var distanceOverlay = new daum.maps.CustomOverlay({
				content : '<div class="dotOverlay">거리 <span class="number">'
						+ distance + '</span>m</div>',
				position : position,
				yAnchor : 1,
				zIndex : 2
			});

			// 지도에 표시합니다
			distanceOverlay.setMap(map);
		}

	}
</script>
</body>
</html>