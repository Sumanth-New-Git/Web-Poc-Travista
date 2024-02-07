package com.travista;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/bookings")
public class BookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException,ServletException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        String uId = (String) request.getParameter("userId");
        

       if(userId!=null) 
       { 
    	List<Booking> bookings = getBookings(userId);
        request.setAttribute("bookings", bookings);
       }
       
       
        String forwardUrl = "bookings.jsp?userId=" + userId;
        //response.sendRedirect(forwardUrl);
        request.getRequestDispatcher(forwardUrl).forward(request, response);
    }

    private List<Booking> getBookings(String userId) {
        List<Booking> bookings = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBConnection.getConnection();
            String query = "SELECT * FROM bookings "
                    + "JOIN place ON bookings.place_id = place.place_id "
                    + "JOIN packages ON bookings.package_id = packages.package_id "
                    + "WHERE user_id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userId);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Booking booking = new Booking(
                        resultSet.getInt("booking_id"),
                        resultSet.getString("place_name"),
                        resultSet.getString("activities"),
                        resultSet.getString("accommodation"),
                        resultSet.getTimestamp("booking_date")
                );
                bookings.add(booking);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection(connection);
        }

        return bookings;
    }
}
