<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="header.jsp" %>

<head>
    <link rel="stylesheet" href="./css/book.css">
    <script src="/js/sessionHandler.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
 <% String userId = (String) session.getAttribute("userId"); %>

    <!-- Details Container -->
    <div class="details-container">

        <% 
            String[] userData = (String[]) request.getAttribute("userData");
            String[] placeData = (String[]) request.getAttribute("placeData");
            String[] packageData = (String[]) request.getAttribute("packageData");

            if (userData != null && placeData != null && packageData != null) {
        %>
            <!-- Retrieve user, place, and package data from request attributes -->

            <!-- Display user data -->
            <h2>User Details</h2>
            <p>User ID: <%= userData[0] %></p>   
            <p>Username: <%= userData[1] %></p>
            <p>Email: <%= userData[2] %></p>
            <!-- Add other user properties if needed -->

            <!-- Display place data -->
            <h2>Place Details</h2>
            <p>Place ID: <%= placeData[0] %></p>
            <p>Place Name: <%= placeData[3] %></p>
            <p>Description: <%= placeData[1] %></p>
            <p>Location: <%= placeData[2] %></p>
            
            <!-- Add other place properties if needed -->

            <!-- Display package data -->
            <h2>Package Details</h2>
            <p>Package ID: <%= packageData[0] %></p>
            <p>Activities: <%= packageData[1] %></p>
            <p>Accommodation: <%= packageData[2] %></p>
            <p>Price: $<%= packageData[3] %></p>
            <p>Duration: <%= packageData[4] %> days and <%= packageData[5] %> nights</p>
            <!-- Add other package properties if needed -->

            <!-- Add your form for additional booking details if needed -->
            <form action="confirmBookingServlet" method="post">
                <!-- Add hidden input fields for user, place, and package IDs -->
                <input type="hidden" name="userId" value="<%= userData[0] %>">
                <input type="hidden" name="placeId" value="<%= placeData[0] %>">
                <input type="hidden" name="packageId" value="<%= packageData[0] %>">

                <!-- Add additional input fields for booking details -->

                <button type="submit">Confirm Booking</button>
            </form>

        <% 
            } else {
        %>
            <script>
                window.location.href = "logout";
            </script>
        <% 
            }
        %>
    </div>
</body>
</html>
