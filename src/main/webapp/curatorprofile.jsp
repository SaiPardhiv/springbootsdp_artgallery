<%@ page import="com.klef.jfsd.springboot.model.Curator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Curator c = (Curator)session.getAttribute("curator");
if(c==null)
{
	response.sendRedirect("curatorsessionfail");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Curator Profile</title>
    <style>
        /* General page styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        /* Navbar styling */
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap');
        .profile-container {
            text-align: center;
            margin-top: 40px;
        }

        h2 {
            font-size: 2rem;
            color: #333;
            font-weight: 500;
        }

        /* Profile Picture Styling */
        img.profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-top: 20px;
            border: 3px solid #ddd;
        }

        /* Table styling */
        table {
            width: 60%;
            margin: 40px auto;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            font-size: 16px;
        }

        table th {
            background-color: #708090;
            color: white;
            border-top-left-radius: 0px;
            border-top-right-radius: 0px;
        }

        table td {
            background-color: #f9f9f9;
            border-bottom: 1px solid #ddd;
        }

        table tr:nth-child(even) td {
            background-color: #f1f1f1;
        }

        table tr:hover {
            background-color: #e1f7d5;
        }

        /* Button styling */
        .buttons {
            text-align: center;
            margin-top: 30px;
        }

        .buttons button {
            background-color: #708090;
            color: white;
            font-size: 16px;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .buttons button:hover {
            
            transform: scale(1.05);
        }

        .buttons button:focus {
            outline: none;
        }

        /* Responsive styling */
        @media screen and (max-width: 768px) {
            table {
                width: 90%;
            }
            img.profile-picture {
                width: 120px;
                height: 120px;
            }
        }
    </style>
</head>
<body>

<%@include file="curatornavbar.jsp" %>

<div class="profile-container">
    <h2>Curator Profile</h2>
    <img class="profile-picture" src="profile.png" alt="Profile Picture"/>
</div>

<!-- Profile Information Table -->
<table>
    <tr>
        <th>Field</th>
        <th>Details</th>
    </tr>
    <tr>
        <td><strong>Name</strong></td>
        <td><%= c.getCurator_fullname() %></td>
    </tr>
    <tr>
        <td><strong>Email Address</strong></td>
        <td><%= c.getCurator_email() %></td>
    </tr>
    <tr>
        <td><strong>Company name</strong></td>
        <td><%= c.getCurator_company() %></td>
    </tr>
    <tr>
        <td><strong>Contact</strong></td>
        <td><%= c.getContact() %></td>
    </tr>
    
</table>

<!-- Button to update profile -->

<br/><br/>
</body>
</html>
