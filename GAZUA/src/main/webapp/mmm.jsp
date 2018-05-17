<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.project.sns.addr.vo.AddrVO"%>
<%@ page import="java.util.*"%>

<html>
<head>
    <meta charset="utf-8">
    <title>닫기가 가능한 커스텀 오버레이</title>
       <style>
       .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
       .wrap * {padding: 0;margin: 0;}
       .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
       .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
       .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
       .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
       .info .close:hover {cursor: pointer;}
       .info .body {position: relative;overflow: hidden;}
       .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
       .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
       .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
       .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
       .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
       .info .link {color: #5085BB;}
   </style>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1993b1e3b0175008e57aef80bfdd05b0"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new daum.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
        level: 15 // 지도의 확대 레벨
    }; 

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도에 마커를 표시합니다 
var marker = new daum.maps.Marker({
    map: map, 
    position: new daum.maps.LatLng(33.450701, 126.570667)
});


var positions =  [
      <%
         List<AddrVO> list = (List<AddrVO>) request.getAttribute("list");
         for (int i = 0; i < list.size(); i++) {
      %>
      {title : "<%=list.get(i).getTitle()%>",
       contenttypeid : "<%=list.get(i).getContentTypeId()%>",
       contentid : "<%=list.get(i).getContentId()%>",
       latlng : new daum.maps.LatLng(<%=list.get(i).getMapy()%>,<%=list.get(i).getMapx()%>)
      }

      <%
         if (list.size() - 1 > i) {
               out.append(",");
            }
         }
      %>
      ];
// 커스텀 오버레이에 표시할 컨텐츠 입니다
// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
// 별도의 이벤트 메소드를 제공하지 않습니다 

var contents =  [
            <%
               for (int i = 0; i < list.size(); i++) {
            %>
            {
            value :  
               '<div class="wrap">' + 
                  '    <div class="info">' + 
                  '        <div class="title">' + 
                           "<%=list.get(i).getTitle()%>"+ 
                  '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                  '        </div>' + 
                  '        <div class="body">' + 
                  '            <div class="img">' +
                  '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
                  '           </div>' + 
                  '            <div class="desc">' + 
                  '                <div class="ellipsis"><%=list.get(i).getAddr1()%></div>' + 
                  '                <div class="예제.. 아무정보 다들어감jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
                  '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
                  '            </div>' + 
                  '        </div>' + 
                  '    </div>' +    
                  '</div>' 
            
            }
             <%
                if (list.size() - 1 > i) {
                      out.append(",");
                   }
                }
             %>  
         ];
   

// 마커 위에 커스텀오버레이를 표시합니다
// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다


var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position:positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title,  // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    }); 
    
   var overlay = new daum.maps.CustomOverlay({
       content: contents[i].value,
       map: map,
       position:positions[i].latlng   
   });
    closeOverlay();
   //마커를 클릭했을 때 커스텀 오버레이를 표시합니다
   
    daum.maps.event.addListener(marker,'mouseover', 
    function (){
    overlay.setMap(map);
    });
    daum.maps.event.addListener(marker,'mouseout', function closeOverlay(){
        overlay.setMap(null);     
    });
} 


// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
    overlay.setMap(null);     
}


function makeOverListener(map, marker, infowindow) {
   return function() {
     infowindow.open(map);
   };
}

   //인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
   return function() {
     infowindow.close();
   };
}
</script>
</body>
</html>