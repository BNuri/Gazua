<%@page import="com.project.sns.addr.vo.AddrVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="resources/facebook/assets/css/bootstrap2.css">
<link rel="stylesheet"
	href="resources/facebook/assets/css/facebook2.css">
<link rel="stylesheet" href="resources/css/map.css">
<script type="text/javascript" src="resources/js/map.js"></script>
<script src="resources/facebook/assets/js/check.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(
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
					<%@ include file="include/topbar.jsp" %>
					<div id="setDiv">
						<div id="mask"></div>
						<div id="window"></div>
						<div id="map"></div>
						<div id="sidemenu">
							<ul class="accordian">
								<li class="accordian--box">
									<h3 id="recommend" onclick="recommend()">추천코스</h3>									
									<h4 id="pathlist"></h4>
								</li>
							</ul>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1993b1e3b0175008e57aef80bfdd05b0"></script>
	<script>
	
	
	var accModule = function() {

		// private member (비공개 멤버, 고유멤버)
		var acc_wrap = $('.accodian'), question = $('#recommend'), answer = $('#pathlist');

		// privilieged member(공용 인터페이스)
		return {
			runInit : function() {
				this.accHandler();
			},
			accHandler : function() {
				var accodian = {
					targetClick : function(e) {
						var eTarget = $(e.currentTarget);
						if (eTarget.next().is(':visible')) {
//							eTarget.next().slideUp();
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
    level: 8 // 지도의 확대 레벨
	};
	
	var map = new daum.maps.Map(mapContainer, mapOption), // 지도를 생성합니다
    customOverlay = new daum.maps.CustomOverlay({});	
	
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions =  [
	<%
	   List<AddrVO> list = (List<AddrVO>) request.getAttribute("list");
	   for (int i = 0; i < list.size(); i++) {
	%>
	{title : "<%=list.get(i).getTitle()%>",
	 contenttypeid : "<%=list.get(i).getContentTypeId()%>",
	 contentid : "<%=list.get(i).getContentId()%>",
	 latlng : new daum.maps.LatLng(<%=list.get(i).getMapy()%>,<%=list.get(i).getMapx()%>),
	 mapx : "<%=list.get(i).getMapx()%>",
	 mapy : "<%=list.get(i).getMapy()%>"
	}

	<%
	   if (list.size() - 1 > i) {
	         out.append(",");
	      }
	   }
	%>
	];
	
	
</script>
</body>
</html>