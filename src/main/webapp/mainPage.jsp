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
        <a href="index.jsp" style="font-weight: bold; margin-right: 60px;">Logout</a>
    </div>
</header>

<!-- Services Offered title -->
<div class="services-title">
    Services Offered
</div>

<div class="body-content">
    <div id="services" class="services">
        <div class="service" style="border: 1px solid black; padding: 20px; margin-left: 200px; margin-right: auto; box-shadow: 0 0 50px rgba(64, 93, 168, 1); text-align: center;">
    <h2>Currency Conversion</h2>
    
		    <!-- Display error message if any -->
		<% if (request.getAttribute("currencyConversionErrorMessage") != null) { %>
		    <div style="color: red; font-size: 18px; font-weight: bold;">
		        Error: <%= request.getAttribute("currencyConversionErrorMessage") %>
		    </div>
		<% } %>
    
    
    <table style="margin: 0 auto 25px; border-collapse: collapse; border: 1px solid black;">
    
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
    
		   <% if (request.getAttribute("convertedAmount") != null) { %>
		    <div style="color: green; font-size: 18px; font-weight: bold;">
		        Converted Amount: <%= String.format("%.2f", request.getAttribute("convertedAmount")) %>
		    </div>
		    
		    <!-- Calculate and display transaction fee percentage if available -->
		    <% if (request.getAttribute("transactionFeePercentage") != null) { %>
		        <% double transactionFeePercentage = (double) request.getAttribute("transactionFeePercentage"); %>
		        <div style="color: red; font-size: 18px; font-weight: bold;">
		            Transaction Fee Percentage: <%= transactionFeePercentage %>%
		        </div>
		        
		        <!-- Display transaction fee amount if available -->
		        <% if (request.getAttribute("transactionFeeAmount") != null) { %>
		            <% double transactionFeeAmount = (double) request.getAttribute("transactionFeeAmount"); %>
		            <div style="color: red; font-size: 18px; font-weight: bold;">
		                Transaction Fee Amount: <%= String.format("%.2f", transactionFeeAmount) %>
		            </div>
		            
		            <!-- Display total amount -->
		            <% double totalAmount = (double) request.getAttribute("convertedAmount") - transactionFeeAmount; %>
		            <div style="color: blue; font-size: 18px; font-weight: bold;">
		                Total Amount: <%= String.format("%.2f", totalAmount) %>
		            </div>
		            
		            <!-- Display error message if any -->
				    <% if (request.getAttribute("errorMessage") != null) { %>
				        <div style="color: red; font-size: 18px; font-weight: bold;">
				            Error: <%= request.getAttribute("errorMessage") %>
				        </div>
				    <% } %>
		        <% } %>
		    <% } %>
		<% } %>
   
   
    <form action="CurrencyConversionServlet" method="post" style="text-align: center;">
        <div style="margin-bottom: 10px;">
            <label for="fromCurrency" style="width: 50px; display: inline-block; text-align: left; font-size: 16px; font-weight: bold;">From:</label>
            <select id="fromCurrency" name="fromCurrency" style="width: 223px; font-size: 16px;">
                <option value="USD">USD</option>
                <option value="JPY">JPY</option>
                <option value="EUR">EUR</option>
                <option value="BRL">BRL</option>
                <option value="GBP">GBP</option>
                <option value="TRY">TRY</option>
            </select>
        </div>
        <div style="margin-bottom: 10px;">
            <label for="amount" style="width: 65px; display: inline-block; text-align: left; font-size: 16px; font-weight: bold;">Amount:</label>
            <input type="number" id="amount" name="amount" min="0" step="0.01" style="width: 200px; font-size: 16px;">
        </div>
        <div style="margin-bottom: 10px;">
            <label for="toCurrency" style="width: 50px; display: inline-block; text-align: left; font-size: 16px; font-weight: bold;">To:</label>
            <select id="toCurrency" name="toCurrency" style="width: 223px; font-size: 16px;">
                <option value="USD">USD</option>
                <option value="JPY">JPY</option>
                <option value="EUR">EUR</option>
                <option value="BRL">BRL</option>
                <option value="GBP">GBP</option>
                <option value="TRY">TRY</option>
            </select>
            
            <div style="margin-bottom: 10px; margin-top: 10px">
            <label for="password" style="width: 80px; display: inline-block; text-align: left; font-size: 16px; font-weight: bold;">Password:</label>
            <input type="password" id="password" name="password" style="width: 185px; font-size: 16px;">
        </div>
        
        </div>
        <input type="submit" value="Convert" style="font-size: 18px; font-weight: bold;">
    </form>
</div>
        
        
        <div class="service" style="border: 1px solid black; padding: 20px; margin-right: 200px; box-shadow: 0 0 50px rgba(64, 93, 168, 1); text-align: center;">
    <h2 style="font-weight: bold;">Savings and Investments</h2>
    
    
		    <!-- Display error message if any -->
		<% if (request.getAttribute("savingsInvestmentsErrorMessage") != null) { %>
		    <p style="color: red; font-weight: bold;"><%= request.getAttribute("savingsInvestmentsErrorMessage") %></p>
		<% } %>
		    
    
    <form action="SavingsAndInvestmentServlet" method="post" style="margin: 0 auto; max-width: 400px;">
        <label for="lumpSum" style="font-weight: bold; font-size: 16px;">Initial Lump Sum to be Invested (£):</label><br>
        <input type="text" id="lumpSum" name="lumpSum" style="font-size: 16px; width: 70%;"><br><br>
        
        <label for="monthlyInvestment" style="font-weight: bold; font-size: 16px;">Monthly Amount to be Invested (£):</label><br>
        <input type="text" id="monthlyInvestment" name="monthlyInvestment" style="font-size: 16px; width: 70%;"><br><br>
        
        <label for="investmentType" style="font-weight: bold; font-size: 16px;">Type of Investment:</label><br>
        <select id="investmentType" name="investmentType" style="font-size: 16px; width: 70%;">
            <option value="Basic Savings Plan">Basic Savings Plan</option>
            <option value="Savings Plan Plus">Savings Plan Plus</option>
            <option value="Managed Stock Investments">Managed Stock Investments</option>
        </select><br><br>
        
        <label for="password" style="font-weight: bold; font-size: 16px;">Enter Password:</label><br>
        <input type="password" id="password" name="password" style="font-size: 16px; width: 70%;"><br><br>
        
        <input type="submit" value="Calculate" style="font-size: 18px; font-weight: bold;">
    </form>
        
    
    <% if (request.getAttribute("investmentType") != null) { %>
    <h2>Investment Type: <%= request.getAttribute("investmentType") %></h2>

    <!-- Display predicted returns -->
    <h3>Predicted Returns:</h3>
    <p style="color: blue; font-weight: bold;">Minimum Return: £<%= String.format("%.2f", request.getAttribute("minReturn")) %></p>
	<p style="color: green; font-weight: bold;">Maximum Return: £<%= String.format("%.2f", request.getAttribute("maxReturn")) %></p>

    <!-- Display total profits, fees, and taxes -->
    <h3>Total Profits, Fees, and Taxes:</h3>
    <table border="1" style="margin: 0 auto">
        <tr>
            <th>Time Frame</th>
            <th>Total Profits</th>
            <th>Total Fees</th>
            <th>Total Taxes</th>
        </tr>
        <tr>
            <td>1 Year</td>
            <td>£<%= String.format("%.2f", request.getAttribute("totalProfit1Year")) %></td>
            <td>£<%= String.format("%.2f", request.getAttribute("totalFees1Year")) %></td>
            <td>£<%= String.format("%.2f", request.getAttribute("totalTaxes1Year")) %></td>
        </tr>
        <tr>
            <td>5 Years</td>
            <td>£<%= String.format("%.2f", request.getAttribute("totalProfit5Years")) %></td>
            <td>£<%= String.format("%.2f", request.getAttribute("totalFees5Years")) %></td>
            <td>£<%= String.format("%.2f", request.getAttribute("totalTaxes5Years")) %></td>
        </tr>
        <tr>
            <td>10 Years</td>
            <td>£<%= String.format("%.2f", request.getAttribute("totalProfit10Years")) %></td>
            <td>£<%= String.format("%.2f", request.getAttribute("totalFees10Years")) %></td>
            <td>£<%= String.format("%.2f", request.getAttribute("totalTaxes10Years")) %></td>
        </tr>
    </table>
<% } %>

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
