<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.project.sns.board.vo.BoardVO"%>
<%@ page import="java.util.*"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<div class="search-result-area">
	<div class="search-catNameBar">
		${requestScope.order }
	</div>
	<c:choose>
		<c:when test="${requestScope.number eq 1 }">
			<c:forEach var="list" items="${requestScope.list}">
					<div class="search-result-link">
						${list.id }
					</div>
			</c:forEach>
		</c:when>
		<c:when test="${requestScope.number eq 2 }">
			<c:forEach var="list" items="${requestScope.list}">
					<div class="search-result-link">
						${list.title }
					</div>
			</c:forEach>
		</c:when>
		<c:when test="${requestScope.number eq 3 }">
			<c:forEach var="list" items="${requestScope.list}">
					<div class="search-result-link">
						${list.title }
					</div>
			</c:forEach>
		</c:when>
	</c:choose>
</div>