<%@page import="org.springframework.util.concurrent.ListenableFuture"%>
<%@page import="com.project.sns.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%

int lineSize = 800;
int containerSize = 1000;
%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>



</script>
</head>
<style>
#img_container{
	width: <%=containerSize%>px; 
	height:50px; 
	border:solid; 
	position:relative;
}
#img{
	width:15px;
	height:15px;
	display:block; 
	position:absolute;
	top:50%; 
	margin-top:-8px;
}
#line{
	height:10px;
	width:<%=lineSize%>px;
	display:block; 
	position:absolute; 
	top:50%; 
	left:50%; 
	margin-left:-<%=lineSize/2%>px; 
	margin-top:-5px;
}

</style>
<body>

<%
int boardNo = 19;

//List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
//int boardNo = list.size();
//if(list != null){
%>
<div id="img_container" >
<img id="line" src="resources\image\line1.png" />
<%
//for(int i = 0; i < list.size(); i++){
	for(int i = 0; i < boardNo; i++){
	//int wid = lineSize/(boardNo-1);
	int wid = 0;
	
	if(boardNo==1){
		wid = lineSize/2;
		%>	
		<img id="img" src="resources\image\11.png" style="margin-left:<%=wid+((containerSize-lineSize)/2)%>px;"/>
	<%
	}else if(boardNo<5){
		wid = (lineSize-boardNo*5)/(boardNo-1);
		%>	
		<img id="img" src="resources\image\11.png" style="margin-left:<%=wid*i+((containerSize-lineSize)/2)%>px;"/>
	<%
	}else if(boardNo>22){
		wid = lineSize/(boardNo-1);
		%>	
		<img id="img" src="resources\image\11.png" style="margin-left:<%=wid*i+((containerSize-lineSize)/2)%>px;"/>
	<%
	}else{
		wid = (lineSize-boardNo)/(boardNo-1);
		%>	
		<img id="img" src="resources\image\11.png" style="margin-left:<%=wid*i+((containerSize-lineSize)/2)%>px;"/>
	<%
	}
}
//}
%>



	
</div>





</body>
</html>