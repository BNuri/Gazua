<%@page import="com.project.sns.board.vo.BoardVO"%>
<%@page import="A.algorithm.AES"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://cdn.rawgit.com/singihae/Webfonts/master/style.css" rel="stylesheet" type="text/css" />
<style>
#map {
   position: fixed;
}
.fileDrop {
	width: 100%;
	height: 50px;
	background: gray;
	border: 1px dotted black;
}
.pull-right{
	float: right !important;
	}
	
.con{
	overflow:hidden;
	height:auto;
	}
	
#content{
	width: 100%;
	height: 500px;
	background: white;
	margin-top: 10px;
	margin-bottom: 10px;
	overflow: auto;
	padding: 10px;
	}
	
#searchBox{
	position: fixed;
	float: right;
	background-color: white;
	height : 50px;
	width : 325px;
	top: 95px;
	right: 2%;
	}
	
#searchResult{
	position: fixed;
	bottom: 0;
	right: 0;
	background-color: #303030;
	height : 250px;
	width : 50%;
	}
#searchContent{
	background: white;
	padding: 14px 40px;
	font-size: 16px;
	border-radius: 12px;
	width: auto;
	margin: 10px;
	overflow: auto;
	}
	
#file{
	display:none;
	}
	
.toolBox{
	height : 50px;
	}
#glyphicon span {
    font-size: 50px;
    top: -15px;
    left: 5px;
}

#glyphicon{
	display: inline-block;
	float: right;
	}
#modifyForm {
	margin-top : 80px;
	}
	
#mapBox {
	margin-top : 80px;
	}
.story {
	margin-top : 20px;
	
	}
	
#searchMap{
	background-color: white;
	background-image: url('resources/image/search_icon.jpg');
	background-position: 2px 2px;
	background-repeat: no-repeat;
	padding-left: 40px;
	margin: auto;
	border: solid;
	}
.image{
	float:left;
	top: 0;
	height: auto;
	margin-right: 15px;
	margin-bottom: 15px;
	}
.tourbox{
	background:white;
	overflow:auto;
	height: 200px;
	clear: left;
	border-radius: 12px;
	margin: 5px;
	}
.star{
	float: right;
	}
	
.icon_wrap ul  li{
	display: inline-block;
	}
	
.form-group{
	width: 95%;
	}
	
#save{
	margin-right: 20px;
	margin-bottom: 10px;
	}
	
#btitle{
	width: 90%;
	display: inline;
	}

#searchTextBox{
	margin-top: 8px;
	margin-left: 10px;
	}

.contentBox{
	overflow: auto;
	}
</style>
<title>Insert title here</title>

</head>
<body>
<div class="wrapper">
      <div class="box">
         <div class="row row-offcanvas row-offcanvas-left">
                          
            <div id="main" class="column col-sm-12 col-xs-12">
			<%@ include file="include/topbar.jsp"%>                      
                        
            <!--  수정 폼 -->           
			<div class="col-sm-6" id="modifyForm">
					<button id='save' class="btn btn-warning pull-right" >저장</button>
					
					<!--  스토리  -->
					<div class='story form-group'>
						<form class='storyForm'>
							<select name='storyBox' id='storyBox' class='form-control' onchange='loadPath()'>
								<option>스토리 선택</option>
								<c:forEach items="${story}" var="story">
									<option value='${story.story_seq}'>${story.story_title}</option>
								</c:forEach>
								<option disabled></option>
								<option value="스토리추가">스토리추가</option>
							</select> 
						</form>
					</div>
					<hr>
					
					<!-- 글작성 -->
					<div class='board form-group'>
						<div class="btitle">
							 <!-- <div class="board_title">  -->
								<input  class="form-control" type="text" id='btitle' placeholder='글 제목'/>
							 <!-- </div> --> 
							<div id="glyphicon">
								<span class="glyphicon glyphicon-picture" id="imageUp" aria-hidden="true"></span>
							</div>
						</div>
						<div class='uploadedList form-control' id="content" contentEditable="true"></div>
						<div class='toolBox'>
							<form id="imageUpload" method='POST' enctype='multipart/form-data'>
								<input type="file" name="image" id="file"/>
							</form>
						</div>
					</div>
					<hr>
					<div id = savedPath>
					</div>
				</div>
 
               <div class="col-sm-6">
                   <div class="panel panel-default">
                        <div id="mapBox">
	                   		<div id="searchBox" style="z-index: 2;">
	                   			<div id="searchTextBox"style="z-index: 3;">
	                  				<input type="text" id="searchMap" onkeydown="enterkey();" placeholder="검색.."/>
	                  				<img src="resources/image/search_btn.jpg" id="searchMapBtn" onclick="searchMap();"/>
	                  			</div>
	                   		</div>
	                   		<div id="map" style="width: 50%; height: 100%;" style="z-index: 1;"></div>
	                   		<div id="searchResult" style="z-index: 4;">
	                   			<div id="searchContent" style="z-index: 5;"></div>
	                   		</div>
                    	</div>
                   </div>
                </div>
            </div>
         </div>
      </div>
   </div>
					
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1993b1e3b0175008e57aef80bfdd05b0"></script>
<script type="text/javascript">
<%
String id = (String) session.getAttribute("id");
AES aes1 = new AES();
id = aes1.setDecrypting(id);
%>
var id = '<%=id%>';
var files = [];
var blob;
var contentId;
var starvalue; 
var board_seq = 0; 
//선택한 마커
var selectedMarker = null;
//검색결과.
var array = new Array();
var markersArr = []; 
var markers = [];
<%
BoardVO board = (BoardVO)request.getAttribute("board");
if(board!=null){

int mod_board_seq = board.getBoard_seq();
int mod_story_seq = board.getStory_seq();
String mod_title = board.getTitle();
String mod_content = board.getContent();
String mod_contentId = board.getContentId();
int mod_heart = board.getHeart();
int mod_star = board.getStar();

%>
var mod_board_seq = '<%=mod_board_seq%>';
var mod_story_seq = '<%=mod_story_seq%>';
var mod_title = '<%=mod_title%>';
var mod_content = '<%=mod_content%>';
var mod_contentId = '<%=mod_contentId%>';
var mod_heart = '<%=mod_heart%>';
var mod_star = '<%=mod_star%>';
contentId = mod_contentId;
board_seq = mod_board_seq;
$('#storyBox').val(mod_story_seq).prop('selected',true);
$('#title').val(mod_title);
$('#content').html(mod_content);
getInfo(mod_contentId);
mark(mod_star);
<%
}else{
%>
$(function(){
	
	$('#searchResult').hide();
	$('#searchContent').hide();
})	
<%
}
%>	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
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
	var marker = new daum.maps.Marker({
		position: position,
		image: image
	});
	return marker;
}
//마커 추가

function addMarker(position, title, contentid, contenttypeid) {     		 
 

   var normalImage = createMarkerImage(sprite_marker_url, markerSize),
       overImage = createMarkerImage(sprite_marker_url, overMarkerSize),
       clickImage = createMarkerImage(click_marker_url, markerSize);
    // 마커를 생성합니다
   var marker = new daum.maps.Marker({
   	contentId: contentid,
       map: map, // 마커를 표시할 지도
       position: position, // 마커를 표시할 위치
       title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
       image : normalImage // 마커 이미지
   });
   
   markers.push(marker);
   
	// 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
   marker.normalImage = normalImage;
   
    //마커에 mouseover 이벤트 등록    
    daum.maps.event.addListener(marker, 'mouseover', function(){
    	//클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면 마커의 이미지를 오버 이미지로 변경
    	if(!selectedMarker || selectedMarker != marker){
    		marker.setImage(overImage);
    	}
    });
    
	// 마커에 mouseout 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'mouseout', function() {
        // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면 마커의 이미지를 기본 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {
            marker.setImage(normalImage);
        }
    });
	
  //선택한 마커를 생성하고 선택마커 배열에 추가하는 함수
    function createArrMarkers(){
    		marker.setImage(clickImage);
    		markersArr.pop();
    		markersArr.push(marker);
    		marker.setMap(map);
    }
   
    //마커 클릭시! 
   daum.maps.event.addListener(marker, 'click', function() {
       // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면 마커의 이미지를 클릭 이미지로 변경합니다
       if (!selectedMarker || selectedMarker !== marker) {
           // 클릭된 마커 객체가 null이 아니면 클릭된 마커의 이미지를 기본 이미지로 변경하고
           !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
           // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
           marker.setImage(clickImage);
       }
       // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
       selectedMarker = marker;
       createArrMarkers();
	   starvalue = 0;
       starcount = 0;
       locked = 0;
       contentId = contentid;
      
       getInfo(contentid);
   });
   } 

//라인 생성
var polylines = [];
function drawLine(pathes){
	   deletePolyLine();
	   
	   var polyline = new daum.maps.Polyline({
	   path : pathes, // 선을 구성하는 좌표배열 입니다
	   strokeWeight : 3, // 선의 두께 입니다
	   strokeColor : '#db4040', // 선의 색깔입니다
	   strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	   strokeStyle : 'solid' // 선의 스타일입니다
	   });
	   
	   polyline.setMap(map); //지도에 라인 추가
	   polylines.push(polyline); //배열에 라인 담기 
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
}

var info;
function callDetail(contentid, contenttypeid){
    $.ajax({        
        url: 'callDetail.do',
        type: 'get',
        async: false,
        data : {"contentId" : contentid, "contentTypeId" : contenttypeid},
        dataType: 'json',
        success: function(data){
        	info = data.response.body.items.item;
        },
      error: function(XMLHttpRequest, textStatus, errorThrown) { 
          alert("Status: " + textStatus); alert("Error: " + errorThrown); 
      } 
	});
    return info;
}

function getInfo(contentid){
	var addr;
	$.ajax({
		url:'callInfo.do',
		type:'POST',
		async: false, 
		data: {"contentId" : contentid},
		dataType: 'json',
		success: function(data){
			addr = data;
            var contenttypeid = addr.contentTypeId;
            var myItem = callDetail(contentid, contenttypeid);
            var output = '<div class="tourbox ' + contentid + '" id="' + contentid + '" text-align:left>';
        	  output += '<div class="image" ><img src = "' + addr.firstimage + '" style="height: 150px; width: 150px"/></div>';
              output += '<div class="contentBox"><h4 id="stitle">' + addr.title + '<div class="star" id="star">별점주기'
            		+ '<img src="empty_star3.png" id="star1" onmouseover=show(1) onclick=mark(1) onmouseout=noshow(1)>'
            		+ '<img src="empty_star3.png" id="star2" onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2)>'
            		+ '<img src="empty_star3.png" id="star3" onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3)>'
            		+ '<img src="empty_star3.png" id="star4" onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4)>'
            		+ '<img src="empty_star3.png" id="star5" onmouseover=show(5) onclick=mark(5) onmouseout=noshow(5)>'
            		+'</div></h4>';
        	  output += '<div class="info">';
                if(contenttypeid == 12){
              	  	if(myItem.parking){
	                    output += '<p class="p" >'+'주차장 : ' + myItem.parking+'</p>';
              	  	}if(myItem.restdate){
	                    output += '<p class="p" >' +'휴무일 : ' + myItem.restdate + '</p>';
              	  	}if(myItem.infocenter){
	                    output += '<p class="p" >' +'연락처 : ' + myItem.infocenter + '</p>';
              	  	}
                }else if(contenttypeid == 14){
              	  	if(myItem.usefee){
	                    output += '<p class="p" >'+'입장료 : ' + myItem.usefee+'</p>';
              	  	}if(myItem.usetimeculture){
	                    output += '<p class="p" >'+'운영시간 : ' + myItem.usetimeculture+'</p>';
              	  	}if(myItem.restdateculture){
	                    output += '<p class="p" >' +'휴무일 : ' + myItem.restdateculture + '</p>';
              	  	}if(myItem.infocenterculture){
	                    output += '<p class="p" >' +'연락처 : ' + myItem.infocenterculture + '</p>';
              	  	}
                }else if(contenttypeid == 15){
              	  	if(myItem.eventplace){
	                    output += '<p class="p" >'+'행사 장소 : ' + myItem.eventplace+'</p>';
              	  	}if(myItem.eventstartdate){
	                    output += '<p class="p" >'+'행사 일정 : ' + myItem.eventstartdate + '~' + myItem.eventenddate +'</p>';
              	  	}if(myItem.playtime){
	                    output += '<p class="p" >' +'행사 시간 : ' + myItem.playtime + '</p>';
              	  	}if(myItem.sponsor1 || myItem.sponsor1tel){
	                    output += '<p class="p" >' +'주최처 : ' + myItem.sponsor1 + " tel) " + myItem.sponsor1tel + '</p>';
              	  	}
                }else if(contenttypeid == 28){
              	  	if(myItem.usetimeleports){
	                    output += '<p class="p" >'+'운영시간 : ' + myItem.usetimeleports+'</p>';
              	  	}if(myItem.infocenterleports){
	                    output += '<p class="p" >' +'연락처 : ' + myItem.infocenterleports + '</p>';
              	  	}
                }else if(contenttypeid == 32){
              	  	if(myItem.reservationurl){
	                    output += '<p class="p" >'+'예약 : ' + myItem.reservationurl+'</p>';
              	  	}if(myItem.subfacility){
	                    output += '<p class="p" >' +'시설 : ' + myItem.subfacility + '</p>';
              	  	}if(myItem.infocenterlodging){
	                    output += '<p class="p" >' +'연락처 : ' + myItem.infocenterlodging + '</p>';
              	  	}
                }else if(contenttypeid == 38){
              	  	if(myItem.saleitem){
	                    output += '<p class="p" >'+'취급물품 : ' + myItem.saleitem+'</p>';
              	  	}if(myItem.opentime){
	                    output += '<p class="p" >'+'운영시간 : ' + myItem.opentime+'</p>';
              	  	}if(myItem.restdateshopping){
	                    output += '<p class="p" >' +'휴무일 : ' + myItem.restdateshopping + '</p>';
              	  	}if(myItem.infocenter){
	                    output += '<p class="p" >' +'연락처 : ' + myItem.infocenter + '</p>';
              	  	}
                }else if(contenttypeid == 39){
              	  	if(myItem.treatmenu){
	                    output += '<p class="p" >'+'메뉴 : ' + myItem.treatmenu+'</p>';
              	  	}if(myItem.opentimefood){
	                    output += '<p class="p" >'+'운영시간 : ' + myItem.opentimefood+'</p>';
              	  	}if(myItem.restdatefood){
	                    output += '<p class="p" >' +'휴무일 : ' + myItem.restdatefood + '</p>';
              	  	}if(myItem.infocenterfood){
	                    output += '<p class="p" >' +'연락처 : ' + myItem.infocenterfood + '</p>';
              	  	}
                }
                output += '</div></div></div>';
                $('#searchResult').show();
                $('#searchContent').show();
                $('#searchContent').html(output);

		}
		
	});
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
	
	
	//스토리 추가 선택 시 스토리 추가하기.
	$('#storyBox').change(function(){
		if((this.value)=='스토리추가'){
			var a = prompt('새로운 스토리명을 입력하시오.');
			if(a==null || a==''){
				$('#storyBox option:eq(0)').prop('selected',true);
				return false;
				}
			$.ajax({
				url: 'inputStory.do',
				type: 'POST',
				data: {id:id, story_title:a},
				success: function(data){
					$('#storyBox option:eq(-2)').before("<option value='"+ data + "'>" + a + "</option>");
					$('#storyBox').val(data).prop('selected',true);
					
					//스토리로 글 조회 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				}
			})
		}
	})
	
	//저장버튼 클릭시 글 전체와 이미지 저장
	$('#save').click(function(){
		
		var story_seq = $('#storyBox').val();
		var title = $('#title').val();
		var content = $('#content').html();
		console.log("SAVE 후의 star " + starvalue);
		if(starvalue==null || starvalue==0){
			alert("별점을 입력하시오.");
			return false;
		}if(contentId==null || contentId==''){
			alert("위치를 입력하시오.");
			return false;
		}
		$.ajax({
			url:'inputBoard.do',
			type:'POST',
			data:{story_seq:story_seq, title:title, content:content, writer:id, contentId:contentId, star:starvalue, board_seq:board_seq},
			success: window.location.replace("homeview.do?story_seq="+story_seq)
				
		})
		
	})
	
	//이미지 클릭시 업로드창 실행
	$('#imageUp').click(function(){
		console.log('fileadd');
		$('input[name="image"]').click();
	})
	
	//업로드 파일체인지가 됐을 경우 실행되는 이벤트
	$('input[name="image"]').change(function(event){
		
		
		var form = $('#imageUpload')[0];
		var formData = new FormData(form);
		var f = $('input[name="image"]')[0].files[0]
		formData.append('file',f);	
		
		
		$.ajax({
			  url: 'uploadAjax.do',
			  data: formData,
			  dataType:'text',
			  processData: false,
			  contentType: false,
			  type: 'POST',
			  success: function(data){
				 // files.push(data);
				  var str ="";
				  
				  console.log(name);
				  //if(checkImageType(name)){
					  str = "<img src='displayFile.do?img_seq="+data+"' style='max-width: 100%; height: auto;'/>";
				  //}
				  
				  $(".uploadedList").append(str);
			  }
			});	
		
		
		
	})
	
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
	
		var fils = event.originalEvent.dataTransfer.files;
		var file = fils[0];		
		var formData = new FormData();		
		formData.append("file", file);
				
		$.ajax({
			  url: 'uploadAjax.do',
			  data: formData,
			  dataType:'text',
			  processData: false,
			  contentType: false,
			  type: 'POST',
			  success: function(data){
				 // files.push(data);
				  var str ="";
				  var name = data.img_name;
				  if(checkImageType(data.getImg_name())){
					  str ="<br/><img src='displayFile.do?img_seq="+data+"'style='max-width: 100%; height: auto;'/><br/>";
				  }
				  
				  $(".uploadedList").append(str);
			  }
			});	
	});
	
	$('#delete').click(function(){
		
		//var delete_confirm = function(){
			if(confirm('현재 작성 중이던 글을 삭제하시겠습니까?')){
				//yes click
				if(board_seq!=null){
					$.ajax({
						url:"deleteBoard.do",
						type:"post",
						data:{board_seq:board_seq}
						//성공시 글 전체 조회.
					})
					}else{
						$('.board').remove();
					}
			}
		//}
		
	})
			
		function checkImageType(fileName){
			var pattern = /jpg|gif|png|jpeg/i;
			return fileName.match(pattern);
		}
	
//})
//엔터로 검색
	function enterkey(){
		if(window.event.keyCode == 13){
			searchMap();
		}
	}
//지도 검색
function searchMap(){
	var keyword = $('#searchMap').val();
	$('#searchMap').val('');
	if(keyword == null || keyword ==''){
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
//별점 부분!!!!!!!
var locked = 0;
var starcount = 0;
function show(star){
	if(locked) return;
	var i;
	var image;
	var el;
	
	for(i = 1; i <= star; i++){
		image = 'star' + i;
		el = document. getElementById(image);
		el.src = "star3.png";
	}
	
}
function noshow(star){
	if(locked) return;
	var i;
	var image;
	var el;
	
	for( i = 1; i <= star; i++){
		image = 'star' + i;
		el = document.getElementById(image);
		el.src = "empty_star3.png";
	}
}
function newshow(star){
	var i;
	var image;
	var el;
	for( i = 5; i > star; i--){
		image = 'star' + i;
		el = document.getElementById(image);
		el.src = "empty_star3.png";
	}
	for(i = 1; i <= star; i++){
		image = 'star' + i;
		el = document. getElementById(image);
		el.src = "star3.png";
	}
}
function lock(star){
	show(star);
	locked = 1;
}
function mark(star){
	if(starcount==0){
		lock(star);
		starvalue = star;
		starcount++;
	}else{
		newshow(star);
		starvalue = star;
	}
	console.log("star " + star);
}

var count = 0;				//이전 마커를 지우기 위해서 사용
//저장된 경로(스토리) 출력
function loadPath(){
	var pathes = [];
	var story_seq = $('#storyBox').val();
	count++;
	if(count > 1){
		deleteMarker();
	} 
	$.ajax({
		url : "loadPath.do",
		data : {"story_seq":story_seq},
		success : function(pathList){
			var path = "";
			for(var i=0; i<pathList.length; i++){
		        var latlng = new daum.maps.LatLng(pathList[i].mapy,pathList[i].mapx);
				path += "<a href='javascript:panTo(" + pathList[i].mapy + "," + pathList[i].mapx +"," +  pathList[i].contentId + "," + pathList[i].contentTypeId + ","  + ")'>"
			    	   	+ pathList[i].title + "</a>";
				if(i<pathList.length-1){
					path += "<img src='resources/image/up-broken-arrow.png'>";
				}	
				
				addMarker(latlng, pathList[i].title, pathList[i].contentId, pathList[i].contentTypeId);				
	            pathes.push(latlng);				//polyline 그리기 용도
			}
			panTo(pathList[0].mapy, pathList[0].mapx, pathList[0].contentId, pathList[0].contentTypeId);      //스토리의 처음 위치를 보여줍니다.
			$('#savedPath').html(path);				//경로리스트 보여주기
			drawLine(pathes);						//라인 그리기

			
		}
	})
}

//클릭하면 해당 위치로 이동 (인포윈도우)
function panTo(mapy, mapx, contentid, contenttypeid) {
 
   // 이동할 위도 경도 위치를 생성합니다 
   var moveLatLon = new daum.maps.LatLng(mapy, mapx);
 
   // 지도 중심을 부드럽게 이동시킵니다
   // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
   map.panTo(moveLatLon);
   getinfo(contentid);
}



</script>
</body>
</html>