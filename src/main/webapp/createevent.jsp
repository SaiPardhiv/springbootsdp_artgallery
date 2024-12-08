<%@ page import="com.klef.jfsd.springboot.model.Curator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Curator c = (Curator)session.getAttribute("curator");
    if (c == null) {
        response.sendRedirect("curatorsessionfail");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Event</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .form-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 50%;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            margin: 0 auto;
            border-spacing: 10px;
        }

        th, td {
            text-align: left;
            padding: 10px;
        }

        th {
            width: 25%;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%@ include file="curatornavbar.jsp" %>

    <div class="form-container">
        <h2>Create Event</h2>
        <form action="insertevent" method="post">
            <!-- Hidden field to store curator's name -->
            <input type="hidden" id="event_curator" name="event_curator" value="<%= c.getCurator_fullname()%>" />

            <table>
                <tr>
                    <th><label for="event_name">Event Name:</label></th>
                    <td><input type="text" id="event_name" name="event_name" required maxlength="50" /></td>
                </tr>
                <tr>
                    <th><label for="event_description">Event Description:</label></th>
                    <td><textarea id="event_description" name="event_description" required maxlength="500"></textarea></td>
                </tr>
                <tr>
                    <th><label for="event_limit">Event Limit:</label></th>
                    <td><input type="number" id="event_limit" name="event_limit" required min="1" /></td>
                </tr>
                <tr>
                    <th><label for="event_startdate">Start Date:</label></th>
                    <td><input type="date" id="event_startdate" name="event_startdate" required /></td>
                </tr>
                <tr>
                    <th><label for="event_enddate">End Date:</label></th>
                    <td><input type="date" id="event_enddate" name="event_enddate" required /></td>
                </tr>
            </table>

            <button type="submit">Create Event</button>
        </form>
    </div>
</body>
</html>
