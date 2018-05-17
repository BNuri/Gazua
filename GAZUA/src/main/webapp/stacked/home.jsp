<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
</head>
<body>
    <h1>Hello world!</h1>
 
    <table>
        <thead>
            <tr>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>이름</th>
            </tr>
        </thead>
        <tbody>
            <tbody>
            <c:forEach items="${boardList}" var="board">
                <tr>
                    <td>${board.board_seq}</td>
                    <td>${board.line_seq}</td>
                    <td>${board.title}</td>
                    <td>${board.writer}</td>
                    <td>${board.content}</td>
                    <td>${board.regdate}</td>
                    <td>${board.heart}</td>
                </tr>
            </c:forEach>
        </tbody>
        </tbody>
    </table>
 
 
</body>
</html>
