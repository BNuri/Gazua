<%@page import="com.project.sns.addr.vo.AddrVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
   href="resources/facebook/assets/css/bootstrap2.css">
<link rel="stylesheet"
   href="resources/facebook/assets/css/facebook2.css">
<link rel="stylesheet"
   href="resources/css/map.css">
<script type="text/javascript" src="resources/facebook/assets/js/jquery.js"></script>
<script type="text/javascript" src="resources/facebook/assets/js/bootstrap.js"></script>
<script type="text/javascript">
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
</script>
<style>

.pin{
	background:white;
	overflow:hidden;
	height: auto;
	border: 1px solid black;
	clear: left;
	border-radius: 12px;
	}
	
.p{
	 text-align:left;
	}
	
.sideBtn{
	background-color: #4CAF50;
	color: white;
	padding: 12px 30px;
	font-size: 16px;
	border-radius: 12px;
	width: auto;
	}
	
#searchBox{
	position: absolute;
	float: right;
	background-color: #4CAF50;
	height : 50px;
	top: 70px;
	right: 25%;
	
	}

.glyphicon-remove{
	float: right;
	font-size: 20px;
	right: 3%;
	}
	

</style>
<title>TourSNS</title>
</head>
<body>   

<div class="wrapper">
      <div class="box">
         <div class="row row-offcanvas row-offcanvas-left">

               <!--
                  col-sm-12, col-xs-12 둘 다 같은 width 설정 class.
                  col-xs-12는 disable된 상태
                  
                  맨 뒤의 숫자를 변경하면(col-sm-10) 회색 화면의 가로가 줄어들어 
                  백그라운드의 회색 화면이 나타남.                  
                -->
            <div id="main" class="column col-sm-12 col-xs-12">
               
               <!-- 
                  Topbar. 기존 부트스트랩보다 height를 늘림.
                -->
               <div class="navbar navbar-blue navbar-static-top">
                  <!-- 
                     아이콘 영역. 기존 부트스트랩보다 margin-top을 늘림.
                   -->
                  <div class="navbar-header">
                     <!-- 토글용 버튼인데.... collapse되어있어 비활성화된 듯 함. -->
                     <button class="navbar-toggle" type="button"
                        data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle</span>
                     </button>
                     <!-- 아이콘. margin-top을 늘림. -->
                     <a href="main.do" class="navbar-brand logo">N</a>
                  </div>
                  
                  <!-- 아이콘을 제외한 오른쪽 영역. -->
                  <nav class="navbar-collapse" role="navigation">
                     <!-- 검색 폼. -->
                     <div class="search_wrap">
                        <form class="navbar-form navbar-left" method="post" onsubmit="return checkgo();" id="searchForm">
                           <div class="input-group input-group-sm">
                              <select id="search_category" style="width: 55.2px; height: 30px;" >
                                 <option value="user">사람</option>
                                 <option value="map">가게</option>
                                 <option value="board">글</option>
                              </select>
                              <input class="form-control" placeholder="Search" name="srch-term" id="srch-term" type="text">
                              <div class="input-group-btn">
                                 <button class="btn btn-default" type="submit">
                                    <i class="glyphicon glyphicon-search"></i>
                                 </button>
                              </div>
                           </div>
                        </form>
                     </div>
                     <!-- 오른쪽 아이콘 모음집. 가로 957.333px에 찌그러짐-->
                     <div class="icon_wrap">
                        <ul class="nav navbar-nav navbar-right">
                           <li>
                              <a href="#">로그인</a>
                           </li>
                           <li>
                              <a href="#postModal" role="button" data-toggle="modal">
                              추천 경로+</a>
                           </li>
                           <li>
                              <a href="#">스토리</a>
                           </li>
                           <!-- 드롭다운(클릭하면 밑으로 튀어나오는 메뉴) -->
                            <li class="dropdown">
                           <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                           <i class="glyphicon glyphicon-user"></i></a>
                           <ul class="dropdown-menu">
                             <li><a href="">More</a></li>
                             <li><a href="">More</a></li>
                             <li><a href="">More</a></li>
                             <li><a href="">More</a></li>
                             <li><a href="">More</a></li>
                           </ul>
                          </li>
                        </ul>
                     </div>
                  </nav>
               </div>
   <div id="setDiv">
      <div id="mask"></div>
      <div id="window"></div>
      <div id="mapBox">
      	<div id="searchBox" style="z-index: 2;">
	      <input type="text" id="searchMap" onkeydown="enterkey();"/><input id = "searchMapBtn" type="button" value="검색" onclick="searchMap();"/>
		</div>
      	<div id="map" style="z-index: 1;" ></div> 
      </div>
      
      <!-- 오른쪽 사이드 -->  
      <div id="sidemenu">  
      	<button class="sideBtn" id="getpath" onclick="getpath()">경로 찾기</button>
      	<button class="sideBtn" id="newpath" onclick="newpath()">경로 새로고침</button>
      	<button class="sideBtn" id="savepath" onclick="savepath()">경로 저장</button>
      	<div id="path"></div>        
      </div>      
   </div>
            </div>         
         </div>
      </div>
   </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1993b1e3b0175008e57aef80bfdd05b0"></script>
<script>

var arr = new Array(); 

var accModule = function() {

     // private member (비공개 멤버, 고유멤버)
     var acc_wrap = $('.accodian'),
       question = acc_wrap.find('h3'),
       answer = question.next('h4');

     // privilieged member(공용 인터페이스)
     return {
       runInit: function() {
         this.accHandler();
       },
       accHandler: function() {
         var accodian = {
           targetClick: function(e) {
             var eTarget = $(e.currentTarget);
             if (eTarget.next().is(':visible')) {
               eTarget.next().slideUp();
               return;
             }
             answer.slideUp();
             eTarget.next().slideDown();
           }
         };
         question.on('click', accodian.targetClick);
       }
     }
   }();

   // 실행
   accModule.runInit();

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var selectedMarker = null;

var marker_width = 24,
	marker_height = 35,
	over_marker_width = 30,
	over_marker_height = 40,
	sprite_marker_url = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
	click_marker_url = "markerStarRed.png";
	
var markerSize = new daum.maps.Size(marker_width, marker_height), 
	overMarkerSize = new daum.maps.Size(over_marker_width, over_marker_height),
	spriteImageSize = new daum.maps.Size(marker_width, marker_height);

//마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, size){
	var markerImage = new daum.maps.MarkerImage(src, size);
	return markerImage;
}

//좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
function createMarker(position, image){
	var mar = new daum.maps.Marker({
		position: position,
		image: image
	});
	return mar;
}

var markersArr = [];  
var markers = [];
var afterpath = [];

var normalImage = createMarkerImage(sprite_marker_url, markerSize),
overImage = createMarkerImage(sprite_marker_url, overMarkerSize),
clickImage = createMarkerImage(click_marker_url, markerSize);

 //마커 추가
 function addMarker(position, title, contentid, contenttypeid, mapy, mapx) {     		 

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
    	contentId: contentid,
        map: map, // 마커를 표시할 지도
        position: position, // 마커를 표시할 위치
        title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : normalImage // 마커 이미지
    });
    //만약 arr에 존재하는 marker라면 빨간색 마커로 생성하겠다.
    if(arr.findIndex(function(item){return item.contentId === contentid})>-1){
    	marker.setImage(clickImage);
    }
    
    markers.push(marker);
    
	// 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
    marker.normalImage = normalImage;
    
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
       var obj = new Object();
       obj.contentId = contentid;
       obj.contentTypeId = contenttypeid;
       obj.mapy = mapy;
       obj.mapx = mapx;
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
                   	output += '<h4 id="title"><div class="glyphicon glyphicon-remove" id="d' + contentid + '" onclick="deletePin(this)"></div>' + title + '</h4>';
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
                   $('#path').append(output);
           },
         error: function(XMLHttpRequest, textStatus, errorThrown) { 
             alert("Status: " + textStatus); alert("Error: " + errorThrown); 
         } 
   	});
    });

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

 
var array = new Array();	
function searchMap(){
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
					addMarker(latlng, val.title, val.contentId, val.contentTypeId, val.mapY, val.mapX);
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

 


</script>      
</body>
</html>