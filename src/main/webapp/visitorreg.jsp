<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <style>
        /* General styling for body */
        body {
            
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; /* Light background */
        }

        /* Styling for the registration container */
        .container {
            height: 80vh;
            width: 60vw;
            margin: 50px auto;
            border: 2px solid WhiteSmoke;
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            background-image: url('https://specials-images.forbesimg.com/imageserve/6022d2600897af9201e981f2/960x0.jpg?fit=scale'); /* Background image */
            background-size: cover; /* Ensure the image covers the whole container */
            background-position: center center; /* Center the background image */
            background-repeat: no-repeat; /* Prevent repeating the image */
        }

        /* Styling for the form layout */
        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 60%;
            background-color: rgba(255, 255, 255, 0.6); /* Semi-transparent background for form */
            padding: 20px;
            border-radius: 10px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-container table {
            width: 100%;
        }

        /* Styling for table rows and inputs */
        td {
            padding: 8px;
            font-size: 16px;
        }

        td label {
            display: block;
            font-weight: bold;
        }

        td input, td select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        td select {
            background-color: white;
        }

        /* Styling for submit button */
        button {
            background-color: #333;
            color: white;
            padding: 12px 24px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #555;
        }

        /* Align the footer message */
        .footer-message {
            text-align: center;
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.0);
        }

        .footer-message a {
            color: #007bff;
            text-decoration: none;
        }

        .footer-message a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<%@include file="mainnavbar.jsp" %><br/>

    <!-- Registration form container -->
    <div class="container">
        <div class="form-container">
            <h2>REGISTRATIOIN FORM</h2>
            <form action="insertvisitor" method="POST" enctype="multipart/form-data">
            
                <table>
                    <tr>
                        <td><label for="vfullname">Full Name:</label></td>
                        <td><input type="text" id="fullname" name="vfullname" required></td>
                    </tr>
                    <tr>
                        <td><label for="vemail">Email:</label></td>
                        <td><input type="email" id="email" name="vemail" required></td>
                    </tr>
                    <tr>
                        <td><label for="vpassword">Password:</label></td>
                        <td><input type="password" id="password" name="vpassword" required></td>
                    </tr>
                    <tr>
                        <td><label for="vcontact">Contact Number:</label></td>
                        <td><input type="number" id="contact" name="vcontact" required></td>
                    </tr>
                    <tr>
                        <td><label for="vgender">Gender:</label></td>
                        <td>
                            <select id="gender" name="vgender" required>
                                <option value="">Select</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="vage">Age:</label></td>
                        <td><input type="number" id="age" name="vage" min="1" required></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <button type="submit">Register</button>
                        </td>
                    </tr>
                </table>
            </form>
            <div class="footer-message">
                <p>Already have an account? <a href="visitorlogin" class="link-info">Login here</a></p>
                <p>Register for : <a href="artistreg">Artist</a> / <a href="curatorregistration">Curator</a></p>
            </div>
        </div>
    </div><br/><br/>

</body>
</html>
