<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<!-- Include jQuery if not already included -->

<!-- Include the sessionHandler.js file -->


<head>
    <link rel="stylesheet" href="./css/place.css">
<script src="/js/sessionHandler.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
</head>
<body>
    <!-- Place Details Form -->
    <% String userId = (String) session.getAttribute("userId"); %>
    <% String placeId = request.getParameter("placeId"); %>
    <form action="placeServlet" method="get">
        <div class="place-details">
        <input type="hidden" name="userId" value="<%= userId %>">
            <input type="hidden" name="placeId" value="<%= placeId %>">
            <%
             

            // Retrieve placeId from query parameter

                // Generate dynamic content based on placeId
                String imagePath = "images/" + placeId + ".jpg";
                String imagePath2 = "images/" + placeId + "_2.jpg";
                String imagePath3 = "images/" + placeId + "_3.jpg";

                // Connection details for your database (replace with your actual values)
                String dbUrl = "jdbc:mysql://localhost:3306/travista?useSSL=false";
                String dbUser = "root";
                String dbPassword = "Sumanth@sql123";

                // Declare variables to store retrieved data
                String description = "";
                String location = "";
                String placeName = ""; // New variable for place name

                // Retrieve place details from the database
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                    // Retrieve place details
                    String placeQuery = "SELECT description, location, place_name FROM place WHERE place_id = ?";
                    PreparedStatement placeStatement = connection.prepareStatement(placeQuery);
                    placeStatement.setString(1, placeId);
                    ResultSet placeResult = placeStatement.executeQuery();

                    if (placeResult.next()) {
                        description = placeResult.getString("description");
                        location = placeResult.getString("location");
                        placeName = placeResult.getString("place_name"); // Fetch place name
                    }

                    placeResult.close();
                    placeStatement.close();

                    // Retrieve package details (adjust the package query based on your schema)
                    String packageQuery = "SELECT package_id, activities, accommodation, price, number_of_days, number_of_nights FROM packages WHERE place_id = ?";
                    PreparedStatement packageStatement = connection.prepareStatement(packageQuery);
                    packageStatement.setString(1, placeId);
                    ResultSet packageResult = packageStatement.executeQuery();
            %>
			
            <!-- Display existing content -->
            <h2><%= placeName %></h2> <!-- Display the dynamic place name -->
            <div class="image-container">
                <div class="lightbox-trigger">
                    <img src="<%= imagePath %>" alt="Place Image">
                </div>
                <div class="lightbox-trigger">
                    <img src="<%= imagePath2 %>" alt="Related Image 1">
                </div>
                <div class="lightbox-trigger">
                    <img src="<%= imagePath3 %>" alt="Related Image 2">
                </div>
            </div>
            <div class="place-info">
                <p><strong>Description:</strong> <%= description %></p>
                <p><strong>Location:</strong> <%= location %></p>
            </div>
            <div class="package-details">
                <h3>PACKAGE DETAILS</h3>
              <div class="tb"> <table>
               <tr>
            <th>Activities</th>
            <th>Accommodation</th>
            <th>Price</th>
            <th>Duration</th>
            <th>Select</th>
        </tr>
                    <!-- Display radio buttons for packages -->
                    <% while (packageResult.next()) { %>
                        <tr>
                <td><%= packageResult.getString("activities") %></td>
                <td><%= packageResult.getString("accommodation") %></td>
                <td>$<%= packageResult.getDouble("price") %></td>
                <td><%= packageResult.getInt("number_of_days") %> days and <%= packageResult.getInt("number_of_nights") %> nights</td>
                <td>
                    <input type="radio" name="selectedPackage" value="<%= packageResult.getInt("package_id") %>" required>
                    <input type="hidden" name="packageId_<%= packageResult.getInt("package_id") %>" value="<%= packageResult.getInt("package_id") %>">
                    
                </td>
            </tr>
                    <% } %>
                
                </table>
                </div> 
            </div>
            <button type="submit" name="action" value="bookNow">Book Now</button>
            
            
            <%
                    packageResult.close();
                    packageStatement.close();

                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
           %>
        </div>
           
        
    </form>
    
    
</body>
</html>
