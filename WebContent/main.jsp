<!DOCTYPE html>
<html lang="en">
<!-- Include jQuery if not already included -->

<!-- Include the sessionHandler.js file -->

<%@ include file="header.jsp" %>
<head>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/main.css">
 <script src="/js/sessionHandler.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<body>

	<% String userId = (String) session.getAttribute("userId"); %>
	<%String name=(String)session.getAttribute("username"); %>
    <% if("admin".equals(name))  
	{  response.sendRedirect("adminHome.jsp");
	} %>
    <!-- Add the search bar here -->
    

    <!-- Main Content Section -->
    <div class="main-container">
        <div class="main">
            <!-- Row 1: Places and Restaurants -->
            <div class="row">
                <div class="column">
                    <a href="place.jsp?placeId=1&userId=<%= userId %>">
                        <img src="images/1.jpg" alt="Explore Places">
                        <h3>Place 1</h3>
                    </a>
                </div>
                <div class="column">
                    <a href="place.jsp?placeId=2&userId=<%= userId %>">
                        <img src="images/2.jpg" alt="Explore Places">
                        <h3>Place 2</h3>
                    </a>
                </div>
                <div class="column">
                    <a href="place.jsp?placeId=3&userId=<%= userId %>">
                        <img src="images/3.jpg" alt="Explore Places">
                        <h3>Place 3</h3>
                    </a>
                </div>
            </div>

            <!-- Row 2: Additional Places -->
            <div class="row">
                <div class="column">
                    <a href="place.jsp?placeId=4&userId=<%= userId %>">
                        <img src="images/4.jpg" alt="Discover Places 1">
                        <h3>Places 4</h3>
                    </a>
                </div>
                <div class="column">
                    <a href="place.jsp?placeId=5&userId=<%= userId %>">
                        <img src="images/5.jpg" alt="Discover Places 2">
                        <h3>Places 5</h3>
                    </a>
                </div>
                <div class="column">
                    <a href="place.jsp?placeId=6&userId=<%= userId %>">
                        <img src="images/6.jpg" alt="Discover Places 3">
                        <h3>Place 6</h3>
                    </a>
                </div>
            </div>

            <!-- Row 3: More Places -->
            <div class="row">
                <div class="column">
                    <a href="place.jsp?placeId=7&userId=<%= userId %>">
                        <img src="images/7.jpg" alt="Explore Places 4">
                        <h3>Place 7</h3>
                    </a>
                </div>
                <div class="column">
                    <a href="place.jsp?placeId=8&userId=<%= userId %>">
                        <img src="images/8.jpg" alt="Discover Places 4">
                        <h3>Places 8</h3>
                    </a>
                </div>
                <div class="column">
                    <a href="place.jsp?placeId=9&userId=<%= userId %>">
                        <img src="images/9.jpg" alt="Discover Places 5">
                        <h3>Place 9</h3>
                    </a>
                </div>
            </div>
            <!-- Add more rows and columns as needed -->
        </div>
        
        
        
    </div>
    <!-- Main Content Section -->
<%@ include file="footer.jsp" %>
</body>

</html>
