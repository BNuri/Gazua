<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table style="width:700px">
        <c:forEach var="row" items="${list}">
        <tr>    
            <td>
                ${row.rwriter}(<fmt:formatDate value="${row.rregdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
                <br>
                ${row.rcontent}
            </td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>
]