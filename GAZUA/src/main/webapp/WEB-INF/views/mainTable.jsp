<%@page import="A.algorithm.AES"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.project.sns.board.vo.BoardVO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>

<link href="resources/vendor/font-awesome/css/font-awesome.min.css"
   rel="stylesheet" type="text/css">
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
   href="resources/facebook/assets/css/bootstrap2.css">
<link rel="stylesheet"
   href="resources/facebook/assets/css/facebook2.css">
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
<c:forEach var="mainTable" items="${requestScope.mainTable}" begin="0" end="7" varStatus="status">
      <div class="responsive">
         <div class="img">
            <a target="_blank"
               href="/sns/homeview.do?story_seq=${mainTable.story_seq}">
               <figure>${mainTable.content}	
               </figure>
            </a>
         </div>
            <div class="card-footer small text-muted">${mainTable.regdate}
               <c:forEach var="mainTime" items="${requestScope.mainTime}" begin="${status.index }" end="${status.index }">${mainTime}</c:forEach></div>
      </div>
</c:forEach>   
<div class="clearfix"></div>



