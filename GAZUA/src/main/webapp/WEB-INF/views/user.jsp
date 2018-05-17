<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="user" items="${requestScope.user }">
 								<div class="panel panel-default">
                                 <div class="panel-thumbnail">
                                    <img src="고기.jpg" class="img-responsive">
                                 </div>
                                 <div class="panel-body">
                                    <p class="lead">${user.email }</p>
                                    <p>${user.name }</p>
                                    <p>
                                       <img src="resources/facebook/assets/img/uFp_tsTJboUY7kue5XAsGAs28.png" height="28px" width="28px">
                                    </p>
                                 </div> 
                                 </div>
</c:forEach>


                             