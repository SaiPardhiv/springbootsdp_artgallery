<%@page import="com.klef.jfsd.springboot.model.Visitor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Visitor v = (Visitor) session.getAttribute("visitor");
if (v == null) {
    response.sendRedirect("visitorsessionfail");
    return;
}
%>
<html>
<head>
    <title>Update Visitor</title>
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

        /* Styling for the labels */
        label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-top: 10px;
        }

    </style>
</head>
<body>
<%@include file="visitornavbar.jsp" %>

<h2>Update Visitor Information</h2>
<form action="update" method="post">
    <table>
        <tr>
            <th>ID:</th>
            <td><input type="number" id="visitor_id" value="<%=v.getVisitor_id() %>" name="visitor_id" required readonly="readonly"></td>
        </tr>
        <tr>
            <th>Full Name:</th>
            <td><input type="text" id="visitor_fullname" name="visitor_fullname" value="<%=v.getVisitor_fullname()%>" required></td>
        </tr>
        <tr>
            <th>Email:</th>
            <td><input type="email" id="visitor_email" name="visitor_email" value="<%=v.getVisitor_email()%>" required></td>
        </tr>
        <tr>
            <th>Password:</th>
            <td><input type="password" id="visitor_password" name="visitor_password" value="<%=v.getVisitor_password()%>" required></td>
        </tr>
        <tr>
            <th>Gender:</th>
            <td>
                <select id="visitor_gender" name="visitor_gender" required>
                    <option value="Male" <%= v.getVisitor_gender().equals("Male") ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= v.getVisitor_gender().equals("Female") ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= v.getVisitor_gender().equals("Other") ? "selected" : "" %>>Other</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>Contact:</th>
            <td><input type="text" id="visitor_contact" name="visitor_contact" value="<%=v.getVisitor_contact() %>" required></td>
        </tr>
        <tr>
            <th>Age:</th>
            <td><input type="number" id="visitor_age" name="visitor_age" value="<%=v.getVisitor_age() %>" required></td>
        </tr>
        <tr>
            <td colspan="2" class="button-container">
                <input type="submit" value="Update">
                <input type="reset" value="Clear">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
 