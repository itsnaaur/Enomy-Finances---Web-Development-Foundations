<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Enomy-Finances</title>
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
        
        .services-title {
            text-align: center;
            font-size: 36px; /* Increased font size */
            font-weight: bold; /* Bold font weight */
            margin-top: 40px; /* Increased margin top */
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

        /* Image section styles */
        .website-image {
            text-align: center;
            margin-top: 20px;
        }

        .website-image img {
            max-width: 100%;
            height: auto;
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
		        
		        
        
        
        
    </style>
		</head>
		<body>
		   <header style="display: flex; align-items: center; box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2);">
		    <img src="Website Logo.png" alt="Logo" style="margin-left: 60px;">
		    <div class="header-title" style="color: black; margin-right: 10px;">
		    </div>
		    <div class="header-links">
		        <a href="#services" style="font-weight: bold;">Our Services</a>
		        <a href="registrationPage.jsp" style="font-weight: bold;">Register</a>
		        <a href="loginPage.jsp" style="font-weight: bold;">Login</a>
		        <a href="adminLogin.jsp" style="font-weight: bold; margin-right: 60px;">Admin</a>
		    </div>
		</header>
   

		<!-- Website image section -->
		<div class="website-image">
		    <img src="Website Image.png" style="width:30%;" alt="Image 1">
		</div>

		<!-- Services Offered title -->
		    <div class="services-title">
		        Services Offered
		    </div>

		<div class="body-content">
		        <div id="services" class="services">
		        <div class="service" style="border: 1px solid black; padding: 20px; margin-left: 200px; box-shadow: 0 0 50px rgba(64, 93, 168, 1);">
		    <h2 style="text-align: center;">Currency Conversion</h2>
		    <table style="margin: 0 auto; border-collapse: collapse; border: 1px solid black;">
		        <tr>
		            <th style="border: 1px solid black; padding: 8px;">Initial currency amount</th>
		            <th style="border: 1px solid black; padding: 8px;">Fee</th>
		        </tr>
		        <tr>
		            <td style="border: 1px solid black; padding: 8px;">Up to 500</td>
		            <td style="border: 1px solid black; padding: 8px;">3.5%</td>
		        </tr>
		        <tr>
		            <td style="border: 1px solid black; padding: 8px;">Over 500</td>
		            <td style="border: 1px solid black; padding: 8px;">2.7%</td>
		        </tr>
		        <tr>
		            <td style="border: 1px solid black; padding: 8px;">Over 1500</td>
		            <td style="border: 1px solid black; padding: 8px;">2.0%</td>
		        </tr>
		        <tr>
		            <td style="border: 1px solid black; padding: 8px;">Over 2500</td>
		            <td style="border: 1px solid black; padding: 8px;">1.5%</td>
		        </tr>
		    </table>
		    <p style="text-align: center;">Unlock unbeatable conversion rates with Enomy-Finances!</p>
		    <p style="text-align: center;">Whether it's a small transaction or a substantial exchange, 
		    enjoy transparent fees tailored to your needs. </p>
		    <p style="text-align: center;">From just 3.5% for amounts up to 500 units, our rates decrease as 
		    your conversions increase, ensuring you get the most out of your 
		    currency exchange. Trust Enomy-Finances for seamless transactions 
		    and competitive rates every time!</p>
		</div>
				
				
		        	<div class="service" style="border: 1px solid black; padding: 20px; margin-right: 200px; box-shadow: 0 0 50px rgba(64, 93, 168, 1);">
		                <h2 style="text-align: center;">Investments</h2>
		    <table style="margin: 0 auto; border-collapse: collapse; border: 1px solid black;">
		        <tr>
		            <th style="border: 1px solid black; padding: 8px;">Investment Types Offered</th>
		            <th style="border: 1px solid black; padding: 8px;">Information</th>
		        </tr>
		        <tr>
		            <td style="border: 1px solid black; padding: 8px;">Option 1- Basic Savings Plan</td>
		            <td style="border: 1px solid black; padding: 8px;">Maximum Investment per year:  £20 000
		            													For more information register and login</td>
		        </tr>
		        <tr>
		            <td style="border: 1px solid black; padding: 8px;">Option 2- Savings Plan Plus</td>
		            <td style="border: 1px solid black; padding: 8px;">Maximum Investment per year:  £30 000
		            													For more information register and login</td>
		        </tr>
		        <tr>
		            <td style="border: 1px solid black; padding: 8px;">Option 3- Managed Stock Investments</td>
		            <td style="border: 1px solid black; padding: 8px;">Maximum Investment per year:  Unlimited
		            													For more information register and login</td>
		        </tr>
		    </table>
		    <p style="text-align: center;">Discover your pathway to financial growth with Enomy-Finances' diverse investment options!</p>
		    <p style="text-align: center;">Join Enomy-Finances today and let your money work for you! </p>
				</div>
   		 	</div>
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
