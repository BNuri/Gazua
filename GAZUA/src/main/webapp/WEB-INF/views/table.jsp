<%-- <%@include file ="addT.jsp" %> --%>
<%@page import="A.algorithm.AES"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.project.sns.board.vo.BoardVO"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>

<link href="resources/startbootstrap-coming-soon-gh-pages/vendor/font-awesome/css/font-awesome.min.css"
   rel="stylesheet" type="text/css">
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1993b1e3b0175008e57aef80bfdd05b0"></script>
<script>
//팝업 레이어 닫기 버튼
function popupX() {
   var mask = document.getElementById("mask");
   var window = document.getElementById("window");
   mask.style.display = 'none';
   window.style.display = 'none';
}

var mapContainer = document.getElementById('map'), // 지도의 중심좌표
mapOption = { 
center: new daum.maps.LatLng( 37.517136 ,127.03696), // 지도의 중심좌표
level: 3    // 지도의 확대 레벨
}; 
// 지도에 마커를 표시합니다 
var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var positions =  [
      <%
      List<BoardVO> list = (List<BoardVO>) request.getAttribute("user");
         for (int i = 0; i < list.size(); i++) {
      %>
      {
       title : "<%=list.get(i).getTitle()%>",
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
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="img">' +
                '                <img src="<%=list.get(i).getFirstimage()%>" width="73" height="70">' +
                '           </div>' + 
                '            <div class="desc">' + 
                '                <div class="ellipsis"><%=list.get(i).getAddr1()%></div>' + 		
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
/* for (var i = 0; i < positions.length; i ++) {
    
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
    
    var infowindow = new daum.maps.InfoWindow({
       content : contents[i].value,
       map : map,
       position : positions[i].latlng   
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
} */ // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    
    // 마커 이미지를 생성합니다    
    
    	  var imageSrc = 'resources/image/markerStarRed.png'; 
          var imageSize = new daum.maps.Size(34, 50); 
	      var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
          var marker = new daum.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position:positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title,  // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        contentid : positions[i].contentid,
	        image : markerImage // 마커 이미지 
	    });  
          
    addMarker( positions[i].latlng, positions[i].title, positions[i].contentid, positions[i].contenttypeid ); 

    var infowindow = new daum.maps.InfoWindow({
        content : contents[i].value
    });
/*     (function(marker, infowindow) {
        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
        daum.maps.event.addListener(marker, 'mouseover', function(){
            infowindow.open(map, marker);
        });

        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
        daum.maps.event.addListener(marker, 'mouseout', function(){
            infowindow.close();
        });
    })(marker, infowindow); */
    

    
}

function addMarker(position, title, contentid, contenttypeid) {

	      
// 	      var marker = new daum.maps.Marker({
// 	      contentid: contentid,
// 	      contenttypeid: contenttypeid,
// 	      map : map, // 마커를 표시할 지도
// 	      position : position, // 마커를 표시할 위치
// 	      title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
// 	      image : markerImage
// 	   // 마커 이미지 
// 	   });

 daum.maps.event.addListener(marker, 'click', function() {
 	marker = this;
 	getDetail(contentid,contenttypeid);
     
 });
 
}      
   
function updateBoard(value){

	   var upseq = value.id.replace('up','');


	   location.replace("modifyBoard.do?board_seq="+upseq);

	   

	}

	 

	function deleteBoard(value){

	   var delseq = value.id.replace('del','');

	   var delstr = value.name;

	   console.log(delseq);

	   if(confirm('현재 작성 중이던 글을 삭제하시겠습니까?')){

	         $.ajax({

	            url:"deleteBoard.do",

	            type:"post",

	            data:{board_seq:delseq},

	            success: function(data){

	               location.replace("homeview.do?story_seq="+delstr);

	            }

	         })

	   }else{

	      return false;

	   }

	} 
function getDetail(contentid, contenttypeid){
	wrapWindowByMask();
	var contentid = contentid;
	var contenttypeid = contenttypeid;
    $.ajax({        
        url: 'callDetail.do',
        type: 'get',
        data : {"contentId" : contentid, "contentTypeId" : contenttypeid},
        dataType: 'json',
        success: function(data){
            var addr = getInfo(contentid, contenttypeid);
        	var myItem = data.response.body.items.item;
        	var output = '<div class="pin1 ' + contentid + '" id="' + contentid + '" text-align:left>';
            output += '<div class="pin-top"><div id="title" style="background-image: url(\'' + 'resources/image/popup-top.png' + '\');"><font size="4em">' + addr.title + '</font><a id="popup-X" href="#" onclick="popupX()">';
            output += '<img src="resources/image/popup-X.png"></a></div></div>';
            output += '<div class="scope" ><img src = "' + addr.firstimage + '" style="height: 250px; width: 350px; float:left"/>';
         if(addr.scope && addr.scope !="0" && addr.scope!="0.0"){
            output += '<p><div class="glyphicon glyphicon-star" />' + addr.scope + '</p>';
         }
            if(addr.image1 && addr.link1){
                output += '<p class="p">리뷰보기:(클릭으로 이동) </p><a class="review" href="' + addr.link1 + '"><img src="' + addr.image1 + '"/>'
                      + '</a>';
             }if(addr.image2 && addr.link2){
                output += '<a class="review" href="' + addr.link2 + '"><img src="' + addr.image2 + '"/>'
              + '</a>';
             }if(addr.image3 && addr.link3){
                output += '<a class="review" href="' + addr.link3 + '"><img src="' + addr.image3 + '"/>'
              + '</a>';
             }
         
         output += '</div>';
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
         
             output += '</div>';
             $('#window').html(output);
        },
      error: function(XMLHttpRequest, textStatus, errorThrown) { 
          alert("Status: " + textStatus); alert("Error: " + errorThrown); 
      } 
 	});
}

function getInfo(contentid, contenttypeid){
	var addr;
	$.ajax({
		url:'callInfo.do',
		type:'POST',
		async: false, 
		data: {"contentId" : contentid, "contentTypeId" : contenttypeid},
		dataType: 'json',
		success: function(data){
			addr = data;
		}
		
	});
	return addr;
}
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
/* function closeOverlay() {
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
      }
   }
 */
</script>
<c:set var="f_result" value="${requestScope.f_result}"></c:set>
<c:forEach var="user" items="${requestScope.user}"  varStatus="status">
<br/>
   <div class="panel panel-default" id = "table_${status.count}" >
   <div class="card mb-3">
   <div class="card-body">
 <input type="hidden" name="count_x${status.count}" value="${user.mapx}">
 <input type="hidden"  name="count_y${status.count}" value="${user.mapy}">
  <input type="hidden"  name="${user.title}" value="${user.title}">
 <input type="hidden" id="size" value="<%=list.size()%>">
         <h6 class="card-title mb-1">
            <div
               href="getBoardValue.do?story_seq=${user.story_seq}&writer=${user.writer}">
               <input type="hidden" id="boardUser" value="${user.writer}"  />
               ${user.content}
               </div	>
         </h6>
  
        
       <p class="card-text small" >
        <a href="#"><strong>by ${user.writer}</strong></a>
       </p>
       <p class="card-text small"><strong>
       ${user.regdate}
       <c:forEach var="time" items="${requestScope.time}" begin="${status.index}" end="${status.index }">${time}</strong></c:forEach>
       </p>
       <c:set var="id2" value="${user.writer}" scope="request"/>
  		<% 		
			String id = (String) session.getAttribute("id");
			AES aes = new AES();
			id = aes.setDecrypting(id);
			
			String id2 = (String) request.getAttribute("id2");
			if(id.equals(id2))
			{
        %>
       <button class="btn btn-default"  style = "color :#e1494a" id="up${user.board_seq}" onclick="updateBoard(this)"> 수정 </button>

       <button class="btn btn-default"  style = "color :#e1494a" id="del${user.board_seq}" name="${user.story_seq}" onclick="deleteBoard(this)"> 삭제</button>
       <%}%>
      </div>
      <hr class="my-0">
      <div class="card-body py-2 small">
         <a class="mr-3 d-inline-block heart_button" name="like${user.board_seq}" onclick="like_button(${user.board_seq},${user.story_seq})" href="#" style = "color :#e1494a;">
            <i class="fa fa-fw fa-thumbs-up"></i>${user.heart}명 Like
         </a>
         <a class="mr-3 d-inline-block" onclick="togglethis(${user.board_seq})" name="comment" style = "color :#e1494a;">
            <i class="fa fa-fw fa-comment"></i>Comment
         </a>
         <a class="d-inline-block" href="#" style = "color :#e1494a;">
            <i class="fa fa-fw fa-share"></i>Share
         </a>
         <a class="mr-3 d-inline-block follow_button" href="#" onclick="follow_button('${user.writer}');" style = "color :#e1494a;">
			<c:if test="${f_result eq 1}">
	            <i class="fa fa-fw fa-chain-broken"></i>Unfollow
			</c:if>
			<c:if test="${f_result eq 0}">
	            <i class="fa fa-fw fa-chain"></i>Follow
			</c:if>
         </a>
      </div>
      </div>

      
      
   <!--                     추가                         -->
    <!--  댓글  -->
    <div class="container">
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="board_seq${user.board_seq}" value="${user.board_seq}" id="board_seq${user.board_seq}" />
               <input type="hidden" name="story_seq${user.story_seq}" value="${user.story_seq}" id="board_seq${user.story_seq}"/>
               <input type="text" class="form-control" id="content" name="content${user.board_seq}" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="rbtn" onclick="r_button(${user.board_seq},${user.story_seq})" style = "color :#e1494a;">등록</button>
               </span>
              </div>
        </form>
    </div>
    <div class="container" >
        <div class="commentList" name="commentList${user.board_seq}"></div>
    </div>
</div>
<!--                     추가                         -->
</c:forEach>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
      <%
       for (int i = 0; i < list.size(); i++) {
       %>
       replyList( <%=list.get(i).getBoard_seq()%>,<%=list.get(i).getStory_seq()%>);
      <%}%>
      
})

function replyList(board_seq,story_seq){
     $.ajax({
           url : 'list.do',
           type : 'get',
           data : {
                 'board_seq':board_seq,
                 'story_seq' :story_seq   
           },
           success : function(data){
               var a =''; 
               $.each(data, function(key, value){ 
                   a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                   a += '<div class="commentInfo'+value.reply_seq+'"><div class="commentWrap"><a href="#"><img id ="pro" src="resources/image/pre.png" alt="Paris"></a><strong>'+value.rwriter+'</strong>';
                   a += '<button style = "color :#e1494a;" class="btn btn-default" onclick="replyUpdate('+value.reply_seq+ ',\'' +value.rcontent+ '\',' +value.board_seq+ ',' +value.story_seq+'); style = "color :#e1494a;""> 수정 </button>';
                   a += '<button style = "color :#e1494a;" class="btn btn-default" onclick="replyDelete('+value.reply_seq+','+value.board_seq+ ',' +value.story_seq+ ');"> 삭제 </button> </div>';
                   a += '<div class="commentContent'+value.reply_seq+'"> <p>'+value.rcontent +'</p>';
                   a += '</div></div></div>';
                   $('[name=commentList'+board_seq+']').html(a);
               });
               
               
           }
       });
} 

</script>
<style>
#pro {
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 5px;
    width: 35px;
}

#pro:hover {
    box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}
</style>