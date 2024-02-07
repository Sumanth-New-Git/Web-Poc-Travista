package com.travista;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    PrintWriter out=response.getWriter();
    out.println("<html>");
    out.println("<body>");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try (Connection connection = DBConnection.getConnection()) {
            if (isUserExists(connection, email, password)) {
                // Store user ID in session
                String userId = getUserId(connection, email);
                String username = getUsername(connection, email);

                HttpSession session = request.getSession();
                session.setAttribute("userId", userId);
                session.setAttribute("username", username);
                session.setMaxInactiveInterval(10 * 60);

                if ("admin".equals(username)) {
            	   //RequestDispatcher rd = request.getRequestDispatcher("adminHome.jsp");
            	   //rd.forward(request, response);
                	response.sendRedirect("adminHome.jsp");
                   
                }
               else {
            	   response.sendRedirect("main.jsp");
//            	   RequestDispatcher rds = request.getRequestDispatcher("main.jsp");
//                   rds.forward(request, response);
               }
               }
             else {
                System.out.println("Entered email or password is wrong");

            	out.println("<h1>Entered email or password is wrong</h1>");
            	out.print("<h2>");
            	out.print("<a href=\'login.jsp\'> go back</a></h2>");
            
            }
            out.println("</html>");
        } catch (Exception e) {
            e.printStackTrace();

        }

    }

    private boolean isUserExists(Connection connection, String email, String password) {
        try {
            String sql = " select * from users where email=?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, email);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {

                    if (resultSet.next()) {
                        String validPassword = resultSet.getString("password");

                        if (validPassword.equals(password)) {
                            return true;
                        }

                    }
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private String getUserId(Connection connection, String email) {
        try {
            String sql = "SELECT id FROM users WHERE email=?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, email);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        return resultSet.getString("id");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    private String getUsername(Connection connection, String email) {
        try {
            String sql = "SELECT username FROM users WHERE email=?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, email);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        return resultSet.getString("username");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

