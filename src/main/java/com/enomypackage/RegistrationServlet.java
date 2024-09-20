package com.enomypackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    // JDBC URL, username, and password
    private static final String JDBC_URL = "jdbc:mysql://127.0.0.1:3306/registration_db";
    private static final String JDBC_USER = "root"; // Change if your MySQL username is different
    private static final String JDBC_PASSWORD = "yana"; // Change if your MySQL password is set

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from the request
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String incomeDetails = request.getParameter("incomeDetails");
        String outgoingExpenses = request.getParameter("outgoingExpenses");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String currentCurrency = request.getParameter("currentCurrency");

        // Load the MySQL Connector/J driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("registration-error.jsp");
            return;
        }

        // Perform validation
        boolean isValid = true;
        String errorMessage = "";

        // Validate all fields (including confirm password and current currency)
        if (fullName == null || fullName.trim().isEmpty()) {
            isValid = false;
            errorMessage += "Full Name is required. ";
        }

        // Validation for other fields...

        // If validation fails, forward to error page
        if (!isValid) {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("registration-error.jsp").forward(request, response);
            return;
        }

        // Establish connection
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
        	
        	String checkUsernameQuery = "SELECT COUNT(*) FROM users WHERE username = ?";
            try (PreparedStatement checkStatement = conn.prepareStatement(checkUsernameQuery)) {
                checkStatement.setString(1, username);
                try (ResultSet resultSet = checkStatement.executeQuery()) {
                    if (resultSet.next()) {
                        int count = resultSet.getInt(1);
                        if (count > 0) {
                            // Username already exists, return error
                            isValid = false;
                            errorMessage += "Username already exists. Please choose a different one. ";
                        }
                    }
                }
            }
            // Prepare SQL statement
            String sql = "INSERT INTO users (full_name, email, phone_number, address, income_details, "
                    + "outgoing_expenses, username, password, current_currency) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                // Set parameters
                statement.setString(1, fullName);
                statement.setString(2, email);
                statement.setString(3, phoneNumber);
                statement.setString(4, address);
                statement.setString(5, incomeDetails);
                statement.setString(6, outgoingExpenses);
                statement.setString(7, username);
                statement.setString(8, password);
                statement.setString(9, currentCurrency);

                // Execute the statement
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    // Data inserted successfully
                    response.sendRedirect("SuccessMessage.jsp");
                } else {
                    // Handle insertion failure
                    response.sendRedirect("registration-error.jsp");
                }
            }
        } catch (SQLException e) {
            // Handle database connection or SQL errors
            e.printStackTrace();
            response.sendRedirect("registration-error.jsp");
        }
    }
}
