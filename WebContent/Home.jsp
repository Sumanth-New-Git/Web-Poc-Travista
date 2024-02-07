<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="./css/home.css">
    <link rel="stylesheet" href="./css/home-header-responsive.css" media="screen and (max-width: 768px)">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
    
    <title>TRAVISTA - Explore and Book</title>
    </head>

<body>
    <!-- Header Section -->
    <header>
        <div class="header-container">
            <div class="logo">T</div>
            <div class="title">TRAVISTA</div>
            <div class="nav-buttons">
                <a href="login.jsp">Login</a> <a href="register.jsp">SignUp</a>                 
                <a href="javascript:void(0);" onclick="scrollToFooter()">About</a>

</div>
        </div>
    </header>
    <script>
    function scrollToFooter() {
        $('html, body').animate({
            scrollTop: $('#contactUs').offset().top
        }, 800);
    }
    </script>

    <!-- Add the search bar here -->
    <br>
    <br>
   <!--   <div class="search-bar">
        <input type="text" placeholder="Search for places...">
        <button>Search</button>
    </div>

    <!-- Main Content Section -->
    <div class="main-container">
        <div class="main">
            <!-- Row 1: Places and Restaurants -->
            <div class="row">
                <div class="column">
                    <a href="showModal.jsp">
                        <img src="images/2.jpg" alt="Explore Places">
                        <h3>Place 1</h3>
                    </a>
                </div>
                <div class="column">
                    <a href="showModal.jsp">
                        <img src="images/3.jpg" alt="Explore Places">
                        <h3>Place 2</h3>
                    </a>
                </div>
                <div class="column">
                    <a href="showModal.jsp">
                        <img src="images/8.jpg" alt="Explore Places">
                        <h3>Place 3</h3>
                    </a>
                </div>
            </div>

            <!-- Row 2: Beaches and Mountains -->

            </div>
            <!-- Add more rows as needed -->
        </div>
<br>
<br>
<br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br>
<%@ include file="footer.jsp" %>


    <!-- Main Content Section -->

</body>

</html>