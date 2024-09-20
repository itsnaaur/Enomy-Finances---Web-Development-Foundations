<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
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
	
	    /* Body styles */
	    .body-content {
	        padding: 20px;
	    }
	    
	
	    .services {
	        display: flex;
	        justify-content: space-between;
	        margin-top: 20px;
	    }
	
	    .service {
	        width: 30%;
	        padding: 10px;
	        border: 1px solid #e0e0e0;
	        border-radius: 5px;
	    }
	
	    /* Footer styles */
	    footer {
	        margin-top: 50px;
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
	
	    /* Add some styling to the social media icons */
	    .social-media {
	        margin-top: 20px;
	    }
	
	    .social-media a {
	        margin-right: 10px;
	        color: #ffffff; /* Adjust color as needed */
	        font-size: 24px; /* Adjust size as needed */
	    }
	
	    .social-media a:hover {
	        color: #405da8; /* Adjust hover color as needed */
	    }
	
	    /* Style for the login box */
	    /* Style for the login box */
   		.login-box {
	        border: 1px solid black;
	        padding: 20px;
	        margin-right: 121px; /* Center the login box horizontally */
	        margin-top: 95px;
	        width: 400px; /* Adjust the width as needed */
	        height: 300px;
	        box-shadow: 0 0 50px rgba(64, 93, 168, 1);
	    }
	
	    /* Style for the login form */
	    .login-form {
	        text-align: center;
	    }
	
	    .login-form input {
	        margin-bottom: 10px;
	        width: 100%; /* Make the input fields 100% width */
	        padding: 5px; /* Increase padding for bigger size */
	        font-size: 16px; /* Increase font size for bigger size */
	        border-radius: 5px; /* Add border-radius for rounded corners */
	        border: 1px solid #ccc; /* Add border */
	    }
	
	    .login-form button {
	        background-color: #344b9b;
	        color: white;
	        border: none;
	        padding: 15px 30px; /* Increase padding for bigger size */
	        cursor: pointer;
	        border-radius: 5px; /* Add border-radius for rounded corners */
	        font-size: 18px; /* Increase font size for bigger size */
	    }
	
	    .login-form button:hover {
	        background-color: #253875;
	    }
	</style>
	    
</head>
<body>
    <header style="display: flex; align-items: center; box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2);">
        <img src="Website Logo.png" alt="Logo" style="margin-left: 60px;">
        <div class="header-title" style="color: black; margin-right: 10px;">
        </div>
        <div class="header-links">
            
        </div>
    </header>
    

    <div class="body-content">
        <div id="services" class="services">
            <div class="service" style="border: 0px solid black; padding: 0px; margin-left: 130px; box-shadow: 0 0 0px rgba(64, 93, 168, 1);">
                <img src="Website Image.png" alt="Your Image" style="display: block; margin: 0 auto;">
            </div>
                
            <div class="service login-box">
                <h2 style="text-align: center;">Admin Login</h2>
                <form class="login-form" action="Admin" method="post">
                    <div>
                        <input type="text" id="username" name="username" placeholder="Username" required>
                    </div>
                    <div>
                        <input type="password" id="password" name="password" placeholder="Password" required>
                    </div>
                    <button type="submit" style="margin-top: 30px;">Login</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Back to Index link -->
    <div style="margin-left: 920px; margin-top: -50px; margin-bottom: 90px;">
        <a href="index.jsp" style="text-decoration: none; color: #344b9b; font-size: 13px; font-weight: bold;">Back to Home Page</a>
    </div>

    <footer id="footer">
        <div class="about-us">
            <h2>About Us</h2>
            <p>Enomy-Finances is an organization in the financial sector that provides advice and services
                related to mortgages, savings and investments. Our work includes: assessing clients’ income and 
                outgoings to provide advice on budgeting and consolidating debt, providing access to savings and
                 investment opportunities and managing investment portfolios.</p>
        </div>

        <!-- Social media buttons here -->
        <div class="social-media">
            <a href="#"><i class="fab fa-facebook-square"></i></a>
            <a href="#"><i class="fab fa-twitter-square"></i></a>
            <a href="#"><i class="fab fa-instagram-square"></i></a>
        </div>
    </footer>
</body>
</html>
