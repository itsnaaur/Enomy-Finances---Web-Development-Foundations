package com.enomypackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SavingsAndInvestmentServlet")
public class SavingsAndInvestmentServlet extends HttpServlet {
    
    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://127.0.0.1:3306/registration_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "yana";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Load the MySQL JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to load JDBC driver");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        // Retrieve form inputs
        String password = request.getParameter("password");
        String lumpSumStr = request.getParameter("lumpSum");
        String monthlyInvestmentStr = request.getParameter("monthlyInvestment");
        String investmentType = request.getParameter("investmentType");

        // Check if any field is empty
        if (password.isEmpty() || lumpSumStr.isEmpty() || monthlyInvestmentStr.isEmpty()) {
            request.setAttribute("savingsInvestmentsErrorMessage", "All fields are required.");
            request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
            return;
        }

        // Parse numerical inputs
        double lumpSum = 0.0;
        double monthlyInvestment = 0.0;
        try {
            lumpSum = Double.parseDouble(lumpSumStr);
            monthlyInvestment = Double.parseDouble(monthlyInvestmentStr);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Lump sum and monthly investment must be numbers.");
            request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
            return;
        }

        // Validate password
        if (password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "Password is required.");
            request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
            return;
        }
     

        // Check if password is correct
        int userId = getUserIdByPassword(password);
        if (userId == -1) {
            request.setAttribute("errorMessage", "Incorrect password.");
            request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
            return;
        }

     // Calculate returns based on investment type
        double maxReturn = 0.0; // Only keeping maxReturn since minReturn is not used
        double totalProfit1Year = 0.0;
        double totalProfit5Years = 0.0;
        double totalProfit10Years = 0.0;
        double totalFees1Year = 0.0;
        double totalFees5Years = 0.0;
        double totalFees10Years = 0.0;
        double totalTaxes1Year = 0.0;
        double totalTaxes5Years = 0.0;
        double totalTaxes10Years = 0.0;

        switch (investmentType) {
            case "Basic Savings Plan":
                maxReturn = calculateReturn(lumpSum, monthlyInvestment, 0.024);
                totalProfit1Year = maxReturn - lumpSum;
                totalProfit5Years = maxReturn * 5 - lumpSum - (monthlyInvestment * 12 * 4);
                totalProfit10Years = maxReturn * 10 - lumpSum - (monthlyInvestment * 12 * 9);
                totalFees1Year = lumpSum * 0.0025;
                totalFees5Years = totalFees1Year * 5;
                totalFees10Years = totalFees1Year * 10;
                break;
            case "Savings Plan Plus":
                maxReturn = calculateReturn(lumpSum, monthlyInvestment, 0.055);
                totalProfit1Year = maxReturn - lumpSum;
                totalProfit5Years = maxReturn * 5 - lumpSum - (monthlyInvestment * 12 * 4);
                totalProfit10Years = maxReturn * 10 - lumpSum - (monthlyInvestment * 12 * 9);
                totalFees1Year = lumpSum * 0.003;
                totalFees5Years = totalFees1Year * 5;
                totalFees10Years = totalFees1Year * 10;
                totalTaxes1Year = (totalProfit1Year > 12000) ? totalProfit1Year * 0.1 : 0;
                totalTaxes5Years = (totalProfit5Years > 12000) ? totalProfit5Years * 0.1 : 0;
                totalTaxes10Years = (totalProfit10Years > 12000) ? totalProfit10Years * 0.1 : 0;
                break;
            case "Managed Stock Investments":
                maxReturn = calculateReturn(lumpSum, monthlyInvestment, 0.23);
                totalProfit1Year = maxReturn - lumpSum;
                totalProfit5Years = maxReturn * 5 - lumpSum - (monthlyInvestment * 12 * 4);
                totalProfit10Years = maxReturn * 10 - lumpSum - (monthlyInvestment * 12 * 9);
                totalFees1Year = lumpSum * 0.013;
                totalFees5Years = totalFees1Year * 5;
                totalFees10Years = totalFees1Year * 10;
                totalTaxes1Year = (totalProfit1Year > 12000) ? totalProfit1Year * 0.1 : 0;
                totalTaxes5Years = (totalProfit5Years > 12000) ? totalProfit5Years * 0.1 : 0;
                totalTaxes10Years = (totalProfit10Years > 12000) ? totalProfit10Years * 0.1 : 0;
                if (totalProfit1Year > 40000) totalTaxes1Year += (totalProfit1Year - 40000) * 0.1;
                if (totalProfit5Years > 40000) totalTaxes5Years += (totalProfit5Years - 40000) * 0.1;
                if (totalProfit10Years > 40000) totalTaxes10Years += (totalProfit10Years - 40000) * 0.1;
                if (totalProfit1Year > 40000) totalTaxes1Year += (totalProfit1Year - 40000) * 0.1;
                if (totalProfit5Years > 40000) totalTaxes5Years += (totalProfit5Years - 40000) * 0.1;
                if (totalProfit10Years > 40000) totalTaxes10Years += (totalProfit10Years - 40000) * 0.1;
                if (totalProfit1Year > 120000) totalTaxes1Year += (totalProfit1Year - 120000) * 0.2;
                if (totalProfit5Years > 120000) totalTaxes5Years += (totalProfit5Years - 120000) * 0.2;
                if (totalProfit10Years > 120000) totalTaxes10Years += (totalProfit10Years - 120000) * 0.2;
                break;
            default:
                // Handle invalid investment type
                break;
        }
        
     // Calculate returns based on investment type
     // Your existing switch statement...

     // Set attributes for the JSP
     request.setAttribute("investmentType", investmentType);
     request.setAttribute("maxReturn", maxReturn);
     request.setAttribute("totalProfit1Year", totalProfit1Year);
     request.setAttribute("totalProfit5Years", totalProfit5Years);
     request.setAttribute("totalProfit10Years", totalProfit10Years);
     request.setAttribute("totalFees1Year", totalFees1Year);
     request.setAttribute("totalFees5Years", totalFees5Years);
     request.setAttribute("totalFees10Years", totalFees10Years);
     request.setAttribute("totalTaxes1Year", totalTaxes1Year);
     request.setAttribute("totalTaxes5Years", totalTaxes5Years);
     request.setAttribute("totalTaxes10Years", totalTaxes10Years);

     // Forward the request to the JSP for presentation
     request.getRequestDispatcher("/mainPage.jsp").forward(request, response);


        // Save savings and investment data
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            connection.setAutoCommit(false); // Start transaction

            saveSavingsAndInvestmentData(connection, userId, lumpSum, monthlyInvestment, investmentType, 
                totalProfit1Year, totalProfit5Years, totalProfit10Years, 
                totalFees1Year, totalFees5Years, totalFees10Years, 
                totalTaxes1Year, totalTaxes5Years, totalTaxes10Years);

            connection.commit(); // Commit transaction
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to save savings and investment data.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        // Forward the request to a JSP for presentation
        request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
    }

    protected double calculateReturn(double lumpSum, double monthlyInvestment, double rate) {
        // Calculate the return based on the investment type
        // Example calculation (you may need to adjust this based on your requirements)
        double totalInvestment = lumpSum + (monthlyInvestment * 12 * 10); // Assuming 10 years of monthly investment
        return totalInvestment * Math.pow(1 + rate, 10) - totalInvestment;
    }

    protected void saveSavingsAndInvestmentData(Connection connection, int userId, double lumpSum, double monthlyInvestment, String investmentType, 
            double totalProfit1Year, double totalProfit5Years, double totalProfit10Years, 
            double totalFees1Year, double totalFees5Years, double totalFees10Years, 
            double totalTaxes1Year, double totalTaxes5Years, double totalTaxes10Years) throws SQLException {
        String sql = "INSERT INTO savings_and_investment_data (user_id, lump_sum, monthly_investment, investment_type, "
                + "total_profit_1_year, total_profit_5_years, total_profit_10_years, total_fees_1_year, "
                + "total_fees_5_years, total_fees_10_years, total_taxes_1_year, total_taxes_5_years, total_taxes_10_years) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            statement.setDouble(2, lumpSum);
            statement.setDouble(3, monthlyInvestment);
            statement.setString(4, investmentType);
            statement.setDouble(5, totalProfit1Year);
            statement.setDouble(6, totalProfit5Years);
            statement.setDouble(7, totalProfit10Years);
            statement.setDouble(8, totalFees1Year);
            statement.setDouble(9, totalFees5Years);
            statement.setDouble(10, totalFees10Years);
            statement.setDouble(11, totalTaxes1Year);
            statement.setDouble(12, totalTaxes5Years);
            statement.setDouble(13, totalTaxes10Years);
            statement.executeUpdate();
        }
    }

    protected int getUserIdByPassword(String password) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String sql = "SELECT id FROM users WHERE password = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, password);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        return resultSet.getInt("id");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Password not found
    }
}
