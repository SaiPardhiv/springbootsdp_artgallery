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
<title>Admin - View Visitors</title>
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
<%@include file="adminnavbar.jsp" %><br/><br/>
<h5 align="center">Total visitor count : <c:out value="${count}"></c:out></h5>

<h3 align="center">View All Visitors</h3>

<table align="center" border=1>
    <tr>
    <th>ID</th>
    <th>NAME</th>
    <th>EMAIL</th>
    <th>CONTACT</th>
    <th>GENDER</th>
    <th>AGE</th>
    </tr>
    
    <c:forEach items="${visitorlist}" var="visitor">
    <tr>
    <td><c:out value="${visitor.visitor_id}"></c:out></td>
    <td><c:out value="${visitor.visitor_fullname}"></c:out></td>
    <td><c:out value="${visitor.visitor_email}"></c:out></td>
    <td><c:out value="${visitor.visitor_contact}"></c:out></td>
    <td><c:out value="${visitor.visitor_gender}"></c:out></td>
    <td><c:out value="${visitor.visitor_age}"></c:out></td>
    </tr>
    </c:forEach>
    
</table>

</body>
</html>