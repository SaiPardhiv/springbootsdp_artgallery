<%@page import="com.klef.jfsd.springboot.model.Artist"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
Artist a = (Artist)session.getAttribute("artist");
if(a==null)
{
    response.sendRedirect("artistlogin"); 
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Artist</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f9;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 600px; /* Increased form width */
            margin: 0 auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            text-align: left;
            color: black;
            padding: 10px;
            font-size: 16px;
        }

        td {
            padding: 10px;
            font-size: 16px;
        }

        td input, td select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }

        td input[type="number"],
        td input[type="text"],
        td input[type="email"],
        td input[type="password"],
        td select {
            width: calc(100% - 22px); /* Adjusting width for better alignment */
        }

        /* Styling for submit and reset buttons */
        .button-container {
            display: flex;
            gap: 20px; /* Space between buttons */
            justify-content: center;
        }

        input[type="submit"], input[type="reset"] {
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            width: 45%; /* Button width set to 45% */
            transition: all 0.3s ease;
        }

        input[type="submit"] {
            background-color: #708090; /* Slate grey color for submit button */
            color: white;
        }

        input[type="reset"] {
            background-color: #708090; /* Slate grey color for reset button */
            color: white;
        }

        /* Hover effect to increase button size */
        input[type="submit"]:hover, input[type="reset"]:hover {
            transform: scale(1.05); /* Increase size when hovering */
            background-color: #2f4f4f; /* Darker shade on hover */
        }

        
        label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-top: 10px;
        }

    </style>
</head>
<body>
<%@include file="artistnavbar.jsp" %>

<h2>Update Artist Information</h2>
<form action="artistupdate" method="post">
    <table>
        <tr>
            <td><label for="username">Username:</label></td>
            <td><input type="text" id="username" name="username" value="<%= a.getUsername() %>" readonly required></td>
        </tr>
        <tr>
            <td><label for="contact">Contact:</label></td>
            <td><input type="text" id="contact" name="contact" value="<%= a.getContact() %>" required></td>
        </tr>
        <tr>
            <td><label for="email">Email:</label></td>
            <td><input type="email" id="email" name="email" value="<%= a.getEmail() %>" readonly required></td>
        </tr>
        <tr>
            <td><label for="age">Age:</label></td>
            <td><input type="number" id="age" name="age" value="<%= a.getAge() %>" required></td>
        </tr>
        <tr>
            <td><label for="experience">Experience (in years):</label></td>
            <td><input type="number" id="experience" name="experience" value="<%= a.getExperience() %>" required></td>
        </tr>
        <tr>
            <td><label for="password">Password:</label></td>
            <td><input type="password" id="password" name="password" value="<%= a.getPassword() %>" required></td>
        </tr>
        <tr>
            <td><label for="status">Status:</label></td>
            <td><input type="text" id="status" name="status" value="<%= a.getStatus() %>" required></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <button type="submit">Update Artist</button>
            </td>
        </tr>
    </table>
</form>

<c:if test="${not empty message}">
    <p>${message}</p>
</c:if>

</body>
</html>
