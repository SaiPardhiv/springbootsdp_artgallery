<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css"/>
<title>JFSD</title>
<style>
    /* Navbar container style */
    .navbar {
        display: flex;
        justify-content: space-between; /* Distribute space between elements */
        align-items: center; /* Vertically center items */
         /* Light background */
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Grey box-shadow */
        padding: 10px 20px; /* Vertical padding and more horizontal padding */
        margin-top: 0px; /* No top margin, navbar stays at the top */
        /* Set the height of the navbar */
    }

    /* Navbar left side items (HOME, BROWSE ARTS, ABOUT) */
    .navbar-left {
        display: flex;
        justify-content: flex-start; /* Align items to the left */
      
    }

    /* Navbar link styles */
    .navbar a {
        text-decoration: none; /* Remove underline from links */
        color: darkgrey; /* Set text color to black */
        margin: 0 15px; /* Horizontal margin for spacing between links */
        font-size: 15px; /* Font size for the links */
        padding: 5px 10px; /* Padding inside the link */
        border-radius: 5px; /* Optional: rounded corners */
        transition: background-color 0.3s, color 0.3s; /* Smooth transition on hover */
    }

    /* Navbar link hover effect */
    .navbar a:hover {
        background-color: #ddd; /* Light grey background on hover */
        color: #333; /* Darker text color on hover */
    }

    /* Navbar right side items (LOGIN, SIGNUP) */
    .navbar-right {
        display: flex;
        justify-content: flex-end; /* Align items to the right */
        height: 4vh;
    }

    /* Button styles for LOGIN and SIGNUP */
    .navbar-right a {
        background-color: black; /* Black background for the buttons */
        color: white; /* White text color */
        padding: 8px 16px; /* Padding for button */
        border-radius: 5px; /* Rounded corners */
        font-size: 15px; /* Font size for the button text */
        margin: 0 10px; /* Horizontal margin between the buttons */
        text-align: center; /* Center text inside button */
        transition: background-color 0.3s; /* Smooth background color transition */
    }

    /* Hover effect for buttons */
    .navbar-right a:hover {
        background-color: #333; /* Dark grey background on hover */
    }
</style>
</head>
<body>

<!-- Navbar with inline styling -->
<div class="navbar">
    <!-- Left side items -->
    <div class="navbar-left">
        <a href="/">HOME</a>
        <a href="browsearts1">BROWSE ARTS</a>
        <a href="about">ABOUT</a>
    </div>

    <!-- Right side items (LOGIN, SIGNUP) -->
    <div class="navbar-right">
        <a href="visitorreg">SIGNUP</a>
        <a href="visitorlogin">LOGIN</a>
    </div>
</div>

</body>
</html>
