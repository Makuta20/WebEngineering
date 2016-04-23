package at.ac.tuwien.big.we16.ue2.Controller;

import at.ac.tuwien.big.we16.ue2.Model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by RaduV on 22-Apr-16.
 */
public class LoginServlet extends HttpServlet{


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        HttpSession session = request.getSession(true);

        User user = new User(request.getParameter("email"), request.getParameter("password"));

        session.setAttribute("user", user);

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/overview.html");
        requestDispatcher.forward(request, response);
    }




}
