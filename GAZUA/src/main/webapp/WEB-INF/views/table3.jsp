<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.project.sns.board.vo.BoardVO"%>
<%@ page import="java.util.*"%>
<style>
.img figure img {
	opacity: 1;
	-webkit-transition: .3s ease-in-out;
	transition: .3s ease-in-out;
}

.img figure:hover img {
	opacity: .5;
}
</style>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
	<c:forEach var="list" items="${requestScope.storyList}">
		<div class="responsive">
			<div class="img">
				<a target="_blank" href="/sns/homeview.do?story_seq=${mainTable.story_seq}">
					<figure>${list.content }</figure>
				</a>
			</div>
		</div>
	</c:forEach>
	
	