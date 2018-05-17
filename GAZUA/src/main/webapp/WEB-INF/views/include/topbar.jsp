<%@page import="A.algorithm.AES"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
   href="resources/facebook/assets/css/bootstrap2.css?val=2">
<link rel="stylesheet"
   href="resources/facebook/assets/css/facebook2.css?val=2">
<script type="text/javascript" src="resources/facebook/assets/js/jquery.js"></script>
<script type="text/javascript" src="resources/facebook/assets/js/bootstrap.js"></script>
<style>
   .box-inline{
   display:inline-block;
   }
</style>
<script type="text/javascript">
<%
String userID = (String) session.getAttribute("id");
if(userID!=null){
AES aes = new AES();
userID = aes.setDecrypting(userID);
%>
var userID = '<%=userID%>';

$(document).ready(
		function(){
			getMessageAlarm();
			getInfiniteAlarm();
		});
<%
};
%>
function getMessageAlarm(){
	$.ajax({
		type : "POST",
		url : "chat/getNewFollower.do",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			console.log(data);
		      var namecheck = [];
		      for(var i = 0; i < data.length; i++){
		    	  var follow = "";
		    	  if(userID == data[i].fromID){
		    		  follow = data[i].toID;
		    	  }else{
		    		  follow = data[i].fromID;
		    	  }
		    	  if(namecheck.indexOf(follow)==-1){
		    		  namecheck.push(follow);
		    			if(data[i].toID==userID){
		    				if(data[i].chatRead==0){
		    					$('#message_icon').attr("src",'resources/image/message_new.jpg');
		    				}
		    				else{
		    					$('#message_icon').attr("src",'resources/image/message_btn.jpg');
		    				}
		    			}
		    	  }
		      }
		}
		
	})
}

function getInfiniteAlarm(){
	setInterval(function(){
		getMessageAlarm();
	}, 3000); //3초에 1번 실행
}

</script>
</head>
<body>
               <div class="navbar navbar-blue navbar-static-top">
                  <!-- 
                     아이콘 영역. 기존 부트스트랩보다 margin-top을 늘림.
                   -->
                  <nav class="navbar-collapse" role="navigation">
                     <!-- 검색 폼. -->
                     <a href="mainHomeView.do" class="navbar-brand"><img src="resources/image/문민웅-메인페이지_02.jpg"></img></a>
                     <div class="search_wrap" id="search_wrap">
                        <form class="navbar-form navbar-left" method="post" onsubmit="return checkgo();" id="searchForm">
                           <div class="input-group input-group-sm">
                              <select id="search_category" style="height: 32px;">
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
                           <%
                              if(session.getAttribute("id") == null) {
                                 %>
                                    <a href="login.do"><img src="resources/image/login.jpg"></img></a>
                                 <%
                              }
                              else {
                                 %>
                                    <a href="logout.do"><img src="resources/image/logout.jpg"></img></a>
                                 <%
                              }
                           %>
                           </li>
                           <li>
                              <a href="newMap.do" role="button"><img src="resources/image/path.jpg"/></a>
                           </li>
                           <li>
                           <%
                           	
                           %>
                              <a href="message.do" role="button"><img id="message_icon" src="resources/image/message_btn.jpg"/></a>
                           </li>
                           <li>
                              <a href="modifyBoard.do"><img src="resources/image/write.jpg"></img></a>
                           </li>
                           <li>
                                 
                             <a href="myPage.do"><img src="resources/image/mypage.jpg"></img></a>
                           </li>
                        </ul>
                     </div>
                  </nav>
               </div>
</body>
function checkId(event){
	var id = <%=session.getAttribute("id")%>;
	 if(id == null) {
		 alert("회원만 이용 가능합니다.");
		 location.href = "login.do";
		 event.preventDefault();
	 }
}
</script>
</html>