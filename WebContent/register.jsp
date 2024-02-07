<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>

    <link rel="stylesheet" href="css/register.css">
    
    
    
</head>
<body >
    <div class="register-container">
        <h2>New Email Registration</h2>
        <form onsubmit="return validateForm();" action="register" method="post" ">
            <input type="text" name="username" placeholder="Username" id="name" required>
            <input type="email" name="email" placeholder="Email Address" id="email" required>
            <input type="password" name="password" placeholder="Password(enter App passoword)" id="password" required>
            <input type="password" name="confirmPassword" placeholder="Confirm Password" id="confirmPassword" required>

            <div class="input-group">
                <!-- Use input type="date" for the calendar option -->
                <input type="date" name="dob" placeholder="Date of Birth" required>
                <input type="text" name="phone" placeholder="Phone Number" required>
            </div>

            <div class="input-group">
                <input type="text" name="age" placeholder="Age" required>
                <div class="checkbox-group">
                    <!-- Use input type="checkbox" for gender selection -->
                    <label><input type="radio" name="gender" value="male"> Male</label>
                    <label><input type="radio" name="gender" value="female"> Female</label>
                </div>
            </div>

            <button type="submit">Register</button>
        </form>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
    <script>
    
    function validateForm(){
    var name=document.getElementById("name");
    var email=document.getElementById("email");
    var password=document.getElementById("password");
    var confirmPassword=document.getElementById("confirmPassword");
    
    if(name.value.trim()=="admin")
    	{
    	alert("cant add admin.You need to add directly in database");
    	return false;
    	}
    if(name.value.trim()==""){
    	alert("Blank Username");
        return false;	
    }
    else if(email.value.trim()=="")	{
    alert("Blank email");
    return false;
    }
    
    else if(password.value.trim()=="") {
    	alert("Blank Password");
    	return false;
    } 	
    	
    else if(password.value.trim().length<6){
    alert("Minimum Password Length Expected is 6 ")
    return false;
    }
   
    else if(password.value.trim()!=confirmPassword.value.trim()){
    	alert("password and confirm password do not match");
    	return false;
    }
    else{
    	return true;
    	}
    }
    
    
    </script>
</body>
</html>