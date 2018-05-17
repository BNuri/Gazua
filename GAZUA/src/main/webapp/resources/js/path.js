



 

  
 //추천경로순으로 뿌리기
 function plusPath(a){
 	var contentid = a.contentId;
 	var contenttypeid = a.contentTypeId;
	 $.ajax({        
         url: 'callDetail.do',
         type: 'get',
         data : {"contentId" : contentid, "contentTypeId" : contenttypeid},
         dataType: 'json',
         success: function(data){
              var myItem = data.response.body.items.item;
                 var output = '<div class="pin ' + contentid + '" id="' + contentid + '" text-align:left>';
                 output += '<h4 id="title"><div class="glyphicon glyphicon-remove" id="d' + contentid + '" onclick="deletePin(this)"></div>' + a.title + '</h4>';
                 output += '</div>';
                 
                 $('#path').append(output);
         },
       error: function(XMLHttpRequest, textStatus, errorThrown) { 
           alert("Status: " + textStatus); alert("Error: " + errorThrown); 
       } 
	});
}
   
 
   //추천경로 구하기
   function getpath(){
		if(arr.length < 3){
			alert("3개 이상의 장소를 입력하시오.");
			return false;
		}
	   //마커 재배치
	   if(array!=null){
			setMarkers(null);
			setMarkersArr(map);
			}
	   $.ajaxSettings.traditional = true;
	   $.ajax({
		   url: 'getpath.do',
		   type: 'POST',
		   data: JSON.stringify(arr),
		   dataType: 'json',
		   contentType: 'application/json',
		   success: function(data){
			   console.log(data);
			   $('#path').empty();
			   //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!afterpath
			   //var arra = new Array();
			   //arra = data;
			   afterpath = data;
			   var linePath = [];
			   var bounds = new daum.maps.LatLngBounds();
				   $.each(afterpath, function(i, val){
					   linePath.push(new daum.maps.LatLng(val.mapy, val.mapx));
					   console.log(val);
					   plusPath(val);
					   
					   var latlng = new daum.maps.LatLng(val.mapy,val.mapx);
					   bounds.extend(latlng);
					   addMarker(latlng, val.title, val.contentId, val.contentTypeId, val.mapy, val.mapx);
				   });
				   console.log(linePath);

				   var polyline = new daum.maps.Polyline({
					   path: linePath, // 선을 구성하는 좌표배열 입니다
					   strokeWeight: 5, // 선의 두께 입니다
					   strokeColor: '#FFAE00', // 선의 색깔입니다
					   strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					   strokeStyle: 'solid' // 선의 스타일입니다
					   });
				   polyline.setMap(null);
				   polyline.setMap(map);
				   map.setBounds(bounds);
				   }
	   });
   }
 

   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   $(document)
   .ready(
         function() {
            $('[data-toggle=offcanvas]')
                  .click(
                        function() {
                           $(this).toggleClass(
                                 'visible-xs text-center');
                           $(this)
                                 .find('i')
                                 .toggleClass(
                                       'glyphicon-chevron-right glyphicon-chevron-left');
                           $('.row-offcanvas').toggleClass(
                                 'active');
                           $('#lg-menu').toggleClass(
                                 'hidden-xs').toggleClass(
                                 'visible-xs');
                           $('#xs-menu').toggleClass(
                                 'visible-xs').toggleClass(
                                 'hidden-xs');
                           $('#btnShow').toggle();
                        });
                  });


//행정구역 구분
$.getJSON("resources/json/seoul_gson.geojson", function(geojson) {

var data = geojson.features;
var coordinates = [];   //좌표 저장할 배열
var name = '';         //지역 구 이름
var gucode ='';         //행정구역 코드번호
$.each(data, function(index, val) {

coordinates = val.geometry.coordinates;
name = val.properties.SIG_KOR_NM;
gucode = val.properties.orig_ogc_fid;

displayArea(coordinates, name, gucode);
//console.log(coordinates);
})
})
var sigungucode ='';         //function recommend()의 AJAX로 지역구 코드를 보내기 위한 변수
var polygons=[];            //function 안 쪽에 지역변수로 넣으니깐 폴리곤 하나 생성할 때마다 배열이 비어서 클릭했을 때 전체를 못 없애줌.  그래서 전역변수로 만듦.
//행정구역 폴리곤

function displayArea(coordinates, name, gucode) {

var path = [];         //폴리곤 그려줄 path
var points = [];      //중심좌표 구하기 위한 지역구 좌표들

$.each(coordinates[0], function(index, coordinate) {      //console 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
var point = new Object(); 
point.x = coordinate[1];
point.y = coordinate[0];
points.push(point);
path.push(new daum.maps.LatLng(coordinate[1], coordinate[0]));         //new daum.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가
})

// 다각형을 생성합니다 
var polygon = new daum.maps.Polygon({
map : map, // 다각형을 표시할 지도 객체
path : path,
strokeWeight : 2,
strokeColor : '#004c80',
strokeOpacity : 0.8,
fillColor : '#fff',
fillOpacity : 0.7
});

polygons.push(polygon);         //폴리곤 제거하기 위한 배열

// 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
// 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
daum.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
polygon.setOptions({
   fillColor : '#09f'
});

customOverlay.setContent('<div class="area">' + name + '</div>');

customOverlay.setPosition(mouseEvent.latLng);
customOverlay.setMap(map);
});

// 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
daum.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {

customOverlay.setPosition(mouseEvent.latLng);
});

// 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
// 커스텀 오버레이를 지도에서 제거합니다 
daum.maps.event.addListener(polygon, 'mouseout', function() {
polygon.setOptions({
   fillColor : '#fff'
});
customOverlay.setMap(null);
});

// 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 해당 지역 확대, 시군구코드 넘겨줌
daum.maps.event.addListener(polygon, 'click', function() {

  // 현재 지도 레벨에서 2레벨 확대한 레벨
var level = map.getLevel()-2;

  // 지도를 클릭된 폴리곤의 중앙 위치를 기준으로 확대합니다
  map.setLevel(level, {anchor: centroid(points), animate: {
      duration: 350
  }});         
  
  sigungucode = gucode;                  

  deletePolygon(polygons);               //폴리곤 제거      
});

}

//centroid 알고리즘 (폴리곤 중심좌표 구하기 위함)
function centroid (points) {
var i, j, len, p1, p2, f, area, x, y;

area = x = y = 0;

for (i = 0, len = points.length, j = len - 1; i < len; j = i++) {
      p1 = points[i];
      p2 = points[j];

      f = p1.y * p2.x - p2.y * p1.x;
      x += (p1.x + p2.x) * f;
      y += (p1.y + p2.y) * f;
      area += f * 3;
}

return new daum.maps.LatLng(x / area, y / area);
}

var recPath = []; //라인 이을 추천 경로들의 배열
var polylines = []; //라인 담을 배열 

var arr = new Array(); //선택한 객체들 모음 
var markersArr = [];  //클릭해서 선택한 배열(빨간색)
var markers = []; //검색 결과 마커들 모음 (노란색)
var afterpath = []; //검색 후 결과 배열
var array = new Array(); //

var selectedMarker = null;

//마커 이미지와 크기지정
var marker_width = 24,
marker_height = 35,
over_marker_width = 30,
over_marker_height = 40,
sprite_marker_url = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
click_marker_url = "markerStarRed.png";

var markerSize = new daum.maps.Size(marker_width, marker_height), 
overMarkerSize = new daum.maps.Size(over_marker_width, over_marker_height),
spriteImageSize = new daum.maps.Size(marker_width, marker_height);

function createMarkerImage(src, size){
var markerImage = new daum.maps.MarkerImage(src, size);
return markerImage;
}

var normalImage = createMarkerImage(sprite_marker_url, markerSize),
overImage = createMarkerImage(sprite_marker_url, overMarkerSize),
clickImage = createMarkerImage(click_marker_url, markerSize);

function addMarker(position, title, contentid, contenttypeid) {

// 마커를 생성합니다
marker = new daum.maps.Marker({
contentId: contentid,
map : map, // 마커를 표시할 지도
position : position, // 마커를 표시할 위치
title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
image : normalImage
// 마커 이미지 
});

//만약 arr에 존재하는 marker라면 빨간색 마커로 생성하겠다. 그리고 markerArr에 추가하겠다.
if(arr.findIndex(function(item){return item.contentId === contentid})>-1){
	marker.setImage(clickImage);
	markersArr.push(marker);
}

// 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
marker.normalImage = normalImage;

markers.push(marker); //배열에 생성된 마커 추가
//recPath.push(position); //추천 경로 배열에 좌표 추가

//마커에 mouseover 이벤트 등록    
daum.maps.event.addListener(marker, 'mouseover', function(){
	//클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면 마커의 이미지를 오버 이미지로 변경
	if(!selectedMarker || selectedMarker != marker){
		if(arr.findIndex(function(item){return item.contentId === contentid})>-1){return false;}
		if($.inArray(marker, markersArr) != -1 ){return false;}
		marker.setImage(overImage);
	}
});

// 마커에 mouseout 이벤트를 등록합니다
daum.maps.event.addListener(marker, 'mouseout', function() {
 // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면 마커의 이미지를 기본 이미지로 변경합니다
 if (!selectedMarker || selectedMarker !== marker) {
		if($.inArray(marker, markersArr) != -1 ){return false;}
		if(arr.findIndex(function(item){return item.contentId === contentid})>-1){return false;}
     marker.setImage(normalImage);
 }
});

//선택한 마커를 생성하고 선택마커 배열에 추가하는 함수
function createArrMarkers(marker){
		marker.setImage(clickImage);
		markersArr.push(marker);
		marker.setMap(map);
}


//마커 클릭시! 
daum.maps.event.addListener(marker, 'click', function() {
 
 //wrapWindowByMask();//팝업 레이어 검정 배경
   
 // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면 마커의 이미지를 클릭 이미지로 변경합니다
 if (!selectedMarker || selectedMarker !== marker) {

     // 클릭된 마커 객체가 null이 아니면 클릭된 마커의 이미지를 기본 이미지로 변경하고
     //!!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

     // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
     marker.setImage(clickImage);
     
     //선택한 목록에 이미 존재한다면 삭제.
 }
 var i = arr.findIndex(function(item){return item.contentId === contentid});
 if(i > -1){
	   
 	//이미지 노말로 변경
	   marker.setImage(normalImage);
	   
	   //arr에서 삭제.
	   arr.splice(i, 1);
	   markersArr.splice(i, 1);
	   
	   //if(afterpath.findIndex(function(item){return item.contentId === contentid})>-1){
		   //console.log("이미지 삭제");
		   //marker.setMap(null);
		   //}
	   
	   //div 지우기
	   var garbage = document.getElementById(contentid);
	   document.getElementById('path').removeChild(garbage);
	   
	   return false;
 }

// 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
selectedMarker = marker;
console.log(marker);
var obj = new Object();
obj.contentId = contentid;
obj.contentTypeId = contenttypeid;
//obj.mapy = mapy;
//obj.mapx = mapx;
obj.mapy = position[0];
obj.mapx = position[1];
	  
obj.title = title;
arr.push(obj);
createArrMarkers(marker);

$.ajax({        
    url: 'callDetail.do',
    type: 'get',
    data : {"contentId" : contentid, "contentTypeId" : contenttypeid},
    dataType: 'json',
    success: function(data){
         var myItem = data.response.body.items.item;
            var output = '<div class="pin" value="'+ contentid + '" id="' + contentid + '" text-align:left>';
            	output += '<h4 id="title">' + title + '</h4>';
            var outputTitle = '<div class="pin" value="'+ contentid + '" id="' + contentid + '" text-align:left>';
            	outputTitle += '<h4 id="title"><div class="glyphicon glyphicon-remove" id="d' + contentid + '" onclick="deletePin(this)"></div>' + title + '</h4></div>';
            if(contenttypeid == 12){
                    output += '<p class="p" >'+'주차장 : ' + myItem.parking+'</p>';
                    output += '<p class="p" >' +'휴무일 : ' + myItem.restdate + '</p>';
                    output += '<p class="p" >' +'연락처 : ' + myItem.infocenter + '</p>';
            }else if(contenttypeid == 14){
                    output += '<p class="p" >'+'입장료 : ' + myItem.usefee+'</p>';
                    output += '<p class="p" >'+'운영시간 : ' + myItem.usetimeculture+'</p>';
                    output += '<p class="p" >' +'휴무일 : ' + myItem.restdateculture + '</p>';
                    output += '<p class="p" >' +'연락처 : ' + myItem.infocenterculture + '</p>';
            }else if(contenttypeid == 15){
                    output += '<p class="p" >'+'행사 장소 : ' + myItem.eventplace+'</p>';
                    output += '<p class="p" >'+'행사 일정 : ' + myItem.eventstartdate + '~' + myItem.eventenddate +'</p>';
                    output += '<p class="p" >' +'행사 시간 : ' + myItem.playtime + '</p>';
                    output += '<p class="p" >' +'주최처 : ' + myItem.sponsor1 + " tel) " + myItem.sponsor1tel + '</p>';
            }else if(contenttypeid == 28){
                    output += '<p class="p" >'+'운영시간 : ' + myItem.usetimeleports+'</p>';
                    output += '<p class="p" >' +'연락처 : ' + myItem.infocenterleports + '</p>';
            }else if(contenttypeid == 32){
                    output += '<p class="p" >'+'예약 : ' + myItem.reservationurl+'</p>';
                    output += '<p class="p" >' +'시설 : ' + myItem.subfacility + '</p>';
                    output += '<p class="p" >' +'연락처 : ' + myItem.infocenterlodging + '</p>';
            }else if(contenttypeid == 38){
                    output += '<p class="p" >'+'취급물품 : ' + myItem.saleitem+'</p>';
                    output += '<p class="p" >'+'운영시간 : ' + myItem.opentime+'</p>';
                    output += '<p class="p" >' +'휴무일 : ' + myItem.restdateshopping + '</p>';
                    output += '<p class="p" >' +'연락처 : ' + myItem.infocenter + '</p>';
            }else if(contenttypeid == 39){
                    output += '<p class="p" >'+'메뉴 : ' + myItem.treatmenu+'</p>';
                    output += '<p class="p" >'+'운영시간 : ' + myItem.opentimefood+'</p>';
                    output += '<p class="p" >' +'휴무일 : ' + myItem.restdatefood + '</p>';
                    output += '<p class="p" >' +'연락처 : ' + myItem.infocenterfood + '</p>';
            }
            output += '</div>';
            $('#path').append(outputTitle);
            //$('#window').html(output);
    },
  error: function(XMLHttpRequest, textStatus, errorThrown) { 
      alert("Status: " + textStatus); alert("Error: " + errorThrown); 
  } 
});
});



////마커 생성과 동시에 선그림
//var polyline = new daum.maps.Polyline({
//path : recPath, // 선을 구성하는 좌표배열 입니다
//strokeWeight : 3, // 선의 두께 입니다
//strokeColor : '#db4040', // 선의 색깔입니다
//strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
//strokeStyle : 'solid' // 선의 스타일입니다
//});
//
//polyline.setMap(map); //지도에 라인 추가
//polylines.push(polyline); //배열에 라인 담기 

}

//지도 위 표시되고 있는 마커 제거
function deleteMarker() {
for (var i = 0; i < markers.length; i++) {
markers[i].setMap(null);
}
markers = [];
}

//지도 위 표시되고 있는 라인 제거
function deletePolyLine() {
for (var i = 0; i < polylines.length; i++) {
polylines[i].setMap(null);
}
polylines = [];
recPath = []; //라인 이어줄 좌표들 있는 배열 초기화
}

//지도 위 표시되고 있는 폴리곤 제거
function deletePolygon(polygons) {
for (var i = 0; i < polygons.length; i++) {
polygons[i].setMap(null);
}
polygons = [];
}

//팝업 레이어
function wrapWindowByMask() {

// 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
$('#mask').click(function() {
$(this).hide();
$('#window').hide();
});

var maskHeight = $('#map').height();
var maskWidth = $('#map').width(); //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.

$('#mask').css({
'width' : maskWidth,
'height' : maskHeight
}); //마스크의 투명도 처리 
$('#mask').fadeTo("slow", 0.8);

var left = ($('#map').scrollLeft() + ($('#map').width() - $('#window')
   .width()) / 2);
var top = ($('#map').scrollTop() + ($('#map').height() - $('#window')
   .height()) / 2);

$('#window').css({
'left' : left,
'top' : top,
'position' : 'absolute'
});

$('#window').show();
}

//경로 추천
function recommend() {

$.ajax({
      url : 'getPath.do',
      type : 'get',
      dataType : 'json',
      data : {'sigungucode' : sigungucode},
      success : function(jsonData) {
      	deleteMarker();
         var path = jsonData.path;
         var sidePath = "";
         recPath = [];

         for (var i = path.length - 1; i >= 0; i--) {
            for (var j = 0; j < positions.length; j++) {
               if (path[i] == (positions[j].contentid)) {
                  addMarker(positions[j].latlng,
                        positions[j].title,
                        positions[j].contentid,
                        positions[j].contenttypeid);

                  sidePath += "<a href='javascript:panTo("
                        + positions[j].mapy + ","
                        + positions[j].mapx + ")'>"
                        + positions[j].title + "</a>" + "</br>";

                  
                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  //arr.push(positions[j]);
                  
                  
                  console.log(positions[j]);
                  recPath.push(new daum.maps.LatLng(positions[j].mapy,positions[j].mapx));
               }
            }
         }
         $('#pathlist').html(sidePath); //경로 목록 찍어줌
         
         drawLine(recPath);
      },
      error : function(XMLHttpRequest, textStatus, errorThrown) {
         //          alert("Status: " + textStatus); alert("Error: " + errorThrown);  
      }
   });

}

//추천경로 구하기
function getpath(){
	if(arr.length < 3){
		alert("3개 이상의 장소를 입력하시오.");
		return false;
	}
 //마커 재배치
 if(array!=null){
		setMarkers(null);
		setMarkersArr(map);
		}
 $.ajaxSettings.traditional = true;
 $.ajax({
	   url: 'getpath.do',
	   type: 'POST',
	   data: JSON.stringify(arr),
	   dataType: 'json',
	   contentType: 'application/json',
	   success: function(data){
		   console.log(data);
		   $('#path').empty();
		   //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!afterpath
		   //var arra = new Array();
		   //arra = data;
		   deletePolyLine();
		   recPath = [];
		   afterpath = data;
		   var sidePath = '';
		   var bounds = new daum.maps.LatLngBounds();
			   $.each(afterpath, function(i, val){
				   recPath.push(new daum.maps.LatLng(val.mapy, val.mapx));
				   console.log(val);
				   plusPath(val);
				   
				   var latlng = new daum.maps.LatLng(val.mapy,val.mapx);
				   bounds.extend(latlng);
				   addMarker(latlng, val.title, val.contentId, val.contentTypeId);
				   
				   sidePath = "<a href='javascript:panTo(" + val.mapy + "," + val.mapx + ")'>" + val.title + "</a>" + "</br>";
			   });
			   console.log(linePath);

			   var polyline = new daum.maps.Polyline({
				   path: recPath, // 선을 구성하는 좌표배열 입니다
				   strokeWeight: 3, // 선의 두께 입니다
				   strokeColor: '#db4040', // 선의 색깔입니다
				   strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				   strokeStyle: 'solid' // 선의 스타일입니다
				   });
			   polyline.setMap(map);
			   polylines.push(polyline);
			   map.setBounds(bounds);
			   $('#pathlist').html(sidePath);
			   }
 });
}


//클릭하면 해당 위치로 이동 (인포윈도우)
function panTo(mapy, mapx) {

// 이동할 위도 경도 위치를 생성합니다 
var moveLatLon = new daum.maps.LatLng(mapy, mapx);

// 지도 중심을 부드럽게 이동시킵니다
// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
map.panTo(moveLatLon);
}

//추천경로순으로 뿌리기
function plusPath(a){
var contentid = a.contentId;
var contenttypeid = a.contentTypeId;
$.ajax({        
  url: 'callDetail.do',
  type: 'get',
  data : {"contentId" : contentid, "contentTypeId" : contenttypeid},
  dataType: 'json',
  success: function(data){
       var myItem = data.response.body.items.item;
          var output = '<div class="pin ' + contentid + '" id="' + contentid + '" text-align:left>';
          output += '<h4 id="title"><div class="glyphicon glyphicon-remove" id="d' + contentid + '" onclick="deletePin(this)"></div>' + a.title + '</h4>';
          output += '</div>';
          
          $('#path').append(output);
  },
error: function(XMLHttpRequest, textStatus, errorThrown) { 
    alert("Status: " + textStatus); alert("Error: " + errorThrown); 
} 
});
}

//지도 검색
function searchMap(){
if(polygons!=null){
	deletePolygon(polygons); 
}
var keyword = $('#searchMap').val();
if(keyword == null){
	alert("검색어를 입력하세요.");
	return false;
}
if(array!=null){
setMarkers(null);
setMarkersArr(map);
}
$.ajax({
	url:'search.do',
	type: 'POST',
	data: {keyword:keyword},
	success: function(data){
		console.log(data);
		array = data;
		if(array.length==0){
			alert("검색 결과가 없습니다.");
			return false;
		}
		var bounds = new daum.maps.LatLngBounds();
		
		$.each(array, function(i, val){
			var latlng = new daum.maps.LatLng(val.mapY,val.mapX);
			bounds.extend(latlng);
			addMarker(latlng, val.title, val.contentId, val.contentTypeId);
		})
		map.setBounds(bounds);
		
		//keyword값 ''로
		$('#searchMap').val('');
	}
})
}

function setMarkers(map){
$.each(markers,function(i, val){
	 val.setMap(map);
})
}

function setMarkersArr(map){
$.each(markersArr,function(i,val){
	val.setMap(map);
})
}

//엔터로 검색
function enterkey(){
if(window.event.keyCode == 13){
	searchMap();
}
}

function drawLine(recPath){
deletePolyLine();

var polyline = new daum.maps.Polyline({
path : recPath, // 선을 구성하는 좌표배열 입니다
strokeWeight : 3, // 선의 두께 입니다
strokeColor : '#db4040', // 선의 색깔입니다
strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
strokeStyle : 'solid' // 선의 스타일입니다
});

polyline.setMap(map); //지도에 라인 추가
polylines.push(polyline); //배열에 라인 담기 
}

//엑스표 누르면 arr와 div 삭제
function deletePin(event){
console.log("event : " + event);
console.log(event);
var cid = (event.id).replace('d','');

//arr에서 지우기
var i = arr.findIndex(function(item){return item.contentId === cid});
//이미지 노말로 바꾸기
markersArr[i].setImage(normalImage);
console.log("arr에서의 index");
console.log(i);
if(i > -1){//엑스표 누른게 arr배열에 있다면
	
	//arr에서 삭제
	arr.splice(i, 1);
	console.log("markersArr[i] : ");
	console.log(markersArr[i]);
	//마커 삭제
	//markersArr[i].setMap(null);

	//markersArr에서 삭제
	markersArr.splice(i, 1);
	
	
	//console.log("getpath의 결과?");
	//console.log(afterpath.findIndex(function(item){return item.contentId === cid}));
	//if(afterpath.findIndex(function(item){return item.contentId === cid})>-1){//getpath의 결과 일 경우. 마커를 삭제한다 
		//markersArr[i].setMap(null);
	//}else{//아닐 경우, 마커의 이미지를 normalImage로 바꾼다.
		//markersArr[i].setImage(normalImage);
	//}
	
	
	
	
}
console.log("markersArr : ");
console.log(markersArr);

//div 지우기
var top = document.getElementById('path');
var garbage = document.getElementById(cid);
document.getElementById('path').removeChild(garbage);
}

//경로 새로고침
function newpath(){
//마커지우기
setMarkers(null);
setMarkersArr(null);

//선 지우기
polyline.setMap(null);

//배열 다 비우기
arr.clear();
markersArr.clear();
markers.clear();

//div 지우기
$('#path').empty();
}
