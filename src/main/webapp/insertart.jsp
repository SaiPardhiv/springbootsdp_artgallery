<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Artwork</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px; /* Decreased width */
            text-align: left;
            margin-left: 400px;
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 22px; /* Adjusted font size */
            margin-bottom: 20px;
        }

        /* Table Layout Styling */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 8px;
            vertical-align: top;
        }

        label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"],
        input[type="file"],
        input[type="submit"] {
            padding: 8px;
            width: 90%;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            margin-top: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #708090;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2f4f4f;
        }

        input[type="number"] {
            -moz-appearance: textfield; /* For Firefox */
        }

        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .container {
                width: 90%;
            }

            h1 {
                font-size: 20px;
            }

            input[type="submit"] {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<%@include file="artistnavbar.jsp" %>

<div class="container">
    <h1>Insert New Artwork</h1>
    <form action="/insertart" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td><label for="title">Title:</label></td>
                <td><input type="text" id="title" name="title" required></td>
            </tr>
            <tr>
                <td><label for="artist">Artist:</label></td>
                <td><input type="text" id="artist" name="artist" required></td>
            </tr>
            <tr>
                <td><label for="yearCreated">Year Created:</label></td>
                <td><input type="number" id="yearCreated" name="yearCreated" required></td>
            </tr>
            <tr>
                <td><label for="dimensions">Dimensions:</label></td>
                <td><input type="text" id="dimensions" name="dimensions" required></td>
            </tr>
            <tr>
                <td><label for="price">Price:</label></td>
                <td><input type="number" step="0.01" id="price" name="price" required></td>
            </tr>
            <tr>
                <td><label for="status">Status:</label></td>
                <td><input type="text" id="status" name="status"></td>
            </tr>
            <tr>
                <td><label for="artimage">Upload Image:</label></td>
                <td><input type="file" id="artimage" name="artimage" required></td>
            </tr>
        </table>
        <input type="submit" value="Insert Artwork">
    </form>
</div>

</body>
</html>
