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

@WebServlet("/CurrencyConversionServlet")
public class CurrencyConversionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
 // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://127.0.0.1:3306/registration_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "yana";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    	    Class.forName("com.mysql.cj.jdbc.Driver");
    	} catch (ClassNotFoundException e) {
    	    e.printStackTrace();
    	    // Handle the case where the driver class is not found
    	}

    	
    	String password = request.getParameter("password");
        String fromCurrency = request.getParameter("fromCurrency");
        String toCurrency = request.getParameter("toCurrency");
        String amountString = request.getParameter("amount");


        // Check if any field is empty
        if (password.isEmpty() || fromCurrency.isEmpty() || toCurrency.isEmpty() || amountString.isEmpty()) {
            request.setAttribute("currencyConversionErrorMessage", "All fields are required.");
            request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
            return;
        }
        
     // Inside the doPost method
     // Check if password is correct
     if (!isPasswordValid(password)) {
         // Incorrect password
         request.setAttribute("errorMessage", "Incorrect password.");
         request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
         return;
     }


        double amount;
        double convertedAmount = 0;
        double transactionFee = 0;
        double totalAmount = 0;
        double transactionFeePercentage = 0; // Declare transactionFeePercentage

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // Handle the case where the driver class is not found
            e.printStackTrace();
            // Optionally, set an error message and forward to an error page
            request.setAttribute("errorMessage", "Failed to load JDBC driver");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        // Validate password
        if (password == null || password.isEmpty()) {
            // Password is required
            request.setAttribute("errorMessage", "Password is required.");
            request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
            return;
        }

        try {
            amount = Double.parseDouble(amountString);
            // Validate amount range
            if (amount < 300 || amount > 5000) {
                // Amount is out of range, set error message
                request.setAttribute("errorMessage", "Amount must be between 300 and 5000");
                // Forward the request to the main page
                request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
                return;
            }

            if (amount <= 500) {
                transactionFeePercentage = 3.5;
            } else if (amount <= 1500) {
                transactionFeePercentage = 2.7;
            } else if (amount <= 2500) {
                transactionFeePercentage = 2.0;
            } else {
                transactionFeePercentage = 1.5;
            }

            transactionFee = calculateTransactionFee(amount, transactionFeePercentage);
            double conversionRate = getConversionRate(fromCurrency, toCurrency);
            convertedAmount = amount * conversionRate;
            totalAmount = convertedAmount + transactionFee;
        } catch (NumberFormatException e) {
            // Invalid amount format, set error message
            request.setAttribute("errorMessage", "Invalid amount format");
            // Forward the request to the main page
            request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
            return;
        }

        // Check if password is correct
        int userId = getUserIdByPassword(password);
        if (userId == -1) {
            // Incorrect password
            request.setAttribute("errorMessage", "Incorrect password.");
            request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
            return;
        }

        // Store data in the database
        saveConversionData(userId, amount, fromCurrency, toCurrency, convertedAmount, transactionFee, totalAmount);

        // Set attributes for displaying results
        request.setAttribute("convertedAmount", convertedAmount);
        request.setAttribute("transactionFee", transactionFee);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("transactionFeePercentage", transactionFeePercentage); // Set transaction fee percentage
        request.setAttribute("transactionFeeAmount", transactionFee); // Set transaction fee amount

        // Forward the request to the main page
        request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
    }




    private double calculateTransactionFee(double amount, double transactionFeePercentage) {
        return amount * (transactionFeePercentage / 100);
    }

    
    private double getConversionRate(String fromCurrency, String toCurrency) {
    	//USD
        if (fromCurrency.equals("USD") && toCurrency.equals("GBP")) {
            return 0.79;
        } else if (fromCurrency.equals("USD") && toCurrency.equals("EUR")) {
            return 0.93;
        } else if (fromCurrency.equals("USD") && toCurrency.equals("BRL")) {
            return 4.97;
        } else if (fromCurrency.equals("USD") && toCurrency.equals("JPY")) {
            return 149.87;
        } else if (fromCurrency.equals("USD") && toCurrency.equals("TRY")) {
            return 30.74;
        //GBP
        } else if (fromCurrency.equals("GBP") && toCurrency.equals("USD")) {
            return 1.26;
        } else if (fromCurrency.equals("GBP") && toCurrency.equals("EUR")) {
            return 1.17;
        } else if (fromCurrency.equals("GBP") && toCurrency.equals("BRL")) {
            return 6.25;
        } else if (fromCurrency.equals("GBP") && toCurrency.equals("JPY")) {
            return 188.69;
        } else if (fromCurrency.equals("GBP") && toCurrency.equals("TRY")) {
            return 38.71;
        //EUR
        } else if (fromCurrency.equals("EUR") && toCurrency.equals("USD")) {
            return 1.08;
        } else if (fromCurrency.equals("EUR") && toCurrency.equals("GBP")) {
            return 0.86;
        } else if (fromCurrency.equals("EUR") && toCurrency.equals("BRL")) {
            return 5.35;
        } else if (fromCurrency.equals("EUR") && toCurrency.equals("JPY")) {
            return 161.58;
        } else if (fromCurrency.equals("EUR") && toCurrency.equals("TRY")) {
            return 33.15;
        //BRL
        } else if (fromCurrency.equals("BRL") && toCurrency.equals("USD")) {
            return 0.20;
        } else if (fromCurrency.equals("BRL") && toCurrency.equals("GBP")) {
            return 0.16;
        } else if (fromCurrency.equals("BRL") && toCurrency.equals("EUR")) {
            return 0.19;
        } else if (fromCurrency.equals("BRL") && toCurrency.equals("JPY")) {
            return 30.14;
        } else if (fromCurrency.equals("BRL") && toCurrency.equals("TRY")) {
            return 6.18;
        //JPY
        } else if (fromCurrency.equals("JPY") && toCurrency.equals("USD")) {
            return 0.21;
        } else if (fromCurrency.equals("JPY") && toCurrency.equals("GBP")) {
            return 0.0053;
        } else if (fromCurrency.equals("JPY") && toCurrency.equals("EUR")) {
            return 0.0062;
        } else if (fromCurrency.equals("JPY") && toCurrency.equals("BRL")) {
            return 0.033;
        } else if (fromCurrency.equals("JPY") && toCurrency.equals("TRY")) {
            return 0.21;
        //TRY
        } else if (fromCurrency.equals("TRY") && toCurrency.equals("USD")) {
            return 0.033;
        } else if (fromCurrency.equals("TRY") && toCurrency.equals("GBP")) {
            return 0.026;
        } else if (fromCurrency.equals("TRY") && toCurrency.equals("EUR")) {
            return 0.030;
        } else if (fromCurrency.equals("TRY") && toCurrency.equals("BRL")) {
            return 0.16;
        } else if (fromCurrency.equals("TRY") && toCurrency.equals("JPY")) {
            return 4.88;
        } else {
            return 1.0;
        }
    }
        
    
    private boolean isPasswordValid(String password) {
        try {
            // Establish database connection
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Prepare SQL statement
            String sql = "SELECT password FROM users";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Execute SQL statement
            ResultSet resultSet = statement.executeQuery();

            // Check if password matches
            while (resultSet.next()) {
                String storedPassword = resultSet.getString("password");
                if (password.equals(storedPassword)) {
                    // Close resources
                    resultSet.close();
                    statement.close();
                    connection.close();
                    return true;
                }
            }

            // Close resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
        }

        return false; // Password not found or doesn't match
    }
    
    private int getUserIdByPassword(String password) {
        try {
            // Establish database connection
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Prepare SQL statement
            String sql = "SELECT id FROM users WHERE password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, password);

            // Execute SQL statement
            ResultSet resultSet = statement.executeQuery();

            // Check if password matches
            if (resultSet.next()) {
                int userId = resultSet.getInt("id");
                // Close resources
                resultSet.close();
                statement.close();
                connection.close();
                return userId;
            }

            // Close resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
        }

        return -1; // Password not found or doesn't match
    }

    
    private void saveConversionData(int userId, double amount, String fromCurrency, String toCurrency, double convertedAmount, double transactionFee, double totalAmount) {
        try {
            // Establish database connection
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Prepare SQL statement
            String sql = "INSERT INTO conversion_data (user_id, amount, from_currency, to_currency, converted_amount, transaction_fee, total_amount) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setDouble(2, amount);
            statement.setString(3, fromCurrency);
            statement.setString(4, toCurrency);
            statement.setDouble(5, convertedAmount);
            statement.setDouble(6, transactionFee);
            statement.setDouble(7, totalAmount);

            // Execute SQL statement
            statement.executeUpdate();

            // Close resources
            statement.close();
            connection.close();
        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
        }
    }
}