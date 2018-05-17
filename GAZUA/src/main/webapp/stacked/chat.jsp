<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%

String userID="123";
String toID="456";

//String userID = null;
//if (session.getAttribute("userID")!=null){
//	userID = (String) session.getAttribute("userID");
//}



%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	function autoClosingAlert(selector, delay){
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function(){alert.hide()}, delay);
	}
	
	
	function submitFunction(){
		var fromID = '<%=userID%>';
		var toID = '<%=toID%>';
		var chatContent = $('#chatContent').val();
		$.ajax({
			type:'post',
			url:'chat.do',
			headers:{
				"Content-Type": "application/json",
				"X-HTTP-Method-Override" : "POST"},
				dataType:'text',
				data: JSON.stringify({fromID:fromID, toID:toID, chatContent:chatContent}),
//				success:function(result){
//					if(result == 'SUCCESS'){
//						alert("등록 되었습니다.");
//					}}
		})
		$("#chatContent").val('');
	}
	
	var lastID = 0;
	
	  function chatListFunction(data){
		var fromID = '<%=userID%>';
		var toID = '<%=toID%>';
		$.ajax({
			type: "POST",
			url: "chat/list.do",
			data: JSON.stringify({fromID:fromID, toID:toID, chatID:lastID}),
			contentType : "application/json; charset=UTF-8",
			success: function(data){
				if(data =="") return;
				console.log("data : " + data);
				for(var i = 0; i < data.length; i++){
					addChat(data[i].fromID, data[i].chatContent, data[i].chatTime);
					console.log(data[i].fromID);
					console.log(data[i].chatContent);
					console.log(data[i].chatTime);
					lastID = data[i].chatID;
					console.log(lastID);
				}
				//	lastID = Number(data.last);
				//	console.log(data.last.chatID);
				//lastID= NUMBER(parsed.last);
			}		
		});
	}
	
	

	
	
	function addChat(chatName, chatContent, chatTime){
		$('#chatlist').append('<div class="row">' +
				'<a class="pull-left" href="#">' +
				'<img class="media-object img-circle" src="images/icon.png" alt="">' +
				'</a>' +
				'<div class="media-body">' +
				'<h4 class="media-heading">' +
				chatName +
				'<span class="small pull-right">' +
				chatTime +
				'</span>' +
				'</h4>' +
				'<p>' +
				chatContent +
				'</p>' +
				'</div>' +
				'<hr>');
		$('#chatlist').scrollTop($('#chatlist')[0].scrollHeight);
	}
	
	function getInfiniteChat(){
		setInterval(function(){
			chatListFunction(lastID);
		}, 1000); //1초에 1번 실행
	}

	


</script>
</head>
<body>

<div id="chatlist" style="overflow-y:auto; width: auto; height:800px;">
</div>
<textarea style="height:80px;" id="chatContent" placeholder="메세지를 입력하세요."></textarea>
<button type="btn" onclick="submitFunction();">전송</button>

<script type="text/javascript">
$(document).ready(function(){
	chatListFunction('ten');
	getInfiniteChat();
})
</script>
</body>
</html>