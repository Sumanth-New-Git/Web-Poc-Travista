
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Place</title>
    <link rel="stylesheet" type="text/css" href="css/addPlace.css">
<script src="/js/sessionHandler.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
    <script>
            function addPackage() {
            	
            	
            	
            var packageCount = document.getElementById("packageCount").value;
            var newPackageCount = parseInt(packageCount) + 1;

            var packageSection = document.getElementById("packageSection");

            var newPackageDiv = document.createElement("div");
            newPackageDiv.innerHTML = "<h3>Package " + newPackageCount + "</h3>" +
                "<label for='activities_" + newPackageCount + "'>Activities:</label>" +
                "<input type='text' id='activities_" + newPackageCount + "' name='activities_" + newPackageCount + "' required><br>" +
                "<label for='accommodation_" + newPackageCount + "'>Accommodation:</label>" +
                "<input type='text' id='accommodation_" + newPackageCount + "' name='accommodation_" + newPackageCount + "' required><br>" +
                "<label for='price_" + newPackageCount + "'>Price:</label>" +
                "<input type='number' id='price_" + newPackageCount + "' name='price_" + newPackageCount + "' step='0.01' required><br>" +
                "<label for='number_of_days_" + newPackageCount + "'>Number of Days:</label>" +
                "<input type='number' id='number_of_days_" + newPackageCount + "' name='number_of_days_" + newPackageCount + "' required><br>" +
                "<label for='number_of_nights_" + newPackageCount + "'>Number of Nights:</label>" +
                "<input type='number' id='number_of_nights_" + newPackageCount + "' name='number_of_nights_" + newPackageCount + "' required><br>";

            packageSection.appendChild(newPackageDiv);

            document.getElementById("packageCount").value = newPackageCount;
        }
    </script>
</head>
<body>

    
    <form action="addPlace" method="post" enctype="multipart/form-data">
    <h2>Add New Place</h2>
        <!-- Place Information -->
        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" cols="50"></textarea>
        <br>
        <label for="location">Location:</label>
        <input type="text" id="location" name="location" required>
        <br>
        <label for="place_name">Place Name:</label>
        <input type="text" id="place_name" name="place_name" required>
        <br>

        <!-- Image Upload -->
        <label for="image1">Image 1:</label>
        <input type="file" id="image1" name="image1" accept="images/*">
        <br>

        <!-- Package Information - Package 1 -->
        <div id="packageSection">
            <h3>Package 1</h3>
            <label for="activities_1">Activities:</label>
            <input type="text" id="activities_1" name="activities_1" required>
            <br>
            <label for="accommodation_1">Accommodation:</label>
            <input type="text" id="accommodation_1" name="accommodation_1" required>
            <br>
            <label for="price_1">Price:</label>
            <input type="number" id="price_1" name="price_1" step="0.01" required>
            <br>
            <label for="number_of_days_1">Number of Days:</label>
            <input type="number" id="number_of_days_1" name="number_of_days_1" required>
            <br>
            <label for="number_of_nights_1">Number of Nights:</label>
            <input type="number" id="number_of_nights_1" name="number_of_nights_1" required>
            <br>
        </div>

        <!-- Add Package Button -->
        <input type="button" value="Add Package" onclick="addPackage()">

        <!-- Hidden field to keep track of package count -->
        <input type="hidden" id="packageCount" name="packageCount" value="1">
<br>
<br>
        <!-- Submit Button -->
        <input type="submit" value="Add Place">
    </form>
   
</body>
</html>
