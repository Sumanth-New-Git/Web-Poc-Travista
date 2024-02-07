<!DOCTYPE html>
<html lang="en">
<% String username = (String) session.getAttribute("username"); %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/header-responsive.css" media="screen and (max-width: 768px)">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="/js/sessionHandler.js"></script>
    <title>TRAVISTA - Explore and Book</title>
</head>

<body>
    <!-- Header Section -->
    <header>
        <div class="header-container">
            <div class="logo">
            <% if ("admin".equals(username)) { %>
            <a href="adminHome.jsp">T</a>
            <%} 
            else{ %>
            <a href="main.jsp" >T</a>
            <%} %>
            </div>
            <div class="title">TRAVISTA</div>
            
            <div class="nav-buttons">
                
                <p class="user-greeting">
                    <% 
                    
                    if (username != null) { %>
                        Hello <%= username %>
                    <% }
                    
                    else
                    {        response.sendRedirect("Home.jsp");

                    }%>
                </p>
                
                        
                
               
                <% if (!"admin".equals(username)) { %>
                    <!-- Display Bookings button only if the user is not an admin -->
                    <a href="bookings">Bookings</a>
                <% } %>
                <a href="javascript:void(0);" onclick="scrollToFooter()">About</a>
                <a href="javascript:void(0);" class="toggle-menu" onclick="toggleNavMenu()">Hide Buttons</a>
                <a <%if ("admin".equals(username)) { %> href="logout" <%} else{ %> href="logout" <%} %> class="logout-button">Logout</a>
                
            </div>
            <a href="javascript:void(0);" class="unhide-button" style="display: none;" onclick="toggleNavMenu()">Unhide Buttons</a>
            
        </div>
        <div class="header-container">
        <p id="demo"></p> 
        </div>
    </header>

    <script>
    
    setInterval(myTimer, 1000);

    function myTimer() {
      const d = new Date();
      document.getElementById("demo").innerHTML = "Time is "+d.toLocaleTimeString();
    }
    
    
    
        // Function to scroll to the footer
        function scrollToFooter() {
            $('html, body').animate({
                scrollTop: $('#contactUs').offset().top
            }, 800);
        }

        // Toggle navigation menu on small screens
        function toggleNavMenu() {
            var navButtons = document.querySelector('.nav-buttons');
            var unhideButton = document.querySelector('.unhide-button');

            if (navButtons.style.display === 'flex') {
                // Buttons are visible, hide them
                navButtons.style.display = 'none';
                unhideButton.style.display = 'block';
            } else {
                // Buttons are hidden, show them
                navButtons.style.display = 'flex';
                unhideButton.style.display = 'none';
            }
        }
    </script>

    <!-- Add the "unhide" button initially hidden -->
    <a href="javascript:void(0);" class="unhide-button" style="display: none;" onclick="toggleNavMenu()">Buttons</a>
</body>

</html>
