<%@page import="com.klef.jfsd.springboot.model.Curator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="jakarta.tags.core" prefix="c" %>
    

<%
    Curator c = (Curator)session.getAttribute("curator");
    if (c == null) {
        response.sendRedirect("curatorsessionfail");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Curator - My Events</title>
<style>
table {
  border-collapse: collapse;
  width: 60%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #f2f2f2;}
</style>
</head>
<body>
<%@include file="curatornavbar.jsp" %><br/><br/>


<h3 align="center">My Events</h3>

<table align="center" border=1>
    <tr>
    <th>ID</th>
    <th>NAME</th>
    <th>CURATOR</th>
    <th>LIMIT</th>
    <th>DESCRIPTION</th>
    <th>START-DATE</th>
    <th>END-DATE</th>
    </tr>
    
    <c:forEach items="${eventlist}" var="event">
    <tr>
    <td><c:out value="${event.event_id}"></c:out></td>
    <td><c:out value="${event.event_name}"></c:out></td>
    <td><c:out value="${event.event_curator}"></c:out></td>
    <td><c:out value="${event.event_limit}"></c:out></td>
    <td><c:out value="${event.event_description}"></c:out></td>
    <td><c:out value="${event.event_startdate}"></c:out></td>
    <td><c:out value="${event.event_enddate}"></c:out></td>
    </tr>
    </c:forEach>
    
</table>

</body>
</html>