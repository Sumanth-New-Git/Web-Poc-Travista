<%@page import="com.travista.BookingsServlet"%>
<%@page import="com.travista.Booking"%>
<%@page import="java.util.List"%>
<%@ include file="header.jsp" %>
<% String userId = (String) session.getAttribute("userId"); %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bookings</title>
        <link rel="stylesheet" href="css/bookings.css">
     <script src="/js/sessionHandler.js"></script>
    
    
</head>
<body>
    
<div class="booktb">
    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Place Name</th>
                <th>Activities</th>
                <th>Accommodation</th>
                <th>Booking Date</th>
            </tr>
        </thead>
        <tbody>
            <% 
            List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
            if(bookings!=null)
            { for (Booking booking : bookings) {
            %>
                <tr>
                   
                    <td><%= booking.getBookingId() %></td>
                    <td><%= booking.getPlaceName() %></td>
                    <td><%= booking.getActivities() %></td>
                    <td><%= booking.getAccommodation() %></td>
                    <td><%= booking.getBookingDate() %></td>
                </tr>
            <% }} %>
        </tbody>
    </table>
    </div>
</body>
</html>
