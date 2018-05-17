<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.project.sns.board.vo.BoardVO"%>
<%@ page import="java.util.*"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<div class="panel panel-default">
	<c:forEach var="list" items="${requestScope.list}">
		<div class="card-body-bottom">
			<div class="responsive">
				<div class="img">
					<a target="_blank" href="homeview.do?story_seq=${list.story_seq}">
						<figure>${list.story_title }</figure>
					</a>
				</div>
					<a href="deleteStory.do?story_seq=${list.story_seq }">
						<i class="fa fa-minus-square-o"></i>스토리 삭제
					</a>
			</div>
		</div>
	</c:forEach>
</div>
