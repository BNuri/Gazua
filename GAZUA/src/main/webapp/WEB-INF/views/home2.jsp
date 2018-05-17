<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<style>
.wrap {
   position: absolute;
   left: 0;
   bottom: 40px;
   width: 288px;
   height: 132px;
   margin-left: -144px;
   text-align: left;
   overflow: hidden;
   font-size: 12px;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   line-height: 1.5;
}

.wrap * {
   padding: 0;
   margin: 0;
}

.wrap .info {
   width: 286px;
   height: 120px;
   border-radius: 5px;
   border-bottom: 2px solid #ccc;
   border-right: 1px solid #ccc;
   overflow: hidden;
   background: #fff;
}

.wrap .info:nth-child(1) {
   border: 0;
   box-shadow: 0px 1px 2px #888;
}

.info .title {
   padding: 5px 0 0 10px;
   height: 30px;
   background: #eee;
   border-bottom: 1px solid #ddd;
   font-size: 18px;
   font-weight: bold;
}

.info .close {
   position: absolute;
   top: 10px;
   right: 10px;
   color: #888;
   width: 17px;
   height: 17px;
   background:
      url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
   cursor: pointer;
}

.info .body {
   position: relative;
   overflow: hidden;
}

.info .desc {
   position: relative;
   margin: 13px 0 0 90px;
   height: 75px;
}

.desc .ellipsis {
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
}

.desc .jibun {
   font-size: 11px;
   color: #888;
   margin-top: -2px;
}

.info .img {
   position: absolute;
   top: 6px;
   left: 5px;
   width: 73px;
   height: 71px;
   border: 1px solid #ddd;
   color: #888;
   overflow: hidden;
}

.info:after {
   content: '';
   position: absolute;
   margin-left: -12px;
   left: 50%;
   bottom: 0;
   width: 22px;
   height: 12px;
   background:
      url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
   color: #5085BB;
}

#map {
   position: fixed;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
   href="resources/facebook/assets/css/bootstrap2.css">

<link rel="stylesheet"
	href="resources/facebook/assets/css/original.css">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
   var mmm = function() {
         $.ajax({
            url : 'getBoardList.do',
            data : {
               index : index
            },
            success : function(data) {
               $("#col-sm-6").html(data);
            }
         })
      
   }
   var index = 0;
   $(function() {
      mmm();
      $(document).on('click', '[name = "comment"]', function() {
         $(".reply").toggle();
      })
   
      $("#main").scroll(function() {
         var sh = $("#main").scrollTop() + $("#main").height();
         var dh = $("#main").prop("scrollHeight");

         if (sh == dh) {
            index += 3;
            $.ajax({
               url : 'getBoardList.do',
               data : {
                  index : index
               },
               success : function(data) {
                  $("#col-sm-6").append(data);
               }
            })
         }
      })

   });

   $(document).on(function() {
      $(".reply").hide();
   })
</script>
</head>
<body>
   <div class="wrapper">
      <div class="box">
         <div class="row row-offcanvas row-offcanvas-left">


            <!--
                     원본 왼쪽에 있던 사이드바.
                     다만 밑의 메인 화면의 가로 길이를 100%로 하였기 때문에
                     글씨가 겹쳐 보이는 문제가 발생함.
                  -->
            <div class="column col-sm-2 col-xs-1 sidebar-offcanvas" id="sidebar">

               <ul class="nav">
                  <li><a href="#" data-toggle="offcanvas"
                     class="visible-xs text-center"><i
                        class="glyphicon glyphicon-chevron-right"></i></a></li>
               </ul>

               <ul class="nav hidden-xs" id="lg-menu">
                  <li class="active"><a href="#featured"><i
                        class="glyphicon glyphicon-list-alt"></i> Featured</a></li>
                  <li><a href="#stories"><i
                        class="glyphicon glyphicon-list"></i> Stories</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-paperclip"></i>
                        Saved</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-refresh"></i>
                        Refresh</a></li>
               </ul>
               <ul class="list-unstyled hidden-xs" id="sidebar-footer">
                  <li><a href="http://usebootstrap.com/theme/facebook"><h3>Bootstrap</h3>
                        <i class="glyphicon glyphicon-heart-empty"></i> Bootply</a></li>
               </ul>

               <ul class="nav visible-xs" id="xs-menu">
                  <li><a href="#featured" class="text-center"><i
                        class="glyphicon glyphicon-list-alt"></i></a></li>
                  <li><a href="#stories" class="text-center"><i
                        class="glyphicon glyphicon-list"></i></a></li>
                  <li><a href="#" class="text-center"><i
                        class="glyphicon glyphicon-paperclip"></i></a></li>
                  <li><a href="#" class="text-center"><i
                        class="glyphicon glyphicon-refresh"></i></a></li>
               </ul>

            </div>
            <!--
                  col-sm-12, col-xs-12 둘 다 같은 width 설정 class.
                  col-xs-12는 disable된 상태
                  
                  맨 뒤의 숫자를 변경하면(col-sm-10) 회색 화면의 가로가 줄어들어 
                  백그라운드의 회색 화면이 나타남.                  
                -->
            <div id="main" class="column col-sm-10 col-xs-11" overflow-y:auto>

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
                     <a href="https://www.naver.com" class="navbar-brand logo">N</a>
                  </div>

                  <!-- 아이콘을 제외한 오른쪽 영역. -->
                  <nav class="collapse navbar-collapse" role="navigation"> <!-- 검색 폼. -->
                  <form class="navbar-form navbar-left">
                     <div class="input-group input-group-sm" style="width: 360px;">
                        <input class="form-control" placeholder="Search"
                           name="srch-term" id="srch-term" type="text">
                        <div class="input-group-btn">
                           <button class="btn btn-default" type="submit">
                              <i class="glyphicon glyphicon-search"></i>
                           </button>
                        </div>
                     </div>
                  </form>
                  <!-- 오른쪽 아이콘 모음집. -->
                  <ul class="nav navbar-nav navbar-right">
                     <li><a href="#"><i class="glyphicon glyphicon-home"></i>Home</a>
                     </li>
                     <li><a href="#postModal" role="button" data-toggle="modal">
                           <i class="glyphicon glyphicon-plus"></i>Post
                     </a></li>
                     <li><a href="#"><span class="badge">badge</span></a></li>
                     <!-- 드롭다운(클릭하면 밑으로 튀어나오는 메뉴) -->
                     <li class="dropdown"><a href="#" class="dropdown-toggle"
                        data-toggle="dropdown"> <i class="glyphicon glyphicon-user"></i></a>
                        <ul class="dropdown-menu">
                           <li><a href="">More</a></li>
                           <li><a href="">More</a></li>
                           <li><a href="">More</a></li>
                           <li><a href="">More</a></li>
                           <li><a href="">More</a></li>
                        </ul></li>
                  </ul>
                  </nav>
               </div>
               <div class="padding">
                  <div class="full col-sm-9" id="full1">
                     <div class="row">
                        <div class="col-sm-6" id="col-sm-6">

                           <c:forEach var="user" items="${requestScope.user}">
                              <div class="panel panel-default">
                                 <a href="#"> <img class="card-img-top img-fluid w-100"
                                    src="resources/facebook/assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
                                    alt="">
                                 </a>
                                 <div class="card-body">
                                    <h6 class="card-title mb-1">
                                       <a href="#">이미지</a>
                                    </h6>
                                    <p class="card-text small">${user.content}
                                       <a href="#">#workinghardorhardlyworking</a>
                                    </p>
                                 </div>
                                 <hr class="my-0">
                                 <div class="card-body py-2 small">
                                    <a class="mr-3 d-inline-block" href="#"> <i
                                       class="fa fa-fw fa-thumbs-up"></i>Like
                                    </a> <a class="mr-3 d-inline-block" href="#" name="comment">
                                       <i class="fa fa-fw fa-comment"></i>Comment
                                    </a> <a class="d-inline-block" href="#"> <i
                                       class="fa fa-fw fa-share"></i>Share
                                    </a>
                                 </div>
                                 <hr class="my-0">
                                 <div class="card-body small bg-faded"></div>
                                 <div id="replyDiv" class="reply">
                                    <table>
                                       <tr>
                                          <td class="header" width="370">댓글</td>
                                          <td class="header" width="100">작성자</td>
                                       </tr>

                                    </table>
                                    <table>
                                       <tr>
                                          <td><textarea id="rContent" cols="50" rows="2"></textarea>
                                             <div id="cmsg"></div></td>
                                          <td><input type="text" id="rWriter" maxlength="20"
                                             size="10" />
                                             <div id="wmsg"></div></td>
                                       </tr>
                                       <tr>
                                          <td class="bottom"></td>
                                          <td align="right" class="bottom"><button class="rBtn">댓글등록</button></td>
                                       </tr>
                                    </table>
                                 </div>
                                 <div class="card-footer small text-muted">Tell :
                                    ${user.regdate}</div>
                              </div>
                           </c:forEach>
                           <div class="panel panel-default">
                              <a href="#"> <img class="card-img-top img-fluid w-100"
                                 src="https://unsplash.it/700/450?image=180" alt="">
                              </a>
                              <div class="card-body">
                                 <h6 class="card-title mb-1">
                                    <a href="#">John Smith</a>
                                 </h6>
                                 <p class="card-text small">
                                    Another day at the office... <a href="#">#workinghardorhardlyworking</a>
                                 </p>
                              </div>
                              <hr class="my-0">
                              <div class="card-body py-2 small">
                                 <a class="mr-3 d-inline-block" href="#"> <i
                                    class="fa fa-fw fa-thumbs-up"></i>Like
                                 </a> <a class="mr-3 d-inline-block" href="#" name="comment">
                                    <i class="fa fa-fw fa-comment"></i>Comment
                                 </a> <a class="d-inline-block" href="#"> <i
                                    class="fa fa-fw fa-share"></i>Share
                                 </a>
                              </div>
                              <hr class="my-0">

                              <div class="card-body small bg-faded"></div>
                              <div id="replyDiv" class="reply">
                                 <table>
                                    <tr>
                                       <td class="header" width="370">댓글</td>
                                       <td class="header" width="100">작성자</td>
                                    </tr>
                                    <c:forEach items="${reply}" var="r">
                                       <tr>
                                          <td>${r.content}</td>
                                          <td class="writer">${r.writer}</td>
                                       </tr>
                                    </c:forEach>
                                 </table>
                                 <table>
                                    <tr>
                                       <td><textarea id="rContent" cols="50" rows="2"></textarea>
                                          <div id="cmsg"></div></td>
                                       <td><input type="text" id="rWriter" maxlength="20"
                                          size="10" />
                                          <div id="wmsg"></div></td>
                                    </tr>
                                    <tr>
                                       <td class="bottom"></td>
                                       <td align="right" class="bottom"><button id="rBtn">댓글등록</button></td>
                                    </tr>
                                 </table>
                              </div>
                              <div class="card-footer small text-muted">몇분 지난거 확인</div>
                           </div>


                        </div>
                        <div class="col-sm-6">
                           <div class="panel panel-default"></div>
                           <div class="panel panel-default">
                              <div id="map" style="width: 40%; height: 100%;"></div>
                              <script type="text/javascript"
                                 src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1993b1e3b0175008e57aef80bfdd05b0"></script>
                              <script>
                                 var mapContainer = document
                                       .getElementById('map'), // 지도의 중심좌표
                                 mapOption = {
                                    center : new daum.maps.LatLng(
                                          33.451475, 126.570528), // 지도의 중심좌표
                                    level : 15
                                 // 지도의 확대 레벨
                                 };
                                 var map = new daum.maps.Map(
                                       mapContainer, mapOption); // 지도를 생성합니다
                              </script>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

					<%@ include file="include/topbar.jsp" %>
					<%@ include file="include/half_map.jsp" %>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('[data-toggle=offcanvas]').click(function() {
				$(this).toggleClass('visible-xs text-center');
				$(this).find('i').toggleClass('glyphicon-chevron-right glyphicon-chevron-left');
				$('.row-offcanvas').toggleClass('active');
				$('#lg-menu').toggleClass('hidden-xs').toggleClass('visible-xs');
				$('#xs-menu').toggleClass('visible-xs').toggleClass('hidden-xs');
				$('#btnShow').toggle();
			});
        });
		function checkgo() {
			var check = document.getElementById("search_category").value;
			var keyword = document.getElementById("srch-term").value;
			alert(check);
			alert(keyword);
			if(keyword == "") {
				alert("키워드를 입력해주세요.");
				return false;
			}			
			if(check == "user") {
				location.href = "searchAll.do?keyword=" + keyword + "&number=1";
			}
			if(check == "map") {
				location.href = "searchAll.do?keyword=" + keyword + "&number=2";
			}
			if(check == "board") {
				location.href = "searchAll.do?keyword=" + keyword + "&number=3";
			}
			return false;
		}
	</script>

</body>
</html>