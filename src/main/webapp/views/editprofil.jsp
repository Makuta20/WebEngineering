<%@ page import="at.ac.tuwien.big.we16.ue2.Model.User" %><%--
  Created by IntelliJ IDEA.
  User: RaduV
  Date: 23-Apr-16
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = ((User)session.getAttribute("user"));

    user.setFirstName(request.getParameter("firstname"));
    user.setLastName(request.getParameter("lastname"));

    response.sendRedirect("overview.jsp");
%>
