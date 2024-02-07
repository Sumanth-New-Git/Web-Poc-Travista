package com.travista;

//package com.app;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Perform logout actions (e.g., invalidate session)
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Remove the session ID cookie
        Cookie sessionCookie = new Cookie("sessionID", "");
        sessionCookie.setMaxAge(0); // Set the cookie's max age to 0 to delete it
        response.addCookie(sessionCookie);

        // Redirect to the login page or any other appropriate page
        response.sendRedirect("Home.jsp");
        
    }
}
