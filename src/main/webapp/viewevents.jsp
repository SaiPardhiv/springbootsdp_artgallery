<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="jakarta.tags.core" prefix="c" %>
    
<%
Admin a = (Admin)session.getAttribute("admin");
if(a==null)
{
	response.sendRedirect("adminsessionfail");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - View Events</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}

.container {
    width: 80%;
    margin: 20px auto;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    overflow: hidden;
    padding: 20px;
}

h3 {
    text-align: center;
    color: #333;
}

table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 20px;
}

th, td {
    text-align: left;
    padding: 12px;
    border-bottom: 1px solid #ddd;
    transition: all 0.3s ease;
}

th {
    background-color: #4CAF50;
    color: white;
    text-transform: uppercase;
    font-size: 14px;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
    transform: scale(1.02);
    transition: transform 0.3s ease, background-color 0.3s ease;
}

td {
    color: #555;
}

</style>
</head>
<body>
<%@include file="adminnavbar.jsp" %><br/><br/>

<div class="container">
    <h3>Active Events</h3>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Curator</th>
            <th>Limit</th>
            <th>Description</th>
            <th>Start Date</th>
            <th>End Date</th>
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
</div>

</body>
</html>
