<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About ArtVerse</title>
    <!-- MDB CSS Link -->
    <link href="https://cdn.jsdelivr.net/npm/mdb-react-ui-kit/css/mdb.min.css" rel="stylesheet">
    <style>
        /* Container Styles */
        .container {
            padding: 50px;
            text-align: center;
        }

        /* Heading Styles */
        .heading {
            margin-bottom: 30px;
            font-size: 2.0rem;
            color: darkgrey;
        }

        /* Paragraph Styles */
        .paragraph {
            margin-bottom: 20px;
            font-size: 1.1rem;
            line-height: 1.5;
        }

        /* Image Styles */
        .image {
            max-width: 60%;
            height: auto;
            border-radius: 10px;
            margin-top: 20px;
        }

        /* Row and Column Styles */
        .row {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .col {
            width: 48%;
        }

        /* Footer Styles */
        .footer {
            background-color: #bfc1c2;
            color: white;
            text-align: center;
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        .footer p {
            margin: 10px 0;
        }

        .footer a {
            color: white;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<%@include file="mainnavbar.jsp" %>

    <!-- Main Container -->
    <div class="container">
        <h1 class="heading"><u>ABOUT ARTVERSE</u></h1>

        <!-- Row -->
        <div class="row">
            <!-- Left Column -->
            <div class="col">
                <p class="paragraph">
                    ArtVerse is a dynamic art gallery system designed to bring artists and art enthusiasts together in a vibrant online community. Our platform showcases a diverse collection of artworks, making it easy for users to explore, discover, and appreciate various forms of art.
                </p>
                <p class="paragraph">
                    We believe that art is a universal language that transcends boundaries and connects people. At ArtVerse, we are committed to promoting creativity and providing a platform for artists to showcase their talents to a global audience.
                </p>

                <h2 class="heading">MEET THE DEVELOPERS</h2>
                <p class="paragraph">ArtVerse is brought to life by a passionate team:</p>
                <b>Pardhiv Sai</b><br>
                <b>Swamy</b><br>
                <b>Bhanu Prakash</b>
            </div>

            <!-- Right Column -->
            <div class="col">
                <img 
                    src="https://i.pinimg.com/originals/71/d9/29/71d929505326e49e4ba4372a21cba52a.jpg" 
                    alt="Art Gallery" 
                    class="image"
                />
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        <p>&copy; 2024 ArtVerse. All Rights Reserved.</p>
        <p>
            <a href="about">About Us</a> | 
            <a href="visitorreg">Register</a> | 
            <a href="visitorlogin">Login</a>
        </p>
    </div>

    <!-- MDB JS -->
    <script src="https://cdn.jsdelivr.net/npm/mdb-react-ui-kit/js/mdb.min.js"></script>

</body>
</html>
