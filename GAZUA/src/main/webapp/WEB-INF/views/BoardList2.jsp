<%@page import="com.project.sns.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#img_container {
	width: 500px;
	height: 50px;
	border: solid;
	position: relative;
}

#img {
	width: 15px;
	height: 15px;
	display: block;
	position: absolute;
	top: 50%;
	margin-top: -8px;
}

#line {
	height: 10px;
	width: 800px;
	display: block;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-left: -200px;
	margin-top: -5px;
}
</style>
<body>
	<%
		List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList");
//		int boardNo = boardList.size();
		int boardNo = 2;
		double line = ((800) / (boardNo - 1) + 1) * (boardNo-1);
		double realLine = ((line) / (boardNo - 1)) * (boardNo-1) + 10;
		System.out.println("line = " + line);
		System.out.println("(800) / (boardNo - 1) = " + (800) / (boardNo - 1));
		System.out.println("(800) / (boardNo - 1) + 1 = " + ((800) / (boardNo - 1) + 1));
		System.out.println("boardNo-1 = " + (boardNo-1));
		System.out.println("(line) / (boardNo - 1) = " + ((line) / (boardNo - 1)));
		System.out.println("realLine = " + realLine);
 	
// 5	double line = ((800) / (boardNo - 1) + 1) * (boardNo-0.95);
// 10	double line = ((800) / (boardNo - 1) + 1) * (boardNo-1);
// 20	double line = ((800) / (boardNo - 1) + 1) * (boardNo-1);
// 25	double line = ((800) / (boardNo - 1) + 1) * (boardNo-1.25);
// 30	double line = ((800) / (boardNo - 1) + 1) * (boardNo-1.5);
%>/
	
		<style type="text/css">
			#img_container {
				width: 1000px;
			}
			#line { width: <%= realLine%>px;}
		</style>
	<div id="img_container">
		<img id="line" src="resources\image\line1.png" />
		<%
			
			for (int i = 0; i < boardNo; i++) {
				double wid = (line) / (boardNo - 1);
//				System.out.println("wid * i + 50 = " + (wid * i + 50));
	//			System.out.println("i - (i-1) = " + ((wid * i + 50) - (wid * (i-1) + 50)));
		%>	
		<a href="getBoardValue.do?board_seq=<%= i %>&amp;line_seq=<%= i %>">
		<img id="img" src="resources\image\11.png"
			style="margin-left:<%=wid * i + 50%>px;" />
		</a>
		<%
			}
		%>
	</div>





</body>
</html>