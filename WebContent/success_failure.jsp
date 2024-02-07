<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="header.jsp" %>

<head>
    <link rel="stylesheet" href="./css/success.css">
    <script src="/js/sessionHandler.js"></script>
    <!-- Add any additional styles or scripts if needed -->
</head>
<body>
    <!-- Success Message Container -->
    <div class="success-container">
        <!-- Retrieve values from the request -->
        <% String userId = request.getParameter("userId"); %>
        <% String placeId = request.getParameter("placeId"); %>
        <% String packageId = request.getParameter("packageId"); %>
        <% String bookingId = request.getParameter("bookingId"); %>

        <% if (bookingId != null && Integer.parseInt(bookingId) > 0) { %>
            <h2>Booking Confirmed!</h2>
            <p>User ID: <%= userId %></p>
            <p>Place ID: <%= placeId %></p>
            <p>Package ID: <%= packageId %></p>
            <p>Booking ID: <%= bookingId %></p>
        <% } else { %>
            <h2>Booking failed!</h2>
            <p>Unfortunately, we were unable to process your booking request.</p>
        <% } %>
        <!-- Add any additional information or links as needed -->
        <!-- Link back to the home page or other relevant pages -->
        <p><a href="main.jsp">Back to Home</a></p>
    </div>
</body>
</html>
