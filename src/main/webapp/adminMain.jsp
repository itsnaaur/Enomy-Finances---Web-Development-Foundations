<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Main Page</title>
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

        /* Center the title and table */
        h1 {
            text-align: center;
        }

        /* Style for rows with Admin full name */
        .admin-row {
            background-color: red; /*  red */
        }

        /* Style for the table container */
        .table-container {
            margin: 0 auto; /* Center the container horizontally */
            padding: 20px; /* Add padding around the table */
            max-width: 80%; /* Set maximum width for the container */
        }

    </style>
</head>
<body>
<header style="display: flex; align-items: center; box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2);">
    <img src="Website Logo.png" alt="Logo" style="margin-left: 60px;">
    <div class="header-links" style="font-weight: bold;">
    <a href="index.jsp" style="font-weight: bold; margin-right: 60px;">Logout</a>
    </div>
</header>

<h1>ADMIN</h1>
<h1>User Information</h1>

<div class="table-container">
<table border="1">
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Address</th>
        <th>Income Details</th>
        <th>Outgoing Expenses</th>
        <th>Username</th>
        <th>Current Currency</th>
        <th>Status</th>
        <th>Role</th>
    </tr>
    <%
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establishing database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/registration_db", "root", "yana");

            // SQL query to retrieve user information
            String sql = "SELECT id, full_name, email, phone_number, address, income_details, outgoing_expenses, " +
                         "username, current_currency, is_suspended, role " +
                         "FROM users";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            // Iterating over the result set and displaying user information
            while (rs.next()) {
                %>
                <tr class="<%= rs.getString("full_name").equals("Admin") ? "admin-row" : "" %>">
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("full_name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("phone_number") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td><%= rs.getString("income_details") %></td>
                    <td><%= rs.getString("outgoing_expenses") %></td>
                    <td><%= rs.getString("username") %></td>
                    <td><%= rs.getString("current_currency") %></td>
                    <td><%= rs.getBoolean("is_suspended") ? "Suspended" : "Active" %></td>
                    <td><%= rs.getString("role") %></td>
                </tr>
                <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Closing resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</table>
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
