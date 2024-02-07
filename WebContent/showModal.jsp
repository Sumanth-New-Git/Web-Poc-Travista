<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>TRAVISTA - Explore and Book</title>
    <link rel="stylesheet" href="./css/showModal.css">
    
</head>

<body>
    <!-- Modal -->
    <div class="modal">
        <p>Please Login/Signup to continue</p>
        <div class="modal-buttons">
            <button class="ok-button" onclick="redirectToHome()">OK</button>
        </div>
    </div>

    <script>
        // Function to handle OK button click
        function redirectToHome() {
//alert('Redirecting to Home.jsp');
            window.location.href = 'Home.jsp';
        }
    </script>
</body>

</html>
