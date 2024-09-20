package com.enomypackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Admin")
public class AdminLoginServlet extends HttpServlet {
    // JDBC URL, username, and password
    private static final String JDBC_URL = "jdbc:mysql://127.0.0.1:3306/registration_db";
    private static final String JDBC_USER = "root"; // Change if your MySQL username is different
    private static final String JDBC_PASSWORD = "yana"; // Change if your MySQL password is set

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Load the MySQL Connector/J driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("registration-error.jsp");
            return;
        }

        // Establish connection
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            // Prepare SQL statement
            String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND role = 'ADMIN'";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                // Set parameters
                statement.setString(1, username);
                statement.setString(2, password);

                // Execute the query
                ResultSet resultSet = statement.executeQuery();

                // Check if user with ADMIN role exists and password matches
                if (resultSet.next()) {
                    // Login successful
                    // Set a session attribute to remember the logged-in user
                    request.getSession().setAttribute("username", username);
                    response.sendRedirect("adminMain.jsp");
                } else {
                    // Login failed
                    response.sendRedirect("login-error.jsp");
                }
            }
        } catch (SQLException e) {
            // Handle database connection or SQL errors
            e.printStackTrace();
            response.sendRedirect("login-error.jsp");
        }
    }
}
