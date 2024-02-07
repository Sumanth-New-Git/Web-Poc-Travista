package com.travista;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

//import com.mysql.cj.Session;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/placeServlet")
public class placeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        Connection connection = null;
        
        try {
            String userId = request.getParameter("userId");
            String placeId = request.getParameter("placeId");
            //String selectedPackageId = request.getParameter("selectedPackage");

            
            String selectedPackageId = null;
            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
                if (paramName.startsWith("packageId_")) {
                    selectedPackageId = request.getParameter(paramName);
                    break;  // Break the loop once the first matching parameter is found
                }
            }
            
            
            
            
            
            
            String[] userData = fetchUserData(userId);

            String[] placeData = fetchPlaceData(placeId);

            String[] packageData = fetchPackageData(selectedPackageId);

            
            request.setAttribute("userData", userData);
            request.setAttribute("placeData", placeData);
            request.setAttribute("packageData", packageData);
            
            String forwardUrl = "book.jsp?userId=" + userId + "&placeId=" + placeId + "&selectedPackageId=" + selectedPackageId;
            //response.sendRedirect(forwardUrl);
            RequestDispatcher dispatcher = request.getRequestDispatcher(forwardUrl);
            
            
         dispatcher.forward(request, response);
            
        } finally {
            // Close the connection
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

   
    private String[] fetchUserData(String userId) {
        Connection connection = null;
        String[] userData = new String[3];

        try {
            connection = DBConnection.getConnection();

            String userQuery = "SELECT id, username, email FROM users WHERE id = ?";
            try (PreparedStatement userStatement = connection.prepareStatement(userQuery)) {
                userStatement.setString(1, userId);
                try (ResultSet userResult = userStatement.executeQuery()) {
                    if (userResult.next()) {
                        userData[0] = userResult.getString("id");
                        userData[1] = userResult.getString("username");
                        userData[2] = userResult.getString("email");
                        // Add other user properties if needed
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userData;
    }

   
    private String[] fetchPlaceData(String placeId) {
        Connection connection = null;
        String[] placeData = new String[4];

        try {
            connection = DBConnection.getConnection();

            String placeQuery = "SELECT place_id, description, location,place_name FROM place WHERE place_id = ?";
            try (PreparedStatement placeStatement = connection.prepareStatement(placeQuery)) {
                placeStatement.setString(1, placeId);
                try (ResultSet placeResult = placeStatement.executeQuery()) {
                    if (placeResult.next()) {
                        placeData[0] = placeResult.getString("place_id");
                        placeData[1] = placeResult.getString("description");
                        placeData[2] = placeResult.getString("location");
                        placeData[3] = placeResult.getString("place_name");

                        // Add other place properties if needed
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return placeData;
    }

    
    private String[] fetchPackageData(String packageId) {
        Connection connection = null;
        String[] packageData = new String[6];

        try {
            connection = DBConnection.getConnection();

            String packageQuery = "SELECT package_id, activities, accommodation, price, number_of_days, number_of_nights FROM packages WHERE package_id = ?";
            try (PreparedStatement packageStatement = connection.prepareStatement(packageQuery)) {
                packageStatement.setString(1, packageId);
                try (ResultSet packageResult = packageStatement.executeQuery()) {
                    if (packageResult.next()) {
                        packageData[0] = packageResult.getString("package_id");
                        packageData[1] = packageResult.getString("activities");
                        packageData[2] = packageResult.getString("accommodation");
                        packageData[3] = String.valueOf(packageResult.getDouble("price"));
                        packageData[4] = String.valueOf(packageResult.getInt("number_of_days"));
                        packageData[5] = String.valueOf(packageResult.getInt("number_of_nights"));
                        // Add other package properties if needed
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        
    
   
    return packageData;
    }
}
