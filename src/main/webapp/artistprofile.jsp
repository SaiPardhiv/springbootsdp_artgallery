<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.klef.jfsd.springboot.model.Artist"%>
<%
Artist a = (Artist)session.getAttribute("artist");
if(a==null)
{
    response.sendRedirect("artistsessionfail");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artist Profile</title>
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
            margin-top: 10px;
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

<%@include file="artistnavbar.jsp" %>

<div class="profile-container">
    <h2>Artist Profile</h2>
    <img class="profile-picture" src="profile.png" alt="Profile Picture"/>
</div>

<!-- Profile Information Table -->
<table>
    <tr>
        <th>Field</th>
        <th>Details</th>
    </tr>
    <tr>
        <td><strong>Username</strong></td>
        <td>${artist.username}</td>
    </tr>
    <tr>
        <td><strong>Email</strong></td>
        <td>${artist.email}</td>
    </tr>
    <tr>
        <td><strong>Contact</strong></td>
        <td>${artist.contact}</td>
    </tr>
    <tr>
        <td><strong>Age</strong></td>
        <td>${artist.age}</td>
    </tr>
    <tr>
        <td><strong>Gender</strong></td>
        <td>${artist.gender}</td>
    </tr>
    <tr>
        <td><strong>Experience</strong></td>
        <td>${artist.experience} years</td>
    </tr>
    <tr>
        <td><strong>Status</strong></td>
        <td>${artist.status}</td>
    </tr>
</table>

<!-- Button to update profile -->
<div class="buttons">
   <a href="updateartist"><button>Update Profile</button></a>
   <a href="artistlogout"><button>Logout</button></a>
</div>
<br/><br/>

</body>
</html>
