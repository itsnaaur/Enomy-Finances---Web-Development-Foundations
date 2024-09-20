<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
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

        /* Registration form styles */
        .registration-form {
            margin: 0 auto; /* Centering the box */
            width: 35%; /* Adjust as needed */
            padding: 20px;
            border: 2px solid #000000; /* Add border */
            border-radius: 5px;
            box-shadow: 0 0 50px rgba(64, 93, 168, 1);
        }

        .registration-form h2 {
            text-align: center;
        }

        .registration-form p {
            text-align: left;
            margin-top: 10px;
            font-size: 14px; /* Reduce font size for paragraph headings */
        }

        /* Adjust input field sizes */
        .registration-form input[type="text"],
        .registration-form input[type="email"],
        .registration-form input[type="tel"],
        .registration-form input[type="password"] {
            width: calc(100% - 20px); /* Set the width to 100% of the container minus padding */
            margin: 5px auto; /* Center the inputs */
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px; /* Reduce font size for input fields */
        }

        .registration-form select {
		    width: calc(100% - 20px); /* Set the width to 100% of the container minus padding */
		    margin: 5px auto; /* Center the select */
		    padding: 8px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    font-size: 14px; /* Reduce font size for select */
		    box-sizing: border-box; /* Include padding and border in the width calculation */
		}

        .registration-form input[type="submit"] {
            display: block; /* Change the display property to block */
            margin: 20px auto 0; /* Add margin to the top and use auto for left and right margins */
            padding: 10px 20px;
            background-color: #344b9b;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .registration-form input[type="submit"]:hover {
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

    <!-- Registration form -->
    <div class="registration-form">
		    <h2>Registration Form</h2>
		    <form action="register" method="post">
		
		        Full Name: <input type="text" name="fullName" required><br>
		        Username: <input type="text" name="username" required><br>
		        Email: <input type="email" name="email" required><br>
		        Phone Number: <input type="tel" name="phoneNumber" required><br>
		        Address: <input type="text" name="address" required><br>
		        Current Currency: 
		        <select name="currentCurrency" required>
		            <option value="">Select Currency</option>
		            <option value="GBP">Pounds Sterling (GBP)</option>
		            <option value="USD">American Dollars (USD)</option>
		            <option value="EUR">Euro (EUR)</option>
		            <option value="BRL">Brazilian Real (BRL)</option>
		            <option value="JPY">Japanese Yen (JPY)</option>
		            <option value="TRY">Turkish Lira (TRY)</option>
		        </select><br>
		        Income Details: <input type="text" name="incomeDetails" required><br>
		        Outgoing Expenses: <input type="text" name="outgoingExpenses" required><br>
		        Password: <input type="password" name="password" id="password" required><br>
		        Confirm Password: <input type="password" name="confirmPassword" id="confirmPassword" required><br>
		        
		        <input type="submit" value="Register" onclick="return validatePassword()">
		    </form>
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
    
    <script>
        function validatePassword() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
