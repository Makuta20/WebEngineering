<%--
  Created by IntelliJ IDEA.
  User: Rares
  Date: 23-Apr-16
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*"%>
<%@ page import="at.ac.tuwien.big.we16.ue2.Model.User" %>
<%
    //String user = request.getParameter("email");
    //session = request.getSession(true);

    User user = new User(request.getParameter("email"), request.getParameter("password"));

    session.setAttribute("user", user);
    System.out.print(user.toString());
    response.sendRedirect("overview.jsp");
%>
