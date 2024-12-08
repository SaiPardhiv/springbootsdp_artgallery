<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="jakarta.tags.core" prefix="C" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Failed</title>
</head>
<body>
<%@include file="mainnavbar.jsp" %><br><br><br>
<h3 align="center"><span style="color: red;"><C:out value="${message}" /></span><br/></h3>
<h4 align="center"><a href="adminlogin">Try Again -></a></h4>
</body>
</html>