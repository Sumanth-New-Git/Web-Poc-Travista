package com.travista;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@javax.servlet.annotation.WebServlet("/confirmBookingServlet")
public class ConfirmBookingServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve values from the request
        String userId = request.getParameter("userId");
        String placeId = request.getParameter("placeId");
        String packageId = request.getParameter("packageId");

        // Initialize variables for generated keys
        int generatedBookId = -1;

        try {
            // Use DBConnection class to get a connection
            Connection connection = DBConnection.getConnection();

            // Insert booking details into the bookings table and retrieve the generated key
            String insertBookingQuery = "INSERT INTO bookings (user_id, place_id, package_id) VALUES (?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertBookingQuery,
                    Statement.RETURN_GENERATED_KEYS)) {
                preparedStatement.setInt(1, Integer.parseInt(userId));
                preparedStatement.setInt(2, Integer.parseInt(placeId));
                preparedStatement.setInt(3, Integer.parseInt(packageId));

                // Execute the query
                int rowsAffected = preparedStatement.executeUpdate();

                // Check if the insertion was successful
                if (rowsAffected > 0) {
                    // Retrieve the generated keys
                    ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        generatedBookId = generatedKeys.getInt(1);
                    }
                }
            }

            // Close the connection
            DBConnection.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set attributes for forwarding to success_failure.jsp
        request.setAttribute("userId", userId);
        request.setAttribute("placeId", placeId);
        request.setAttribute("packageId", packageId);
        request.setAttribute("bookingId", generatedBookId);

        // Forward to success_failure.jsp
        String forwardUrl = "success_failure.jsp?userId=" + userId + "&placeId=" + placeId + "&packageId=" + packageId + "&bookingId=" + generatedBookId;
       response.sendRedirect(forwardUrl);
        //RequestDispatcher dispatcher = request.getRequestDispatcher(forwardUrl);
       // dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
