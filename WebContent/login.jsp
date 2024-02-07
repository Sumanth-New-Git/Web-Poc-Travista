<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
   <script src="/js/sessionHandler.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>

<section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-md-8 col-lg-7 col-xl-6">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
                     class="img-fluid" alt="Phone image">
            </div>
            <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                <form action="${pageContext.request.contextPath}/loginServlet" method="post" id="loginForm"> <!-- Add an ID to the form for easier selection -->
                    <!-- Email input --> 
                    <div class="form-group">
                        <label for="form1Example13">Email address</label>
                        <input type="email" id="form1Example13" name="email" class="form-control form-control-lg"/>
                    </div>

                    <!-- Password input -->
                    <div class="form-group">
                        <label for="form1Example23">Password</label>
                        <input type="password" id="form1Example23" name="password" class="form-control form-control-lg"/>
                    </div>

                    <div class="d-flex justify-content-around align-items-center mb-4">
                        <!-- Checkbox -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="form1Example3" checked/>
                            <label class="form-check-label" for="form1Example3"> Remember me </label>
                        </div>
                        
                    </div>

                    <!-- Submit button -->
                    <button type="button" class="btn btn-primary btn-lg btn-block" onclick="validateForm()">Sign in</button>

                    <div class="divider d-flex align-items-center my-4">
                        <p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
                    </div>

                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998" href="#!"
                       role="button">
                        <i class="fab fa-facebook-f me-2"></i>Continue with Facebook
                    </a>
                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee" href="#!"
                       role="button">
                        <i class="fab fa-twitter me-2"></i>Continue with Twitter</a>
                </form>
            </div>
        </div>
    </div>
</section>
<!-- Add this script for client-side validation -->
<script>
    function validateForm() {
        const form = document.getElementById("loginForm");

        // Validate email
        const emailInput = document.getElementById("form1Example13");
        if (!validateEmail(emailInput.value)) {
            alert("Please enter a valid email address.");
            return;
        }

        // Validate password (you can add more complex validation if needed)
        const passwordInput = document.getElementById("form1Example23");
        if (passwordInput.value.length < 6) {
            alert("Password must be at least 6 characters.");
            return;
        }

        // If all validations pass, submit the form
        form.submit();
    }

    function validateEmail(email) {
        // Simple email validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }
</script>

</body>
</html>
