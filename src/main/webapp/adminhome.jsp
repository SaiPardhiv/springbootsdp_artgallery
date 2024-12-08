<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<title>Admin - Home</title>
<style>
    .container {
        width: 250px;
        height: 150px;
        margin: 15px;
        padding: 20px;
        border-radius: 15px;
        display: inline-block;
        text-align: center;
        font-family: Arial, sans-serif;
        font-size: 16px;
        color: #333;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s, box-shadow 0.3s;
    }
    .container1 { background-color: #dff0d8; }
    .container2 { background-color: #d9edf7; }
    .container3 { background-color: #fcf8e3; }
    .container4 { background-color: #f2dede; }
    .container:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
    }
    .number {
        font-weight: bold;
        font-size: 24px;
        margin-top: 10px;
    }
</style>
</head>
<body>
<%@include file="adminnavbar.jsp" %>
<h4 align="center">Admin Home Page</h4>

<div align="center">
    <div class="container container1">
        <div>No. of Visitors:</div>
        <div class="number">4</div>
    </div>
    <div class="container container2">
        <div>No. of Curators:</div>
        <div class="number">2</div>
    </div>
    <div class="container container3">
        <div>No. of Active Events:</div>
        <div class="number">1</div>
    </div>
    <div class="container container4">
        <div>Completed Events Count:</div>
        <div class="number">0</div>
    </div>
</div>

</body>
</html>
