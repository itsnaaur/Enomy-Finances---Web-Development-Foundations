<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success!</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Garet&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style> 
        /* Define your CSS styles here */
        body {
            font-family: 'Garet', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            color: #000000;
        }

        /* Header styles */
        header {
            background-color: #e6ecff;
            color: #ffffff;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 60px;
        }

        header img {
            height: 60px; /* Adjust as needed */
        }

        .header-links {
            display: flex;
        }

        .header-links a {
            color: #000000;
            text-decoration: none;
            margin-left: 20px;
        }

        /* Footer styles */
        footer {
            margin-top: 70px;
            background-color: #344b9b;
            color: #ffffff;
            padding: 20px;
            text-align: center;
        }

        footer a {
            color: #ffffff;
            text-decoration: none;
            margin: 0 10px;
        }


        /* Image styles */
        .greetings-image {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Button styles */
		.login-button {
		    text-align: center;
		}
		
		.login-button button {
		    padding: 10px 20px;
		    background-color: #344b9b;
		    color: #ffffff;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 16px; /* Increase font size */
		    font-weight: bold; /* Make font bold */
		}
		
		.login-button button:hover {
		    background-color: #405da8;
		}
   
    </style>
</head>
<body>
    <header style="display: flex; align-items: center; box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2);">
        <img src="Website Logo.png" alt="Logo" style="margin-left: 60px;">
        <div class="header-links" style="font-weight: bold;">
            <a href="loginPage.jsp" style="margin-right: 60px;">Login</a>
        </div>
    </header>

    <!-- Image -->
    <div class="greetings-image">
        <img src="Success Image.png" alt="Greetings Image">
    </div>

    <!-- Login button -->
    <div class="login-button">
        <button onclick="location.href='loginPage.jsp'">Login</button>
    </div>
    
    <!-- Back to Index link -->
	<div style="text-align: center; margin-top: 20px;">
	    <a href="index.jsp" style="text-decoration: none; color: #344b9b; font-size: 13px; font-weight: bold;">Back to Home Page</a>
	</div>
	    
    

    <footer id="footer">
        <div class="about-us">
            <h2>About Us</h2>
            <p>Enomy-Finances is an organization in the financial sector that provides advice and services related to mortgages, savings, and investments. Our work includes: assessing clients’ income and outgoings to provide advice on budgeting and consolidating debt, providing access to savings and investment opportunities, and managing investment portfolios.</p>
        </div>
    </footer>
</body>
</html>
