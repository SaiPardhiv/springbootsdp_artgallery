<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
</head>

<body>
    <h2>Payment Successful!</h2>
    <p>Your purchase has been completed successfully.</p>
    <p>Thank you for purchasing artwork with ID: ${param.artworkId}.</p>
    <a href="/">Return to Gallery</a>
</body>

</html>
